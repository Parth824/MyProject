import 'package:flutter/material.dart';
import 'package:new_cricdesing/homepage.dart';
import 'package:new_cricdesing/order_page.dart';
import 'package:new_cricdesing/paint_pages.dart';


void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: appBarTheme(),
      ),
      home:Order_Page(),
    ),
  );
}
