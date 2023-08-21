import 'package:flutter/material.dart';
import 'package:nettapp/config/router/routes.dart';
import 'package:nettapp/core/widgets/error_screen.dart';
import 'package:nettapp/features/auth/screens/landing_screen.dart';
import 'package:nettapp/features/auth/screens/login_screen.dart';
import 'package:nettapp/features/home/screens/home_screen.dart';
import 'package:nettapp/features/outlets/screens/outlet_form_screen.dart';
import 'package:nettapp/features/outlets/screens/outlet_trade_visit_details_screen.dart';
import 'package:nettapp/features/outlets/screens/outlets_screen.dart';
import 'package:nettapp/features/products/screens/sku_list.dart';
import 'package:nettapp/features/scheduled%20visits/presentation/pages/scheduled_visits_screen.dart';
import 'package:nettapp/features/trade_visit/screens/completed_visits_screen.dart';
import 'package:nettapp/features/trade_visit/screens/product_list_screen.dart';
import 'package:nettapp/features/trade_visit/screens/trade_visit_screen.dart';

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
      case Routes.outlets:
        return MaterialPageRoute(
          builder: (_) => const OutletsScreen(),
        );

      case Routes.tradeVisit:
        return MaterialPageRoute(
          builder: (_) => const TradeVisitFormScreen(),
        );
      case Routes.tradeVisitDetails:
        return MaterialPageRoute(
          builder: (_) => const OutletTradeVisitDetailsScreen(),
        );
      case Routes.completedVisits:
        return MaterialPageRoute(
          builder: (_) => const CompletedVisitsScreen(),
        );
      case Routes.productsListScreen:
        return MaterialPageRoute(
          builder: (_) => const ProductListScreen(),
        );

      case Routes.schedule:
        return MaterialPageRoute(
          builder: (_) => const ScheduledVisitsScreen(),
        );

      case Routes.skuScreen:
        return MaterialPageRoute(
          builder: (_) => const SkuListScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const ErrorScreen(),
        );
    }
  }
}
