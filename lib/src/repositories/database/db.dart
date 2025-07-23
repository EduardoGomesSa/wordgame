import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

abstract class Db {
    static Future<sql.Database> connection() async {
        WidgetsFlutterBinding.ensureInitialized();

        final dbPath = await sql.getDatabasesPath();

        return sql.openDatabase(path.join(dbPath, 'word_game'),
        );
    }
    
}