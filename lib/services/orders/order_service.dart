import 'dart:convert';

import 'package:opamobile/services/auth_service.dart';
import 'package:opamobile/services/configservice.dart';
import 'package:opamobile/services/orders/dto/paymentorderdto.dart';
import 'package:opamobile/services/restaurant/restaurant_service.dart';
import 'package:http/http.dart' as http;

class OrderService{

  static Future<List<PaymentOrderDTO>?> getUserOrders() async{
    try {
      final userToken = AuthService.getUserToken();
      final userId = AuthService.getUserId();
      final restaurantId = RestaurantService.getRestaurantId();
      
      final response = await http.get(
        Uri.parse(
          '${ConfigService.apiurl}/order/$restaurantId/person$userId'
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $userToken', 
        }
      );

      if(response.statusCode != 200){
        throw Exception("Requisição de orders falhou.");
      }

      final ordersFromBack = jsonDecode(response.body);

      if(ordersFromBack == null){
        return null;
      }

      return ordersFromBack;
    } catch (e) {
      print("$e");
      throw Exception('Exception no get de orders');
    }
  }
}