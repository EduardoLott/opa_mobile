import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'colors.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: SizedBox(
          width: 85,
          child: Image.asset('assets/OPA_logo.png'),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
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
            const CupertinoTextField(
              cursorColor: yellowOpa,
              padding: EdgeInsets.all(15),
              placeholder: "Digite o seu nome completo",
              placeholderStyle: TextStyle(color: Colors.grey, fontSize: 14),
              style: TextStyle(color: Colors.white, fontSize: 14),
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.all(
                    Radius.circular(7),
                  )),
            ),
            const SizedBox(height: 5),
            const CupertinoTextField(
              cursorColor: yellowOpa,
              padding: EdgeInsets.all(15),
              placeholder: "Digite o seu e-mail",
              placeholderStyle: TextStyle(color: Colors.grey, fontSize: 14),
              style: TextStyle(color: Colors.white, fontSize: 14),
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.all(
                    Radius.circular(7),
                  )),
            ),
            const SizedBox(height: 5),
            const CupertinoTextField(
              cursorColor: yellowOpa,
              padding: EdgeInsets.all(15),
              placeholder: "Digite o seu e-mail",
              placeholderStyle: TextStyle(color: Colors.grey, fontSize: 14),
              style: TextStyle(color: Colors.white, fontSize: 14),
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.all(
                    Radius.circular(7),
                  )),
            ),
            const SizedBox(height: 5),
            const CupertinoTextField(
              cursorColor: yellowOpa,
              padding: EdgeInsets.all(15),
              placeholder: "Digite o seu e-mail",
              placeholderStyle: TextStyle(color: Colors.grey, fontSize: 14),
              style: TextStyle(color: Colors.white, fontSize: 14),
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.all(
                    Radius.circular(7),
                  )),
            ),
            const SizedBox(height: 5),
            const CupertinoTextField(
              padding: EdgeInsets.all(15),
              cursorColor: yellowOpa,
              placeholder: "Digite sua senha",
              obscureText: true,
              placeholderStyle: TextStyle(color: Colors.grey, fontSize: 14),
              style: TextStyle(color: Colors.white, fontSize: 14),
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.all(
                    Radius.circular(7),
                  )),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: CupertinoButton(
                padding: const EdgeInsets.all(17),
                color: yellowOpa,
                child: const Text(
                  "Cadastrar",
                  style: TextStyle(
                      color: brownOpa,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                onPressed: () {},
              ),
            ),
            const SizedBox(height: 7),
          ],
        ),
      ),
    );
  }
}
