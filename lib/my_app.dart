import 'package:flutter/material.dart';
import 'package:sample_six/constants/colors.dart';

import 'alert_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: tdUltraViolet,
          appBar: _buildAppBar(),
          body: const AlertText(),
        ));
  }
}

AppBar _buildAppBar() {
  String appTitle = 'TASKS LIST';
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(
          Icons.menu,
          color: tdWhite,
          size: 30,
        ),
        Text(appTitle,
            style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        Container(
          height: 60,
          width: 60,
          child: ClipRRect(

            borderRadius: BorderRadius.circular(30),
            child: Image.asset('assets/images/small01_logo.png'),
          ),
        ),
      ],
    ),
    backgroundColor: tdUltraViolet,
    centerTitle: true,
    toolbarHeight: 70,
  );
}


