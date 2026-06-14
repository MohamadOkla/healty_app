class LocalStorageService {
  LocalStorageService._();

  static final LocalStorageService instance = LocalStorageService._();

  final Map<String, Object?> _storage = <String, Object?>{};

  bool getBool(String key, {bool defaultValue = false}) {
    final value = _storage[key];
    return value is bool ? value : defaultValue;
  }

  String? getString(String key) {
    final value = _storage[key];
    return value is String && value.isNotEmpty ? value : null;
  }

  Future<void> setBool(String key, bool value) async {
    _storage[key] = value;
  }

  Future<void> setString(String key, String value) async {
    _storage[key] = value;
  }

  Future<void> remove(String key) async {
    _storage.remove(key);
  }

  Future<void> clear() async {
    _storage.clear();
  }
}
