import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:opamobile/pages/table/table_page.dart';
import 'package:opamobile/pages/token-page/token_page_service.dart';
import 'package:opamobile/services/table/table_service.dart';
import 'package:opamobile/utils/opa_colors.dart';

class TokenPage extends StatefulWidget {
  const TokenPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TokenPageState createState() => _TokenPageState();
}

class _TokenPageState extends State<TokenPage> {
  final TextEditingController _tokenController = TextEditingController();

  Future<void> submitTableToken() async {
    final token = _tokenController.text;
    TableService.setTableId(token);
    if (token.isNotEmpty) {
      var response = await TokenPageService.tokenToBack(token);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TablePage()),
        );
      } else {
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
          automaticallyImplyLeading: false,
          actions: [],
          title: Center(
            child: SizedBox(
              width: 85,
              child: Image.asset('assets/OPA_logo.png'),
            ),
          ),
        ),
        resizeToAvoidBottomInset: false,
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
                    onPressed: submitTableToken,
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
