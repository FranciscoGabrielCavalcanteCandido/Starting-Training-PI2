import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:starting_training/app/model/sqlite/conexao.dart';

void main() async {
  late Database db;

  setUp(() async {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
    String path = join(await getDatabasesPath(), 'banco.db');
    db = await Conexao.getConexao();
  });

  tearDownAll(() {
    db.close();
  });

  group("Testando classe conexão", () {
    test("testeando conexão aberta", () {
      expect(db.isOpen, true);
    });
  });
}
