import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:x_equis/core/core.dart';
import 'package:x_equis/src/auth/data/auth_data.dart';
import 'package:x_equis/src/shared/models/models.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isRemember = false;
  final userNameCont = TextEditingController();
  final emailCont = TextEditingController();
  final phoneCont = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final countryPicker = const FlCountryCodePicker();
  String phoneDial = '+ 591';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.only(
            top: kToolbarHeight,
            left: 20,
            right: 20,
          ),
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.1,
            ),
            Hero(
              tag: 'hero-logo',
              child: Container(
                height: 150,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/icons/icon.jpg'),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: userNameCont,
              decoration: const InputDecoration(
                hintText: 'Nombre de usuario',
                prefixIcon: Icon(Icons.person_outline),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Este campo es requerido';
                }
                return null;
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: emailCont,
              decoration: const InputDecoration(
                hintText: 'Correo electrónico',
                prefixIcon: Icon(Icons.email_outlined),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Este campo es requerido';
                }
                return null;
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: phoneCont,
              decoration: InputDecoration(
                prefixIcon: IconButton(
                  onPressed: () async {
                    final picked = await countryPicker.showPicker(
                      context: context,
                    );
                    phoneDial = picked?.dialCode ?? '+591';
                    setState(() {});
                  },
                  icon: Text(phoneDial),
                ),
                hintText: 'Nro. celular',
              ),
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Este campo es requerido';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            Center(
              child: FilledButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    _registerUser();
                  }
                },
                child: const Text(
                  'Registrarse',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _registerUser() async {
    final email = emailCont.text;
    final phone = phoneCont.text;
    final userName = userNameCont.text;

    final user = UserModel(name: userName, email: email, phone: phone);

    context.showLoadingDialog();
    try {
      await AuthData.signUp(user: user);
      if (mounted) {
        Navigator.pop(context);
        context.mShowSnackBar(message: 'Registro exitoso');
        Navigator.pushNamedAndRemoveUntil(
          context,
          AppRoutes.navigation,
          (_) => false,
        );
      }
    } catch (e) {
      if (mounted) {
        Navigator.pop(context);
        context.mShowSnackBar(message: 'Error $e');
      }
    }
  }
}
