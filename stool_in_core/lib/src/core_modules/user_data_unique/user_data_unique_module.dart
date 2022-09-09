import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:stool_in_core/stool_in_core.dart';
import 'package:stool_in_logic/stool_in_logic.dart';

class UserDataUniqueModule implements PermanentModule {
  @override
  List<SingleChildWidget> inject() {
    return [
      Provider<CalculateDistanceForUserDataUnique>(
        create: (context) => CalculateDistanceForUserDataUnique(
          distanceHelperCalculate:
              Inject<DistanceHelperCalculate>(context).get(),
        ),
      ),
      Provider<UserDataUniqueDatasource>(
        create: (context) => UserDataUniqueDatasourceImpl(
          restClientGet: Inject<RestClientGet>(context).get(),
          restClientPatch: Inject<RestClientPatch>(context).get(),
          calculateDistanceForUserDataUnique:
              Inject<CalculateDistanceForUserDataUnique>(context).get(),
        ),
      ),
      Provider<UserDataUniqueRepository>(
        create: (context) => UserDataUniqueRepositoryImpl(
          userDataUniqueDatasource:
              Inject<UserDataUniqueDatasource>(context).get(),
        ),
      ),
      Provider<UserDataUniqueUsecase>(
        create: (context) => UserDataUniqueUsecaseImpl(
          userDataUniqueRepository:
              Inject<UserDataUniqueRepository>(context).get(),
        ),
      ),
    ];
  }
}
