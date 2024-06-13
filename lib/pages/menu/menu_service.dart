import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:opamobile/pages/menu/menu_interface.dart';
import 'package:opamobile/services/auth_service.dart';
import 'package:opamobile/services/configservice.dart';

class MenuService {
  static Future<List<Menu>?> getMenu() async {
    try {
      final userToken = AuthService.getUserToken();
      final response = await http.get(
          Uri.parse('${ConfigService.apiurl}/product/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $userToken',
          });

      print(response.body);

      print(response.statusCode);

      if (response.statusCode != 200) {
        return null;
      }

      final List<dynamic> menuFromBack = jsonDecode(response.body);
      print("MENUFROMBACK $menuFromBack");

      if (menuFromBack == null) {
        return null;
      }

      print(menuFromBack);

      //caso precise iterar, ta aqui o código, só mudar o retorno.
      List<Menu> menuList = [];
      menuFromBack.forEach((e) => menuList.add(Menu.fromJson(e)));

      print("AI AI: ${menuList.first}");

      return menuList;
    } catch (e) {
      print("Deu erro patrão: $e");
      return null;
    }
  }
}
