import 'package:app_posts/app/theme/app_theme.dart';
import 'package:app_posts/app/utils/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:asuka/asuka.dart' as asuka;

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Modular.setNavigatorKey(NavigationService.navigatorKey);
    Modular.setObservers([asuka.asukaHeroController]);

    return MaterialApp.router(
      builder: asuka.builder,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: AppTheme.colors.primary,
        appBarTheme: AppBarTheme(
          backgroundColor: AppTheme.colors.primary,
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
