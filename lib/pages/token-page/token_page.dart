import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:opamobile/utils/opa_colors.dart';

class TokenPage extends StatelessWidget{
  const TokenPage ({super.key,Key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
        Scaffold(
          appBar: AppBar(
            backgroundColor: OpaColors.yellowOpa,
            automaticallyImplyLeading: false, // tirar o botão de voltar
            actions: [],
            title:
              Center(
              child:
                SizedBox(
                  width: 85,
                  child:
                  Image.asset(
                    'assets/OPA_logo.png'
                  ), 
                ),
            )
          ),
          body: Center(
            child: Container(
              // color: Colors.red,
              width: MediaQuery.of(context).size.width,
              child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 200,
                      height: 200,
                      child: Image.asset('assets/mesa.png',fit: BoxFit.cover,),
                      
                    ),
                    SizedBox(
                      width: 300,
                      height: 40,
                      child: 
                        Text(
                          'CÓDIGO DA MESA',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              color: OpaColors.graytext,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 4
                          ),
                        )
                        ),
                    ),
                    SizedBox(
                      width: 300,
                      height: 50,
                      child: 
                      CupertinoTextField(
                        padding: const EdgeInsets.all(15),
                        placeholder: "ME-123456",
                        textAlign: TextAlign.center,
                        cursorColor: OpaColors.brownOpa,
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
                            fontWeight: FontWeight.w300
                          ),
                        ),
                      )
                    ),
                    SizedBox(
                      width: 300,
                      height: 60,
                      child: 
                      CupertinoButton(
                        child: Text('Entrar'),
                        color: OpaColors.yellowOpa, 
                        onPressed: () {  },
                        
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      height: 300,
                      // isso aqui é gambiarra pura ta kkkkkkk
                    )
                  ],
                )
            ),
          )
        )
    );
  }
  
}