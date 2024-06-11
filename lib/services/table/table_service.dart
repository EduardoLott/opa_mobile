import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:opamobile/services/auth_service.dart';
import 'package:opamobile/services/configservice.dart';
import 'package:opamobile/services/table/dto/tabledto.dart';

class TableService{

  static late TableDTO _tableInfo;
  static late String _table_id;

  static setTableId(String table_id){
    _table_id = table_id;
  }

  static setTableInfo(TableDTO tableInfoFromBack){
    _tableInfo =  tableInfoFromBack;
  }

  static Future<TableDTO?> getInfo() async {
    try {
      final userToken = AuthService.getUserToken();
      final userId = AuthService.getUserId();
      
      final response = await http.get(
        Uri.parse(
          '${ConfigService.apiurl}/table/$_table_id'
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $userToken', 
        }
      );

      if(response.statusCode != 200){
        throw Exception("Requisição de table falhou.");
      }

      final tableInfoFromBack = jsonDecode(response.body);

      if(tableInfoFromBack == null){
        return null;
      }

      setTableInfo(tableInfoFromBack);

      return tableInfoFromBack;
    } catch (e) {
      print("$e");
      throw Exception('Exception no get Table.');
    }
    
  }

  static TableDTO getTableInfo(){
    return _tableInfo;
  }

}