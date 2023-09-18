import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import '../model/employee.dart';

class DBHelper {
  static Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "test.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _create)
    return theDb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
      "CREATE TABLE EMPLOYEE(id ) INTEGER PRIMARY KEY, firstname TEXT, lastname TEXT, mobileno TEXT"
    );
    print("Created table");
  }
  Future<List<Employee>> getEmployees() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM Employee');
    List<Employee> employees = [];
    for (int i = 0; i < list.length; i++) {
      employees.add( Employee(firstName: list[i]["firstname"], lastName: list[i]["lastname"], mobileNo:list[i]["mobileno"] , emailId: list[i]["emailno"]));
    }
    print(employees.length);
    return employees;
  }

  void saveEmployees(Employee employee) async {
    var dbClient = await db;
    await dbClient.transaction((txn) async {
      return await txn.rawInsert(
                          'INSERT INTO Employee(firstname, lastname, mobileno, emailid ) VALUES(' +
                        '\'' +
                        employee.firstName +
                        '\'' +
                        ',' +
                        '\'' +
                        employee.lastName +
                        '\'' +
                        ',' +
                        '\'' +
                        employee.mobileNo +
                        '\'' +
                        ',' +
                        '\'' +
                        employee.emailId +
                        '\'' +
                        ')');
      });
  }
}
