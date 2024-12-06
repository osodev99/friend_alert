import 'package:flutter/material.dart';

import '../../src/auth/presentation/signin_page.dart';
import '../../src/auth/presentation/signup_page.dart';
import '../../src/auth/presentation/splash_page.dart';
import '../../src/navigation/navigation_page.dart';

abstract class AppRoutes {
  static const String splash = 'splash';
  static const String signIn = 'signIn';
  static const String signUp = 'signUp';
  static const String navigation = 'navigation';

  static get onGenerateRoute =>
      (RouteSettings settings) => switch (settings.name) {
            splash => pageRouter(const SplashPage()),
            signIn => pageRouter(const SignInPage()),
            signUp => pageRouter(const SignUpPage()),
            navigation => pageRouter(const NavigationPage()),
            _ => _errorRoute(),
          };

  static MaterialPageRoute pageRouter(Widget page) {
    return MaterialPageRoute(builder: (_) => page);
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
