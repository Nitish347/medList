import 'package:flutter/cupertino.dart';
import 'package:medlist/Providers/DataProvider.dart';
import 'package:medlist/models/medicine_model.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import '../models/alarm_info.dart';

const String tableAlarm = 'alarm';
const String columnId = 'id';
const String columnTitle = 'title';
const String columnDateTime = 'alarmDateTime';
const String columnPending = 'isPending';

class MedicineSave {
  static Database? _database;
  static MedicineSave? _alarmHelper;

  MedicineSave._createInstance();
  factory MedicineSave() {
    _alarmHelper ??= MedicineSave._createInstance();
    return _alarmHelper!;
  }

  Future<Database> get database async {
    _database ??= await initializeDatabase();
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    var dir = await getDatabasesPath();
    var path = dir + "alarm.db";

    var database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          create table $tableAlarm ( 
          $columnId integer primary key autoincrement, 
          $columnTitle text not null,
          $columnDateTime text not null,
          )
        ''');
      },
    );
    return database;
  }

  void insertAlarm(MedicineModel medicineModel, BuildContext context) async {
    var provider = Provider.of<DataProvider>(context, listen: false);
    var db = await this.database;
    for (int i = 0; i < provider.medicinesList!.length; i++) {
      delete(provider.medicinesList![i].id);
    }
    print("inseritng...........................................");
    var result = await db.insert(tableAlarm, medicineModel.toMap());
    print('result : $result');
  }

  Future<List<MedicineModel>> getAlarms(BuildContext context) async {
    print("fetching data from db******************************");
    var provider = Provider.of<DataProvider>(context, listen: false);
    List<MedicineModel> _alarms = [];

    var db = await this.database;
    var result = await db.query(tableAlarm);
    result.forEach((element) {
      var alarmInfo = MedicineModel.fromMap1(element);
      _alarms.add(alarmInfo);
    });
    print(_alarms);
    provider.medicinesListUpdate(_alarms);

    return _alarms;
  }

  Future<void> deleteAll(List<MedicineModel> _alarms) async {
    print("deleting..........................");
    for (int i = 0; i < _alarms.length; i++) {
      delete(_alarms[i].id);
    }
  }

  Future<int> delete(int? id) async {
    var db = await this.database;
    return await db.delete(tableAlarm, where: '$columnId = ?', whereArgs: [id]);
  }
}
