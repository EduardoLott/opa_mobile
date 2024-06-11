import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:opamobile/models/userlogin_model.dart';
import 'package:opamobile/pages/register/register_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:opamobile/pages/token-page/token_page.dart';
import 'package:opamobile/services/auth_service.dart';
import 'package:opamobile/services/configservice.dart';
import 'package:opamobile/services/restaurant/restaurant_service.dart';
import 'package:opamobile/utils/opa_colors.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: OpaColors.yellowOpa,
        actions: [],
      ),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(27),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  OpaColors.white,
                  OpaColors.white70,
                ],
              ),
            ),
            child: SingleChildScrollView(
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 180,
                      child: Image.asset('assets/OPA_logo.png'),
                    ),
                    const SizedBox(height: 60),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Usuário:",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Color(0xFF525252),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                        const SizedBox(height: 5),
                        CupertinoTextField(
                          controller: _usernameController,
                          cursorColor: OpaColors.yellowOpa,
                          padding: const EdgeInsets.all(15),
                          placeholder: "Insira seu usuário",
                          placeholderStyle: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                color: Color(0xFF818181),
                                fontSize: 16,
                                fontWeight: FontWeight.w300),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color(0xFFD0D0D0), width: 2.0),
                            color: const Color(0xFFF8F8F8),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(6),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Senha:",
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                            color: Color(0xFF525252),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          )),
                        ),
                        const SizedBox(height: 5),
                        CupertinoTextField(
                          controller: _passwordController,
                          padding: const EdgeInsets.all(15),
                          cursorColor: Colors.yellow,
                          placeholder: "Insira sua senha",
                          obscureText: true,
                          placeholderStyle: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                color: Color(0xFF818181),
                                fontSize: 16,
                                fontWeight: FontWeight.w300),
                          ),
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                color: Color(0xFF818181),
                                fontSize: 16,
                                fontWeight: FontWeight.w300),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color(0xFFD0D0D0), width: 2.0),
                            color: const Color(0xFFF8F8F8),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(6),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      child: CupertinoButton(
                        padding: const EdgeInsets.all(17),
                        color: OpaColors.yellowOpa,
                        child: Text("LOGIN",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  color: Colors.brown,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2.0),
                            )),
                        onPressed: () async {
                          final String username = _usernameController.text;
                          final String password = _passwordController.text;

                          final UserLoginModel userLogin = UserLoginModel(
                              username: username, password: password);

                          final jsonData = userLogin.toJson();

                          try {
                            if (_usernameController.text.isNotEmpty &&
                                _passwordController.text.isNotEmpty) {
                              final response = await http.post(
                                Uri.parse(
                                    '${ConfigService.apiurl}/auth/login'),
                                headers: <String, String>{
                                  'Content-Type':
                                      'application/json; charset=UTF-8',
                                },
                                body: jsonEncode(jsonData),
                              );

                              if (response.statusCode == 200 ||
                                  response.statusCode == 201) {
                                print("Usuário logado com sucesso! ");
                                print(response.body);

                                final responseData = jsonDecode(response.body);
                                print(responseData);

                                final data = responseData['data'];
                                if (data != null && data is Map) {
                                  final token = data['token'];
                                  if (token != null && token is String) {
                                    print('Token: $token');

                                    AuthService.setUserId(data['userId']); 
                                    AuthService.setUserToken(token); 
                                    print(AuthService.getUserToken());

                                    final prefs =
                                        await SharedPreferences.getInstance();
                                    await prefs.setString('authToken', token);

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => TokenPage()),
                                    );
                                  } else {
                                    print(
                                        'Erro: Campo "token" não encontrado dentro de "data" ou é nulo');
                                  }
                                } else {
                                  print(
                                      'Erro: Campo "data" não encontrado ou é nulo');
                                }
                              } else {
                                print(
                                    "Falha ao logar o usuário: ${response.body}");
                                print(response.statusCode);
                              }
                            }
                          } catch (e) {
                            print("Falha ao fazer a requisição: $e");
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.brown, width: 2),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: CupertinoButton(
                        child: Text("CRIAR CONTA",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Colors.brown,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage()),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
