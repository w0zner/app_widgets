import 'package:flutter/material.dart';
import 'package:widget_app/config/router/app_router.dart';
import 'package:widget_app/theme/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      title: 'Material App',
      theme: AppTheme(selectedColor: 1).getTheme(),
      //home: Home(),
      // Forma antigua de definir rutas
      /*       routes: {
        '/home': (context) => Home(),
        '/buttons': (context) => const ButtonsScreen(),
        '/cards': (context) => const CardsScreen(),
      }, */
    );
  }
}
