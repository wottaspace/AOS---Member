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

  void write({required String key, required String value}) {
    OkitoStorage.write(key, value);
  }

  T? read<T>({required String key}) {
    return OkitoStorage.read<T>(key);
  }
}
