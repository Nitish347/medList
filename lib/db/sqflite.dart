import 'package:flutter/cupertino.dart';
import 'package:medlist/Providers/DataProvider.dart';
import 'package:medlist/models/exercise_model.dart';
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
    // var provider = Provider.of<DataProvider>(context, listen: false);
    var db = await this.database;
    // for (int i = 0; i < provider.medicinesList!.length; i++) {
    //   delete(provider.medicinesList![i].id);
    // }
    // for (int i = 0; i < provider.exerciseList!.length; i++) {
    //   delete(provider.exerciseList![i].id);
    // }
    print("inseritng...........................................");
    var result = await db.insert(tableAlarm, medicineModel.toMap());
    print('result : $result');
  }

  Future<List<MedicineModel>> getAlarms(BuildContext context) async {
    print("fetching data from db******************************");
    var provider = Provider.of<DataProvider>(context, listen: false);
    List<MedicineModel> _alarms = [];
    List<MedicineModel> _alarms1 = [];
    List<ExerciseModel> _alarms2 = [];

    var db = await this.database;
    var result = await db.query(tableAlarm);
    result.forEach((element) {
      var alarmInfo = MedicineModel.fromMap1(element);
      _alarms.add(alarmInfo);
    });
    // print(_alarms);
    for (var i in _alarms) {
      if (i.id! < 1000) {
        _alarms1.add(i);
      } else {
        Map<String, dynamic> mp = i.toMap();
        _alarms2.add(ExerciseModel.fromMap1(mp));
      }
    }
    provider.medicinesListUpdate(_alarms1);
    provider.exerciseListUpdate(_alarms2);
    return _alarms;
  }

  Future<void> deleteAll(BuildContext context) async {
    print("deleting..........................");
    var provider = Provider.of<DataProvider>(context, listen: false);
    for (int i = 0; i < provider.medicinesList!.length; i++) {
      delete(provider.medicinesList![i].id);
    }
    for (int i = 0; i < provider.exerciseList!.length; i++) {
      delete(provider.exerciseList![i].id);
    }
  }

  Future<int> delete(int? id) async {
    var db = await this.database;
    return await db.delete(tableAlarm, where: '$columnId = ?', whereArgs: [id]);
  }
}
