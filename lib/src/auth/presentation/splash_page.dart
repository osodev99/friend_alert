import 'package:flutter/material.dart';
import 'package:x_equis/core/core.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pushReplacementNamed(
          context,
          AppRoutes.signIn,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: 'hero-logo',
        child: Center(
          child: Image.asset(
            'assets/icons/icon.jpg',
            width: 200,
            height: 200,
          ),
        ),
      ),
    );
  }
}
