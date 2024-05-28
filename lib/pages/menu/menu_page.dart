import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    Menu(id:1,name:'carlos',price:30.99,description: 'carlosin carlosos carlaosdaoskdo3k3o'),
    Menu(id:1,name:'carlos',price:30.99,description: 'carlosin carlosos carlaosdaoskdo3k3o'),
    Menu(id:1,name:'carlos',price:30,description: 'carlosin carlosos carlaosdaoskdo3k3o'),
    Menu(id:1,name:'carlos',price:30.99,description: 'carlosin carlosos carlaosdaoskdo3k3ocarlaosdaoskdo3k3ocarlaosdaoskdo3k3ocarlaosdaoskdo3k3o'),
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
        body:SingleChildScrollView(
          // physics: ScrollPhysics(),
          child: Column(
            children:[
              Text(
                'MENU',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                  color:OpaColors.graytext,
                  fontSize: 24,
                  fontWeight: FontWeight.w600),
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _menu.length,
                  itemBuilder: (context, index) {
                    final menuItem = _menu[index];
                    return MenuCardItem(name: menuItem.name, price: menuItem.price, description: menuItem.description,);
                  }
                )
            ],
          ),
        ),
      )
    );
  } 
}