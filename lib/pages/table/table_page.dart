import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:opamobile/utils/opa_colors.dart';

class TablePage extends StatefulWidget {
  const TablePage({Key? key}) : super(key: key);

  @override
  _TablePageState createState() => _TablePageState();
}

class _TablePageState extends State<TablePage>{

 int _user_value = 100;

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
          false,
        body:Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 400,
              child: Container(
                decoration: const BoxDecoration(
                  color: OpaColors.yellowLighter,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(100.0),
                      bottomRight: Radius.circular(100.0),
                    ),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('noneUser.png'),
                          Text(
                            'R\$ $_user_value',
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Color.fromARGB(255, 1, 73, 3),
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                              ),
                            )
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 50,
                            width: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: OpaColors.yellowOpa,
                                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5), // Padding
                                shape: const CircleBorder(),
                                elevation: 1, // Sombra
                              ),
                              onPressed: (){},
                              child: Image.asset(
                                'hamburger.png',
                                width: 30,
                                height: 30,
                              )
                            ),
                          ),
                          SizedBox(
                            height: 125,
                            width: 125,
                            child: Image.asset('table.png')
                          ),
                        ],
                      )
                    ],
                ),
                ),
              )
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 250,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        fixedSize: Size(75, 75),
                        backgroundColor: OpaColors.yellowOpa
                      ),
                      onPressed: (){},
                      child: Image.asset(
                        'assets/menu.png',
                        height: 75,
                        width: 75,
                      )
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        fixedSize: Size(125, 125),
                        backgroundColor: OpaColors.white
                      ),
                      onPressed: (){},
                      child: Image.asset(
                          'assets/Opa_with_fog.png',
                          height: 125,
                          width: 125,
                          fit: BoxFit.contain,
                        ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        fixedSize: Size(75, 75),
                        backgroundColor: OpaColors.yellowOpa
                      ),
                      onPressed: (){},
                      child: Image.asset(
                        'assets/orders.png',
                        height: 75,
                        width: 75,
                      ),
                    ),
                  ],
                ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: Container(
                // color:Color.fromARGB(255, 43, 26, 25),
              ),
            ),
          ],
        ), // Evita que a tela seja redimensionada quando o teclado aparece
      ),
    );
  }

}