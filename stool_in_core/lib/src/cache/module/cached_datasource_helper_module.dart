import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../module/permanent_dependencies/permanent_module.dart';
import '../helpers/decoded_list_cache_helper.dart';



class CachedDatasourceHelperModule extends PermanentModule {
  @override
  List<SingleChildWidget> inject() {
    return [
      Provider(
        create: (context) => DecodedListCacheHelper(),
      )
    ];
  }
}
