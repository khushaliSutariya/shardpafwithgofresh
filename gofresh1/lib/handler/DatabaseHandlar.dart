// import 'dart:io';
//
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
//
// class DatabaseHandlar {
//   Database? db;
//   Future<Database> create_db() async {
//     if (db != null) {
//       return db!;
//     } else {
//       Directory dir = await getApplicationDocumentsDirectory();
//       String dbpath = join(dir.path, "gofresh");
//       var db = await openDatabase(dbpath, version: 1, onCreate: create_tables);
//       return db!;
//     }
//   }
//
//   create_tables(Database db, int version) {
//     db.execute(
//         "create table products (pid integer primary key autoincrement,product text)");
//   }
//
//   Future<int> insertproduct(allproduct) async {
//     var idb = await create_db();
//     var id =
//         await idb.rawInsert("insert into product (allproduct) values (?)", [allproduct]);
//     return id;
//   }
//
//   viewproduct() async {
//     var vdb = await create_db();
//   }
// }
