import 'package:http/http.dart' as http;

class MenuService{

    static Future<dynamic> getMenu() async {
    try {
      // ainda tem que passar authentication pela headers, eu acho.
      final response = await http.get(
        Uri.parse(
            'http://192.168.0.36:3000/product/'),
        headers: <String, String>{
          'Content-Type':
              'application/json; charset=UTF-8',
        }
      );
      return response;
    }
    catch(e){
      print("$e");
    }
  }
}