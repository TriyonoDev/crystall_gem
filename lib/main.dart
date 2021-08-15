import 'package:crystall_gem/constant/constant_color.dart';
import 'package:crystall_gem/ui/screen/home_screen.dart';
import 'package:crystall_gem/ui/screen/menu_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crystall Gems',
      theme: ThemeData(
        iconTheme: IconThemeData(color: ConstantColor.primaryColor),
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme.copyWith(
                bodyText1: TextStyle(color: ConstantColor.primaryColor),
                bodyText2: TextStyle(color: ConstantColor.primaryColor),
                caption: TextStyle(color: ConstantColor.primaryColor),
                subtitle1: TextStyle(color: ConstantColor.primaryColor),
                headline6: TextStyle(color: ConstantColor.primaryColor),
              ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              primary: ConstantColor.primaryColor,
              shape: RoundedRectangleBorder(

                borderRadius: BorderRadius.circular(15),
              )),
        ),
        primaryColor: ConstantColor.primaryColor,
        accentColor: ConstantColor.accentColor,
      ),
      home: MenuScreen(),
    );
  }
}
