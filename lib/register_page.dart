import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key});

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
        backgroundColor: Colors.transparent,
      ),
      body: Container(
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
                child: const Text(
                  'Cadastrar',
                  style: TextStyle(
                    color: Colors.brown,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: () {},
              ),
            ),
            const SizedBox(height: 7),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFieldWithLabel(BuildContext context,
      {required String labelText,
      required String placeholder,
      bool obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(
            color: Color(0xFF525252),
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        CupertinoTextField(
          padding: const EdgeInsets.all(15),
          cursorColor: Colors.yellow,
          placeholder: placeholder,
          obscureText: obscureText,
          placeholderStyle:
              const TextStyle(color: Color(0xFF818181), fontSize: 16),
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
                color: Color(0xFF818181),
                fontSize: 16,
                fontWeight: FontWeight.w300),
          ),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF818181), width: 2.0),
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
        Text(
          labelText,
          style: const TextStyle(
            color: Color(0xFF525252),
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        GestureDetector(
          onTap: () {
            // Implementar a lógica do DatePicker
          },
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFF818181), width: 2.0),
              color: const Color(0xFFF8F8F8),
              borderRadius: const BorderRadius.all(
                Radius.circular(6),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Selecionar data',
                  style: const TextStyle(
                    color: Color(0xFF818181),
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Icon(
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
        Text(
          labelText,
          style: const TextStyle(
            color: Color(0xFF525252),
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide:
                  BorderSide(color: const Color(0xFF818181), width: 2.0),
            ),
            fillColor: const Color(0xFFF8F8F8),
            filled: true,
          ),
          items: ['Masculino', 'Feminino', 'Outro']
              .map((gender) => DropdownMenuItem<String>(
                    value: gender,
                    child: Text(
                      gender,
                      style: const TextStyle(
                        color: Color(0xFF818181),
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ))
              .toList(),
          onChanged: (String? value) {
            // Implementar a lógica de seleção do gênero
          },
        ),
      ],
    );
  }
}
