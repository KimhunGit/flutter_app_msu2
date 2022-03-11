import 'package:flutter/material.dart';
import 'package:flutter_app_msu2/views/splas_screen_ui.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplasScreenUI(),
      theme: ThemeData(
        fontFamily: 'Kanit',
        primarySwatch: Colors.yellow,
      ),
    ),
  );
}
