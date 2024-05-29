import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:opamobile/pages/table/table_page.dart';
import 'package:opamobile/pages/token-page/token_page_service.dart';
import 'package:opamobile/utils/opa_colors.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import shared_preferences
import 'package:http/http.dart' as http;

class TokenPage extends StatefulWidget {
  const TokenPage({Key? key}) : super(key: key);

  @override
  _TokenPageState createState() => _TokenPageState();
}

class _TokenPageState extends State<TokenPage> {
  final TextEditingController _tokenController = TextEditingController();
  String? authToken;

  Future<void> submitTableToken() async {
    final token = _tokenController.text;
    final tokenint = int.parse(token);
    print(tokenint);
    if (token.isNotEmpty) {
      var response = await TokenPageService.tokenToBack(tokenint);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("Entrou na mesa!");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TablePage()),
        );
      } else {
        print(response.statusCode);
        // Falha, exiba uma mensagem de erro
        print('Falha ao enviar o token da mesa: ${response.body}');
      }
    } else {
      print('Token ou authToken não preenchido!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: OpaColors.yellowOpa,
          automaticallyImplyLeading: false, // tirar o botão de voltar
          actions: [],
          title: Center(
            child: SizedBox(
              width: 85,
              child: Image.asset('assets/OPA_logo.png'),
            ),
          ),
        ),
        resizeToAvoidBottomInset:
            false, // Evita que a tela seja redimensionada quando o teclado aparece
        body: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 200,
                  height: 200,
                  child: Image.asset(
                    'assets/mesa.png',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 300,
                  height: 40,
                  child: Text(
                    'CÓDIGO DA MESA',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: OpaColors.graytext,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 4,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  height: 50,
                  child: CupertinoTextField(
                    controller: _tokenController,
                    padding: const EdgeInsets.all(15),
                    placeholder: "ME-123456",
                    textAlign: TextAlign.center,
                    cursorColor: OpaColors.brownOpa,
                    placeholderStyle: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: Color(0xFF818181),
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: Color(0xFF818181),
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 300,
                  height: 60,
                  child: CupertinoButton(
                    color: OpaColors.yellowOpa,
                    onPressed:
                        submitTableToken, // Chama o método _submitToken ao pressionar o botão
                    child: Text(
                      'ENTRAR',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          color: OpaColors.brownOpa,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 300,
                  height: 300,
                  // isso aqui é gambiarra pura ta kkkkkkk
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
