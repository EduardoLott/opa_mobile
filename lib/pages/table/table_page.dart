import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:opamobile/pages/menu/menu_page.dart';
import 'package:opamobile/pages/payment/payment_page.dart';
import 'package:opamobile/services/table/dto/tabledto.dart';
import 'package:opamobile/services/table/table_service.dart';
import 'package:opamobile/utils/opa_colors.dart';

class TablePage extends StatefulWidget {
  const TablePage({Key? key}) : super(key: key);

  @override
  _TablePageState createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  static late TableDTO _table;
  static late List<OrderDTO> _userOrderList;

  @override
  void initState() {
    super.initState();
    getTableInfo();
  }

  Future<void> getTableInfo() async {
    var serviceInfo = await TableService.getInfo() as TableDTO;
    setState(() {
      _table = serviceInfo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: OpaColors.yellowOpa,
          automaticallyImplyLeading: false, // remove the back button
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
                                  Text('Você'),
                                  // Text(
                                  //   'R\$ $_user_value',
                                  //   style: GoogleFonts.poppins(
                                  //     textStyle: const TextStyle(
                                  //       color: Color.fromARGB(255, 1, 73, 3),
                                  //       fontSize: 18,
                                  //       fontWeight: FontWeight.bold
                                  //     ),
                                  //   )
                                  // ),
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
                                    width: MediaQuery.of(context).size.width *
                                        0.95,
                                    height: 15,
                                    child: Text('Com você:',
                                        style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                              color: OpaColors.graytext,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        )),
                                  ),
                                  Container(
                                    height: 90,
                                    width: MediaQuery.of(context).size.width,
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        for (var customer
                                            in _table.table.tableCustomers)
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
                                                Text('${customer.name}',
                                                    style: GoogleFonts.poppins(
                                                      textStyle:
                                                          const TextStyle(
                                                              color: OpaColors
                                                                  .graytext,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ))
                                              ],
                                            ),
                                          )
                                      ],
                                    ),
                                  ),
                                ],
                              ))
                        ],
                      ),
                    ),
                  )),
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
                            backgroundColor: OpaColors.yellowOpa),
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
                        )),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          fixedSize: Size(125, 125),
                          backgroundColor: OpaColors.white),
                      onPressed: () {},
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
                          backgroundColor: OpaColors.yellowOpa),
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
                child: Container(
                    // color:Color.fromARGB(255, 43, 26, 25),
                    ),
              ),
            ],
          ), // Evita que a tela seja redimensionada quando o teclado aparece
        ),
      ),
    );
  }
}
