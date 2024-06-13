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

class _MenuPageState extends State<MenuPage> {
  late List<Menu> _menu;

  @override
  void initState() {
    // rascunho de requisicao assim que entrar na rota e com o async no nome da funcao
    getMenu();
    super.initState();
  }

  Future<void> getMenu() async {
    try {
      var menuInfoFromService = await MenuService.getMenu();
      setState(() {
        _menu = menuInfoFromService as List<Menu>;
      });
    } catch (e) {
      print("Error fetching table info: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              backgroundColor: OpaColors.yellowOpa,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Center(
                child: SizedBox(
                  width: 85,
                  child: Image.asset('assets/OPA_logo.png'),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'MENU',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: OpaColors.graytext,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final menuItem = _menu[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: MenuCardItem(
                      name: menuItem.name,
                      price: menuItem.price,
                      description: menuItem.description,
                    ),
                  );
                },
                childCount: _menu.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
