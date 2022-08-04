abstract class ReadLocalSecurityStorage {
  Future<String?> read({required String key});
}

abstract class WriteLocalSecurityStorage {
  Future<void> write({required String key, required String value});
}

abstract class ContainsLocalSecurityStorage {
  Future<bool> contains({required String key});
}

abstract class ClearLocalSecurityStorage {
  Future<bool> clearAll();
}

abstract class RemoveLocalSecurityStorage {
  Future<bool> delete({required String key});
}
