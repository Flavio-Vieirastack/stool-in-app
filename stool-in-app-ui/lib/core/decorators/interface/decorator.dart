abstract class Decorator<V>  {
 Future<void> saveInCache({required V entity});
  Future<V> getInCache();
}
