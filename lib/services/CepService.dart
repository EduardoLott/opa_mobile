import 'package:http/http.dart' as http;
import 'dart:convert';

class CepService {
  static Future<Map<String, dynamic>> fetchAddress(String cep) async {
    final response =
      await http.get(Uri.parse('https://viacep.com.br/ws/${cep}/json/'));

    if (response.statusCode == 200) {
      final parsedJson = jsonDecode(response.body);
      print("CEP encontrado com sucesso!");
      return {
        'street': parsedJson['logradouro'],
        'neighborhood': parsedJson['bairro'],
        'city': parsedJson['localidade'],
        'state': parsedJson['uf'],
      };
    } else if (response.statusCode == 404) {
      throw Exception('CEP não encontrado');
    } else {
      throw Exception('Falha ao buscar o endereço');
    }
  }
}
