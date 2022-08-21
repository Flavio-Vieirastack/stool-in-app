import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:stool_in/core/cache/cache_datasource_helper.dart';
import 'package:stool_in/core/module/permanent_dependencies/permanent_module.dart';

class CachedDatasourceHelperModule extends PermanentModule {
  @override
  List<SingleChildWidget> inject() {
    return [
      Provider(
        create: (context) => CacheDatasourceHelper(),
      )
    ];
  }
}
