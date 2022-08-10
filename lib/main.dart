import 'package:flutter/material.dart';
import 'package:resi_cek_app/Page/Home.dart';
import 'package:resi_cek_app/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.lightTheme,
      home: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: const Scaffold(
          resizeToAvoidBottomInset: false,
          body: Home(),
        ),
      ),
    );
  }
}
