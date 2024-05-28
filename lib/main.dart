import 'package:flutter/material.dart';
import 'package:opamobile/pages/login/login_page.dart';
import 'package:opamobile/pages/menu/menu_page.dart';
import 'package:opamobile/pages/table/table_page.dart';
import 'package:opamobile/utils/opa_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Opa!',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: OpaColors.brownOpa),
        useMaterial3: true,
      ),
      home: const MenuPage(),
    );
  }
}
