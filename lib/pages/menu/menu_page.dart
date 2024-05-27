import 'package:flutter/material.dart';
import 'package:opamobile/pages/menu/menu_interface.dart';
import 'package:opamobile/pages/menu/menu_service.dart';
import 'package:opamobile/utils/opa_colors.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage>{
  
  final List<Menu> _menu = [
    Menu(id:1,name:'carlos',price:30),
    Menu(id:1,name:'carlos',price:30),
    Menu(id:1,name:'carlos',price:30),  
    Menu(id:1,name:'carlos',price:30),  
  ];

  @override
  void initState() {
    // rascunho de requisicao assim que entrar na rota e com o async no nome da funcao 
    // _menu = await MenuService.getMenu();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
          backgroundColor: OpaColors.yellowOpa,
          automaticallyImplyLeading: true, // tirar o botão de voltar
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
        body:SingleChildScrollView(
          child: Center(
            child:Column(
              children: [
                for(var item in _menu)
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.95,
                    height: 300,
                    child: Container(
                      width: 120,
                      height: 120,
                      color: Color.fromARGB(255, 156, 51, 51),
                    ),
                  ),
                  SizedBox(height: 40,)
              ],
            ),
          )
        )
      )
    );
  } 
}