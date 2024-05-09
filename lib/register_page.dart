import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:opamobile/data/UserData.dart';
import 'package:opamobile/service/CepService.dart';
import 'colors.dart';
import 'package:intl/intl.dart';

//!D/EGL_emulation, !D/InputMethodManager, !I/ImeTracker, !W/RemoteInputConnectionImpl, !D/InsetsController, !E/FrameTracker, !I/TextInputPlugin, !W/WindowOnBackDispatcher

// ignore: must_be_immutable
class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController cpfController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController cepController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController neighborhoodController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController streetNumberController = TextEditingController();
  final TextEditingController complementController = TextEditingController();

  String _cep = '';
  String _street = '';
  String _neighborhood = '';
  String _city = '';
  String _state = '';

  void _updateAddress() async {
    _cep = cepController.text;
    final address = await CepService.fetchAddress(_cep);
    setState(() {
      _street = address['street'];
      _neighborhood = address['neighborhood'];
      _city = address['city'];
      _state = address['state'];
    });
  }

  var label;

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      setState(() {
        birthDateController.text = DateFormat('dd/MM/yyyy').format(pickedDate);
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
                  labelText: 'Senha',
                  placeholder: 'Digite sua senha',
                ),
                const SizedBox(height: 5),
                _buildTextFormFieldWithLabel(
                  context,
                  labelText: 'Confirme a senha',
                  placeholder: 'Confirme a senha',
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
                      final String name = nameController.text;
                      final String email = emailController.text;
                      final String password = passwordController.text;
                      final String cpf = cpfController.text;
                      final String birthDate = birthDateController.text;
                      final String gender = genderController.text;
                      final String cep = cepController.text;
                      final String phone = phoneController.text;
                      final String city = cityController.text;
                      final String neighborhood = neighborhoodController.text;
                      final String state = stateController.text;
                      final String street = streetController.text;
                      final String streetNumber = streetNumberController.text;
                      final String complement = complementController.text;
                      final String username = usernameController.text;

                      final UserData userCreate = UserData(
                          username: username,
                          password: password,
                          email: email,
                          name: name,
                          gender: gender,
                          cpf: cpf,
                          phoneNumber: phone,
                          street: street,
                          neighborhood: neighborhood,
                          streetNumber: streetNumber,
                          complement: complement,
                          city: city,
                          state: state,
                          cep: cep,
                          birthDate: birthDate);
                      print(userCreate);
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
      {required String labelText, required String placeholder}) {
    switch (labelText) {
      case 'Nome':
        label = nameController;
        break;
      case 'Email':
        label = emailController;
        break;
      case 'Senha':
        label = passwordController;
        break;
      case 'CPF':
        label = cpfController;
        break;
      case 'Data de Nascimento':
        label = birthDateController;
        break;
      case 'Gênero':
        label = genderController;
        break;
      case 'CEP':
        label = cepController;
        break;
      case 'Cidade':
        label = cityController;
        break;
      case 'Bairro':
        label = neighborhoodController;
        break;
      case 'Estado':
        label = stateController;
        break;
      case 'Rua':
        label = streetController;
        break;
      case 'Número':
        label = streetNumberController;
        break;
      case 'Complemento':
        label = complementController;
        break;
      case 'Usuário':
        label = usernameController;
        break;
      case 'Telefone':
        label = phoneController;
        break;
      case 'Confirme a senha':
        label = passwordConfirmController;
        break;
    }
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
          onChanged: (value) {
            setState(() {
              _cep = value;
            });
            _updateAddress();
          },
          obscureText: labelText == 'Senha' || labelText == 'Confirme a senha',
          controller: label,
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
          child: AbsorbPointer(
            child: TextFormField(
              controller: birthDateController,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(15),
                hintText: 'Selecione a data',
                hintStyle: const TextStyle(
                  color: Color(0xFF818181),
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0xFFD0D0D0),
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
                fillColor: const Color(0xFFF8F8F8),
                filled: true,
                suffixIcon: const Icon(
                  Icons.calendar_today,
                  color: Color(0xFF818181),
                ),
              ),
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
          value: genderController.text.isNotEmpty
              ? genderController.text
              : null, // Defina o valor inicial como null
          onChanged: (String? value) {
            setState(() {
              genderController.text = value ??
                  ''; // Atualize o valor do controlador apenas quando um item é selecionado
            });
          },
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide:
                  const BorderSide(color: Color(0xFFD0D0D0), width: 2.0),
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
        ),
      ],
    );
  }
}
