import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:opamobile/register_page.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key, Key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFCF24),
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
                  Colors.white,
                  Colors.white70,
                ],
              ),
            ),
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
                    Text("Email:",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            color: Color(0xFF525252),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    const SizedBox(height: 5),
                    CupertinoTextField(
                      cursorColor: Colors
                          .yellow, //yellowOpa não está definido no seu código
                      padding: const EdgeInsets.all(15),
                      placeholder: "Insira seu email",
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
                      padding: const EdgeInsets.all(15),
                      cursorColor: Colors
                          .yellow, //yellowOpa não está definido no seu código
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
                    color: Colors
                        .yellow, //yellowOpa não está definido no seu código
                    child: Text("LOGIN",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              color: Colors.brown,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.0),
                        )),
                    onPressed: () {},
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
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 70, // Altura do quadrado
              color: const Color(0xFFF8E49E), // Cor do quadrado
            ),
          ),
        ],
      ),
    );
  }
}
