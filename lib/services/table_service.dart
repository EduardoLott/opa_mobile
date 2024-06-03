import 'dart:async';
import 'package:http/http.dart' as http;

import 'package:opamobile/services/auth_service.dart';

class TableService{

  late dynamic _tableinfo;
  static late int _table_id;

  static setTableId(int table_id){
    _table_id = table_id;
  }

  setTableInfo(){

  }

  static Future<dynamic> getInfo() async {
    try {
      final userToken = AuthService.getUserToken();
      final _tableInfo = await http.get(
        Uri.parse(
          'http://192.168.0.36:3000/table/$_table_id'
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $userToken', // Passar o token nos headers
        }
      );
      print(_tableInfo);
    } catch (e) {
      print("$e");
    }
    
  }

  static getCustomers(){
    // logica pra retornar os clientes da table
  }

}