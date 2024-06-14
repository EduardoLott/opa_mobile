import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:opamobile/pages/menu/menu_page.dart';
import 'package:opamobile/pages/payment/payment_page.dart';
import 'package:opamobile/services/auth_service.dart';
import 'package:opamobile/services/table/dto/tabledto.dart';
import 'package:opamobile/services/table/table_service.dart';
import 'package:opamobile/utils/opa_colors.dart';

class TablePage extends StatefulWidget {
  const TablePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TablePageState createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  TableDTO? _table;

  late int _loggedInUserId;
  String _loggedInUserName = '';

  @override
  void initState() {
    super.initState();
    _loggedInUserId = AuthService.getUserId();
    getTableInfo();
  }

  Future<void> getTableInfo() async {
    try {
      var serviceInfo = await TableService.getInfo();
      setState(() {
        _table = serviceInfo as TableDTO;
        _loggedInUserName = _getLoggedInUserName();
      });
    } catch (e) {
      print("Error fetching table info: $e");
    }
  }

  String _getLoggedInUserName() {
    if (_table != null && _table!.table.customers.isNotEmpty) {
      for (var customer in _table!.table.customers) {
        if (customer.id == _loggedInUserId) {
          return customer.name;
        }
      }
    }
    return 'Nome de Usuário';
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 500,
                child: Container(
                  decoration: const BoxDecoration(
                    color: OpaColors.yellowLighter,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50.0),
                      bottomRight: Radius.circular(50.0),
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 225,
                          height: 225,
                          child: Center(
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/noneUser.png',
                                  width: 130,
                                  height: 130,
                                ),
                                Text(
                                  _loggedInUserName,
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 110,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.95,
                                height: 15,
                                child: Text(
                                  'Participantes da mesa:',
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                      color: OpaColors.graytext,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 90,
                                width: MediaQuery.of(context).size.width,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    if (_table != null)
                                      for (var customer
                                          in _table!.table.customers)
                                        Container(
                                          width: 80,
                                          height: 80,
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                'assets/noneUser.png',
                                                height: 70,
                                                width: 70,
                                              ),
                                              Text(
                                                '${customer.name}',
                                                style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(
                                                    color: OpaColors.graytext,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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
                        backgroundColor: OpaColors.yellowOpa,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MenuPage()),
                        );
                      },
                      child: Image.asset(
                        'assets/menu.png',
                        height: 75,
                        width: 75,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        fixedSize: Size(125, 125),
                        backgroundColor: OpaColors.white,
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                'OPA!',
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    color: OpaColors.graytext,
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              content: Text(
                                'Estamos chamando um garçom para você!',
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    color: OpaColors.graytext,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('OK'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
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
                        backgroundColor: OpaColors.yellowOpa,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PaymentPage()),
                        );
                      },
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
                child: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
