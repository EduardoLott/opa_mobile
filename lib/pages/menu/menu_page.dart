import 'package:flutter/material.dart';
import 'package:opamobile/pages/menu/menu_interface.dart';
import 'package:opamobile/pages/menu/menu_service.dart';
import 'package:opamobile/shared/menucarditem.dart';
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
          icon: const Icon(Icons.arrow_back),
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
        body:
          ListView.builder(
            itemCount: _menu.length,
            itemBuilder: (context, index) {
              final menuItem = _menu[index];
              return MenuCardItem(name: menuItem.name, price: menuItem.price);
            }
          )
      )
    );
  } 
}