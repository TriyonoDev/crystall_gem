import 'dart:ui';

import 'package:crystall_gem/constant/constant_color.dart';
import 'package:crystall_gem/ui/screen/second_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

import 'detail_screen.dart';
import 'home_screen.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SimpleHiddenDrawer(
      menu: Menu(),
      screenSelectedBuilder: (position, controller) {
        Widget? screenCurrent;
        switch (position) {
          case 0:
            screenCurrent = HomeScreen();
            break;
          case 1:
            screenCurrent = SecondScreen();
            break;
        }

        return Scaffold(
          backgroundColor: Colors.white,
          // resizeToAvoidBottomInset: false,

          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(
                Icons.menu,
                color: ConstantColor.primaryColor,
              ),
              onPressed: () {
                controller.toggle();
              },
            ),
            elevation: 0,
            title: Column(
              children: [
                Text(
                  'Location',
                  style: TextStyle(color: ConstantColor.primaryColor),
                ),
                Text(
                  'San Francisco',
                  style: TextStyle(color: ConstantColor.primaryColor),
                ),
              ],
            ),
            centerTitle: true,
            actions: [
              CircleAvatar(
                  backgroundColor: ConstantColor.primaryColor,
                  maxRadius: 20,
                  child: Icon(Icons.person, color: Colors.white)),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          body: screenCurrent,
        );
      },
    );
  }
}

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late SimpleHiddenDrawerController _controller;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _controller = SimpleHiddenDrawerController.of(context);
    _controller.addListener(() {
      if (_controller.state == MenuState.open) {
        _animationController.forward();
      }

      if (_controller.state == MenuState.closing) {
        _animationController.reverse();
      }
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      child: Stack(
        children: <Widget>[
          Scaffold(
            backgroundColor: ConstantColor.primaryColor,
            body: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          maxRadius: 30,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.person,
                              color: ConstantColor.primaryColor),
                        ),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Jessica Hernandez',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18)),
                            Text('Active Status',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.settings,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Setting',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(' | ', style: TextStyle(color: Colors.white)),
                        SizedBox(
                          width: 20,
                        ),
                        Text('logout', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          FadeTransition(
            opacity: _animationController,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    buildButton(
                        iconData: Icons.home,
                        label: 'Home Screen',
                        onPressed: () {
                          _controller.setSelectedMenuPosition(0);
                        }),
                    buildButton(
                        iconData: Icons.home,
                        label: 'Detail Screen',
                        onPressed: () {
                          _controller.setSelectedMenuPosition(1);
                        }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox buildButton({
    IconData? iconData = Icons.home,
    String? label,
    required VoidCallback? onPressed,
  }) {
    return SizedBox(
      width: 200.0,
      child: Row(
        children: [
          Icon(
            iconData,
            color: Colors.white,
          ),
          TextButton(
            onPressed: onPressed,
            child: Text(
              '$label',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
