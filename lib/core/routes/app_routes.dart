import 'package:flutter/material.dart';

import '../../src/auth/signin/presentation/signin_page.dart';
import '../../src/auth/signin/presentation/splash_page.dart';
import '../../src/profile/presentation/profile_page.dart';

abstract class AppRoutes {
  static const String splash = '/splash';
  static const String signIn = '/signIn';
  static const String profile = '/profile';

  static get onGenerateRoute =>
      (RouteSettings settings) => switch (settings.name) {
            splash => pageRouter(const SplashPage()),
            signIn => pageRouter(const SignInPage()),
            profile => pageRouter(const ProfilePage()),
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
