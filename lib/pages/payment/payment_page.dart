import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:opamobile/services/orders/dto/paymentorderdto.dart';
import 'package:opamobile/services/orders/order_service.dart';
import 'package:opamobile/utils/opa_colors.dart';
import 'package:collection/collection.dart';

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
    _finalValue = 0.0;
    getOrders();
  }

  Future<void> getOrders() async {
    try {
      var ordersFromService = await OrderService.getUserOrders();
      setState(() {
        _orders = ordersFromService ?? [];
        setFinalValue();
      });
    } catch (e) {
      print('Erro ao buscar pedidos: $e');
    }
  }

  void setFinalValue() {
    _finalValue = _orders.fold(0.0, (sum, order) => sum + order.dividedPrice);
  }

  @override
  Widget build(BuildContext context) {
    var formatter = NumberFormat('#,##0.00', 'pt_BR');
    String formattedFinalValue = formatter.format(_finalValue);

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
          flexibleSpace: Center(
            child: Container(
              margin: const EdgeInsets.only(top: 20.0),
              child: SizedBox(
                width: 85,
                child: Image.asset('assets/OPA_logo.png'),
              ),
            ),
          ),
        ),
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  'Detalhes dos pedidos',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: Color(0xFF525252),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: DataTable(
                    columnSpacing: 30.0,
                    columns: const [
                      DataColumn(label: Text('Qt.')),
                      DataColumn(label: Text('Item')),
                      DataColumn(
                        label: Text(
                          'Val. Un.',
                        ),
                      ),
                      DataColumn(label: Text('Val. Total')),
                    ],
                    rows: _orders.isNotEmpty
                        ? groupBy(_orders, (order) => order.name)
                            .entries
                            .map((group) => DataRow(
                                  cells: [
                                    DataCell(Text(
                                        '${group.value.length}')), // Qt. total do grupo
                                    DataCell(
                                        Text(group.key)), // Nome do produto
                                    DataCell(Text(group.value[0]
                                        .formattedDividedPrice())), // Preço individual
                                    DataCell(Text(
                                        // Total do grupo
                                        NumberFormat('#,##0.00', 'pt_BR')
                                            .format(group.value.fold(
                                                0.0,
                                                (sum, order) =>
                                                    sum +
                                                    order.dividedPrice)))),
                                  ],
                                ))
                            .toList()
                        : [],
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Total a pagar:',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'R\$$formattedFinalValue',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: Color(0xFF367335),
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        'assets/creditcard.png',
                        width: 35,
                        height: 35,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Forma de pagamento',
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Color(0xFF000000),
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          DropdownButton<String>(
                            value: _selectedOption,
                            elevation: 1,
                            style: const TextStyle(
                              color: Color(0xFF6D4604),
                            ),
                            underline: Container(
                              height: 1,
                              color: Color(0xFF6D4604),
                            ),
                            items: _paymentOptions
                                .map<DropdownMenuItem<String>>((String value) {
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
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Divider(
                  color: Colors.grey[300],
                  thickness: 1,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('CPF/CNPJ na nota'),
                    Checkbox(
                      value: _isChecked,
                      activeColor: OpaColors.brownOpa,
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked = value!;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                CupertinoButton(
                  color: OpaColors.yellowOpa,
                  onPressed: () {},
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
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
