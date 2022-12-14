import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../module/permanent_dependencies/permanent_module.dart';
import '../rest_client_contracts.dart';
import '../rest_client_mehods.dart';




class RestClientModule implements PermanentModule {
  @override
  List<SingleChildWidget> inject() {
    return [
      Provider<RestClientRequest>(
        create: (context) => RestClientResquestImpl(),
      ),
      Provider<RestClientPatch>(
        create: (context) => RestClientPatchImpl(),
      ),
      Provider<RestClientDelete>(
        create: (context) => RestClientDeleteImpl(),
      ),
      Provider<RestClientPut>(
        create: (context) => RestClientPutImpl(),
      ),
      Provider<RestClientPost>(
        create: (context) => RestClientPostImpl(),
      ),
      Provider<RestClientGet>(
        create: (context) => RestClientGetImpl(),
      ),
    ];
  }
}
