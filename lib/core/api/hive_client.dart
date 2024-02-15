import 'package:hive_flutter/hive_flutter.dart';

abstract base class HiveClient<T extends dynamic> {
  final String boxName;
  HiveClient(this.boxName);
  Box<T>? box;
  Future<void> init() async {
    registerAdapters();
    if (!(box?.isOpen ?? false)) {
      box = await Hive.openBox(boxName);
    }
  }

  void registerAdapters() {}

  Future<void> save(dynamic key, T data) async {
    await box?.put(key, data);
  }

  T? read(String key) {
    return (box?.isOpen ?? false) ? box?.get(key) : null;
  }

  Future<void> write(String key, dynamic value) async {
    if (box?.isOpen ?? false) {
      await box?.put(key, value);
    }
  }

  Future<void> saveAll(List<T> data) async {
    await box?.putAll({for (final e in data) e.hashCode: e});
  }

  List<T> readAll() {
    return box?.values.toList() ?? [];
  }

  Future<void> delete(dynamic key) async {
    await box?.delete(key);
  }

  Future<void> clear() async {
    await box?.clear();
  }

  Stream<BoxEvent>? watch([String? key]) {
    return box?.watch(key: key);
  }

  Future<void> close() async {
    await box?.close();
  }

  bool isAdapterRegistered(int adapterId) {
    return Hive.isAdapterRegistered(adapterId);
  }

  void registerAdapter<A>(
    TypeAdapter<A> adapter, {
    bool internal = false,
    bool override = false,
  }) {
    Hive.registerAdapter<A>(adapter, internal: internal, override: override);
  }
}
