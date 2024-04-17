import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

// ignore: must_be_immutable
class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

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
        backgroundColor: Colors.yellow, // Alteração para a cor amarela
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + kToolbarHeight,
        ),
        child: Form(
          key: _formKey,
          child: Container(
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
                _buildTextFormFieldWithLabel(
                  context,
                  labelText: 'Nome',
                  placeholder: 'Digite o seu nome completo',
                ),
                const SizedBox(height: 5),
                _buildTextFormFieldWithLabel(
                  context,
                  labelText: 'Email',
                  placeholder: 'Digite o seu email',
                ),
                const SizedBox(height: 5),
                _buildTextFormFieldWithLabel(
                  context,
                  labelText: 'Usuário',
                  placeholder: 'Digite o seu usuário',
                ),
                const SizedBox(height: 5),
                _buildTextFormFieldWithLabel(
                  context,
                  labelText: 'CPF',
                  placeholder: 'Digite o seu CPF',
                ),
                const SizedBox(height: 5),
                _buildDateInputWithLabel(
                  context,
                  labelText: 'Data de nascimento',
                ),
                const SizedBox(height: 5),
                _buildGenderDropdownWithLabel(
                  context,
                  labelText: 'Gênero',
                ),
                const SizedBox(height: 5),
                _buildTextFormFieldWithLabel(
                  context,
                  labelText: 'Telefone',
                  placeholder: 'Digite o seu número de telefone',
                ),
                const SizedBox(height: 5),
                _buildTextFormFieldWithLabel(
                  context,
                  labelText: 'CEP',
                  placeholder: 'Digite o seu CEP',
                ),
                const SizedBox(height: 5),
                _buildTextFormFieldWithLabel(
                  context,
                  labelText: 'Cidade',
                  placeholder: 'Digite o nome da sua cidade',
                ),
                const SizedBox(height: 5),
                _buildTextFormFieldWithLabel(
                  context,
                  labelText: 'Bairro',
                  placeholder: 'Digite o nome do seu bairro',
                ),
                const SizedBox(height: 5),
                _buildTextFormFieldWithLabel(
                  context,
                  labelText: 'Estado',
                  placeholder: 'Digite a sigla do seu estado',
                ),
                const SizedBox(height: 5),
                _buildTextFormFieldWithLabel(
                  context,
                  labelText: 'Rua',
                  placeholder: 'Digite o nome da sua rua',
                ),
                const SizedBox(height: 5),
                _buildTextFormFieldWithLabel(
                  context,
                  labelText: 'Número',
                  placeholder: 'Digite o número da sua residência',
                ),
                const SizedBox(height: 5),
                _buildTextFormFieldWithLabel(
                  context,
                  labelText: 'Complemento',
                  placeholder: 'Digite o complemento (opcional)',
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: CupertinoButton(
                    padding: const EdgeInsets.all(17),
                    color: Colors.yellow,
                    child: const Text(
                      'CADASTRAR',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {}
                    },
                  ),
                ),
                const SizedBox(height: 7),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormFieldWithLabel(BuildContext context,
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
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Por favor, digite seu $labelText';
            }
            return null;
          },
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(15),
            hintText: placeholder,
            hintStyle: const TextStyle(
                color: Color(0xFF818181),
                fontSize: 16,
                fontWeight: FontWeight.w300),
            border: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Color(0xFFD0D0D0), width: 2.0),
              borderRadius: BorderRadius.circular(6),
            ),
            fillColor: const Color(0xFFF8F8F8),
            filled: true,
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
              border: Border.all(color: Color(0xFFD0D0D0), width: 2.0),
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
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Por favor, selecione seu gênero';
            }
            return null;
          },
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: Color(0xFFD0D0D0), width: 2.0),
            ),
            fillColor: Color(0xFFF8F8F8),
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
}
