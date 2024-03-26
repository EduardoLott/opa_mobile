import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

// ignore: must_be_immutable
class RegisterPage extends StatelessWidget {
  RegisterPage({super.key, Key});

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          title: SizedBox(
            width: 85,
            child: Image.asset('assets/OPA_logo.png'),
          ),
          elevation: 0,
          backgroundColor: yellowOpa,
        ),
        body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(27),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.white70,
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildTextFieldWithLabel(
                    context,
                    labelText: 'Nome',
                    placeholder: 'Digite o seu nome completo',
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Expanded(
                        child: _buildDateInputWithLabel(
                          context,
                          labelText: 'Data',
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _buildGenderDropdownWithLabel(
                          context,
                          labelText: 'Gênero',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  _buildTextFieldWithLabel(
                    context,
                    labelText: 'Senha',
                    placeholder: 'Digite sua senha',
                    obscureText: true,
                  ),
                  const SizedBox(height: 5),
                  _buildTextFieldWithLabel(
                    context,
                    labelText: 'Confirmar Senha',
                    placeholder: 'Confirme sua senha',
                    obscureText: true,
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: CupertinoButton(
                      padding: const EdgeInsets.all(17),
                      color: Colors.yellow,
                      child: Text(
                        'CADASTRAR',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              color: Colors.brown,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 3.0),
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(height: 7),
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: 70, // Altura do quadrado
                color: const Color(0xFFF8E49E), // Cor do quadrado
              ),
            ),
          ],
        ));
  }

  Widget _buildTextFieldWithLabel(BuildContext context,
      {required String labelText,
      required String placeholder,
      bool obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText,
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                color: Color(0xFF525252),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            )),
        CupertinoTextField(
          padding: const EdgeInsets.all(15),
          cursorColor: Colors.yellow,
          placeholder: placeholder,
          obscureText: obscureText,
          placeholderStyle: const TextStyle(
              color: Color(0xFF818181),
              fontSize: 16,
              fontWeight: FontWeight.w300),
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
                color: Color(0xFF818181),
                fontSize: 16,
                fontWeight: FontWeight.w300),
          ),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFD0D0D0), width: 2.0),
            color: const Color(0xFFF8F8F8),
            borderRadius: const BorderRadius.all(
              Radius.circular(6),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDateInputWithLabel(BuildContext context,
      {required String labelText}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText,
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                color: Color(0xFF525252),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            )),
        GestureDetector(
          onTap: () {
            _selectDate(context);
          },
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFD0D0D0), width: 2.0),
              color: const Color(0xFFF8F8F8),
              borderRadius: const BorderRadius.all(
                Radius.circular(6),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Data',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          color: Color(0xFF525252),
                          fontSize: 16,
                          fontWeight: FontWeight.w300),
                    )),
                const Icon(
                  Icons.calendar_today,
                  color: Color(0xFF818181),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGenderDropdownWithLabel(BuildContext context,
      {required String labelText}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText,
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                color: Color(0xFF525252),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            )),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: Color(0xFFD0D0D0), width: 2.0),
            ),
            fillColor: const Color(0xFFF8F8F8),
            filled: true,
          ),
          items: ['Masculino', 'Feminino', 'Outro']
              .map((gender) => DropdownMenuItem<String>(
                    value: gender,
                    child: Text(gender,
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              color: Color(0xFF525252),
                              fontSize: 16,
                              fontWeight: FontWeight.w300),
                        )),
                  ))
              .toList(),
          onChanged: (String? value) {},
        ),
      ],
    );
  }

  void setState(Null Function() param0) {}
}
