import 'package:flutter/material.dart';
import 'package:x_equis/core/core.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isRemember = false;
  final emailCont = TextEditingController();
  final passCont = TextEditingController();
  final formKey = GlobalKey<FormState>();

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
                hintText: 'Email',
                prefixIcon: Icon(Icons.email),
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
              controller: passCont,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.lock),
                hintText: 'Password',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Este campo es requerido';
                }
                return null;
              },
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
          ],
        ),
      ),
    );
  }

  void _makeLogin() async {
    final email = emailCont.text;
    final pass = passCont.text;

    context.showLoadingDialog();

    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      Navigator.pop(context);
      if (email == 'admin' && pass == 'admin') {
        Navigator.pushReplacementNamed(context, AppRoutes.navigation);
      } else {
        context.mShowSnackBar(message: 'Credenciales incorrectas');
      }
    }
  }
}
