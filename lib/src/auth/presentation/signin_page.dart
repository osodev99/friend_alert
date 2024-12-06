import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:x_equis/core/core.dart';
import 'package:x_equis/core/prefs/app_prefs.dart';
import 'package:x_equis/src/auth/data/auth_data.dart';
import 'package:x_equis/src/shared/models/models.dart';
import 'package:x_equis/src/shared/widgets/phone_text_field.dart';
import 'package:x_equis/src/shared/widgets/trust_friend_form.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isRemember = false;
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
            PhoneTextField(
              controller: phoneCont,
              onPhoneDial: (value) => phoneDial = value ?? '+ 591',
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _makeLogin();
              },
              child: const Text(
                'LOGIN',
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('No tienes una cuenta?'),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.signUp);
                  },
                  child: const Text('Crear cuenta'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _makeLogin() async {
    final email = emailCont.text;
    final phone = '${phoneDial.trim()}${phoneCont.text}';

    context.showLoadingDialog();

    try {
      final user = await AuthData.signIn(email: email, phone: phone);
      await AppPrefs.saveUserJson(json: user.toJson());

      if (mounted) {
        Navigator.pop(context);
        _showAddFriendBottomSheet(context);
        // Navigator.popAndPushNamed(context, AppRoutes.navigation);
      }
    } catch (e) {
      if (mounted) {
        Navigator.pop(context);
        context.mShowSnackBar(message: 'Credenciales incorrectas');
      }
    }
  }

  void _showAddFriendBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return AnimatedPadding(
          padding: MediaQuery.of(context).viewInsets,
          duration: const Duration(milliseconds: 100),
          curve: Curves.decelerate,
          child: TrustFriendForm(
            onSave: (name, phone) async {
              final user = UserModel(
                name: name,
                phone: phone,
                email: '',
              );
              await AuthData.signUp(user: user);
              if (context.mounted) {
                Navigator.pop(context);
              }
            },
          ),
        );
      },
    );
  }
}
