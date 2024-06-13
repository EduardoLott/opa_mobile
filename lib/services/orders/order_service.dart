import 'dart:convert';

import 'package:opamobile/services/auth_service.dart';
import 'package:opamobile/services/configservice.dart';
import 'package:opamobile/services/orders/dto/paymentorderdto.dart';
import 'package:opamobile/services/restaurant/restaurant_service.dart';
import 'package:http/http.dart' as http;

class OrderService {
  static Future<List<PaymentOrderDTO>?> getUserOrders() async {
    try {
      final userToken = AuthService.getUserToken();
      final userId = AuthService.getUserId();
      final restaurantId = RestaurantService.getRestaurantId();

      final response = await http.get(
          Uri.parse(
              '${ConfigService.apiurl}/order/$restaurantId/person/$userId'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $userToken',
          });

      if (response.statusCode != 200) {
        throw Exception("Requisição de orders falhou.");
      }

      final List<dynamic> ordersFromBack = jsonDecode(response.body);

      // ignore: unnecessary_null_comparison
      if (ordersFromBack == null) {
        return null;
      }

      List<PaymentOrderDTO> orderList = [];
      ordersFromBack.forEach((e) => orderList.add(PaymentOrderDTO.fromJson(e)));

      return orderList;
    } catch (e) {
      print("$e");
      throw Exception('Exception no get de orders');
    }
  }
}
