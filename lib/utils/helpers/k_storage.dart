import 'package:okito/okito.dart';

class KStorage {
  KStorage._internal();
  static final KStorage _singleton = KStorage._internal();

  factory KStorage() {
    return _singleton;
  }

  void init() {
    OkitoStorage.init(storageName: "arc_open_data");
  }

  bool contains(String key) {
    return this.read(key: key) != null;
  }

  void remove(String key) {
    OkitoStorage.removeKey(key);
  }

  void write<T>({required String key, required T value}) {
    OkitoStorage.write(key, value);
  }

  T? read<T>({required String key}) {
    return OkitoStorage.read<T>(key);
  }
}
