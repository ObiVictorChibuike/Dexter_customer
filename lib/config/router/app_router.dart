import 'package:flutter/material.dart';
import 'package:nettapp/config/router/routes.dart';
import 'package:nettapp/core/widgets/error_screen.dart';
import 'package:nettapp/features/auth/screens/landing_screen.dart';
import 'package:nettapp/features/auth/screens/login_screen.dart';
import 'package:nettapp/features/home/screens/home_screen.dart';
import 'package:nettapp/features/outlets/screens/outlet_form_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    // logger.i("This is the route: ${routeSettings.name}");
    switch (routeSettings.name) {
      case Routes.landingScreen:
        return MaterialPageRoute(
          builder: (_) => const LandingScreen(),
        );

      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case Routes.outletForm:
        return MaterialPageRoute(
          builder: (_) => const OutletFormScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const ErrorScreen(),
        );
    }
  }
}
