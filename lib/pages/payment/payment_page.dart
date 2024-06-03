import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:opamobile/utils/opa_colors.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage>{
  
  late dynamic _orders=[1,2,3,4,5,6,7,8,9,10,11,12]; 

  late double _order_value = 570.97;

  static var _paymentOptions = [
    'Cartão de Crédito',
    'Pix'
  ];

  var _selectedOption = _paymentOptions.first;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: OpaColors.yellowOpa,
          automaticallyImplyLeading: true, // tirar o botão de voltar
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
        resizeToAvoidBottomInset:
          false,
        body:Center(
          child: Column(
            children: [
              SizedBox(
                height: 60,
                child: Center(
                  child:Text(
                    'Detalhes dos pedidos',
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                        color: Color(0xFF525252),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      )
                    ),
                  ),
                )
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 400,
                child: Container(
                  color: Colors.amber,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: DataTable(
                      columns: const [
                        DataColumn(label: Text('Qt.')),
                        // DataColumn(label: Text('Item')),
                        // DataColumn(label: Text('Pessoas')),
                        // DataColumn(label: Text('Total')),
                        // DataColumn(label: Text('Indiv.')),
                      ],
                      rows: [
                        for(var order in _orders)
                          DataRow(cells:[
                            DataCell(Text('$order')),
                          ])
                      ],
                    ),
                  )
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
                                    )
                                  ),
                                ),
                                Text(
                                  'R\$$_order_value',
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                      color: Color(0xFF367335),
                                      fontSize: 36,
                                      fontWeight: FontWeight.bold
                                    ),
                                  )
                                )
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
                              width: MediaQuery.of(context).size.width*0.6,
                              alignment: Alignment.bottomLeft,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 200,
                                          height: 20,
                                          alignment: Alignment.bottomLeft,
                                          child:Text(
                                            'Forma de pagamento',
                                            style: GoogleFonts.poppins(
                                              textStyle: const TextStyle(
                                                color: Color.fromARGB(255, 0, 0, 0),
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            )
                                          ),
                                        ),
                                        Container(
                                          width: 200,
                                          height: 30,
                                          child: DropdownButton<String>(
                                            value: _selectedOption,
                                            elevation: 1,
                                            style: const TextStyle(color:Color.fromARGB(255, 109, 70, 4)),
                                            underline: Container(
                                              height: 1,
                                              color: Color.fromARGB(255, 109, 70, 4),
                                            ),
                                            items: _paymentOptions.map<DropdownMenuItem<String>>((String value) {
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
                          )
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.8,
                          child: Divider(
                            color: Colors.grey[300],
                            thickness: 1,
                            height: 1, 
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 70,
                          child: Row(
                            children: [
                              Container(
                                height: 70,
                                width: MediaQuery.of(context).size.width*0.8,
                                child: Text('CPF/CNPJ na nota'),
                              ),
                              Container(),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ]
          ),
        )
      )
    );
  } 
} 
