import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:opamobile/services/orders/dto/paymentorderdto.dart';
import 'package:opamobile/services/orders/order_service.dart';
import 'package:opamobile/services/table/dto/tabledto.dart';
import 'package:opamobile/utils/opa_colors.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  late List<PaymentOrderDTO> _orders;

  late double _finalValue;

  static final _paymentOptions = ['Cartão de Crédito', 'Pix'];

  var _selectedOption = _paymentOptions.first;
  var _isChecked = false;

  @override
  void initState() {
    super.initState();
    _orders = [];
    getOrders();
    _finalValue = 00.00;
  }

  Future<void> getOrders() async {
    try {
      var ordersFromService = await OrderService.getUserOrders();
      setState(() {
        _orders = ordersFromService as List<PaymentOrderDTO>;
        print("SEXO12345678910 $_orders");
        setFinalValue();
      });
    } catch (e) {
      print('Deu ruim');
    }
  }

  setFinalValue() {
    if (_orders.length == 0) {
      _finalValue = 00.00;
      return;
    }
    _orders.forEach((e) => _finalValue += e.dividedPrice);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: OpaColors.yellowOpa,
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
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
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                  child: Center(
                    child: Text(
                      'Detalhes dos pedidos',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          color: Color(0xFF525252),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 400,
                  child: Container(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: DataTable(
                        columns: const [
                          DataColumn(label: Text('Qt.')),
                          DataColumn(label: Text('Item')),
                          DataColumn(label: Text('Div.')),
                          DataColumn(label: Text('Indiv.')),
                        ],
                        rows: [
                          for (var order in _orders)
                            DataRow(cells: [
                              DataCell(Text('${order.qt}')),
                              DataCell(Text('${order.name}')),
                              DataCell(Text('${order.dividedPrice}')),
                              DataCell(Text('${order.totalPrice}')),
                            ])
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 100,
                            child: Container(
                              child: Column(
                                children: [
                                  Text(
                                    'Total a pagar:',
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'R\$$_finalValue',
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                        color: Color(0xFF367335),
                                        fontSize: 36,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 70,
                            child: Center(
                              child: Container(
                                height: 70,
                                width: MediaQuery.of(context).size.width * 0.6,
                                alignment: Alignment.bottomLeft,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      width: 35,
                                      height: 35,
                                      child: Image.asset(
                                        'assets/creditcard.png',
                                      ),
                                    ),
                                    Container(
                                      height: 50,
                                      width: 200,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 200,
                                            height: 20,
                                            alignment: Alignment.bottomLeft,
                                            child: Text(
                                              'Forma de pagamento',
                                              style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0),
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 200,
                                            height: 30,
                                            child: DropdownButton<String>(
                                              value: _selectedOption,
                                              elevation: 1,
                                              style: const TextStyle(
                                                color: Color.fromARGB(
                                                    255, 109, 70, 4),
                                              ),
                                              underline: Container(
                                                height: 1,
                                                color: Color.fromARGB(
                                                    255, 109, 70, 4),
                                              ),
                                              items: _paymentOptions.map<
                                                      DropdownMenuItem<String>>(
                                                  (String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(value),
                                                );
                                              }).toList(),
                                              onChanged: (String? value) {
                                                setState(() {
                                                  _selectedOption = value!;
                                                });
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Divider(
                              color: Colors.grey[300],
                              thickness: 1,
                              height: 1,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 35,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  height: 70,
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: const Text('CPF/CNPJ na nota'),
                                ),
                                Container(
                                  child: Checkbox(
                                    value: _isChecked,
                                    activeColor: OpaColors.brownOpa,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        _isChecked = !_isChecked;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 70,
                            child: Center(
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                alignment: Alignment.center,
                                child: CupertinoButton(
                                  color: OpaColors.yellowOpa,
                                  onPressed: () {
                                    // Integração com método de pagamento
                                  },
                                  child: Center(
                                    child: Text(
                                      'PAGAR',
                                      style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                          color: OpaColors.brownOpa,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 2.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
