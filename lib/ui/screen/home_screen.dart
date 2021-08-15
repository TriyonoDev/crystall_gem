import 'package:crystall_gem/constant/constant_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'detail_screen.dart';
import 'menu_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // resizeToAvoidBottomInset: true,

      body: Container(
        decoration: BoxDecoration(
            color: ConstantColor.accentColor,
            borderRadius: BorderRadius.circular(30)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  focusColor: Colors.white,
                  hintText: 'Search for Gems',
                  contentPadding: EdgeInsets.all(8),
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  buildCard(active: true, label: 'Quartz'),
                  buildCard(label: 'Selenite'),
                  buildCard(),
                  buildCard(),
                  buildCard(),
                  buildCard(),
                ],
              ),
            ),
            Expanded(
              flex: 7,
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (_, index) => buildCardDetail(index),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCardDetail(int index) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => DetailScreen(index: index,)));
      },
      child: Hero(
        tag: index,
        child: Material(
          type: MaterialType.transparency,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 30, right: 10, bottom: 0),
            child: Stack(
              overflow: Overflow.visible,
              // clipBehavior: ,
              children: [
                Card(
                  shadowColor: ConstantColor.primaryColor.withOpacity(0.3),
                  elevation: 15,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(child: SizedBox()),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            height: 120,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Angle Aura Point',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text('Pier 39'),
                                SizedBox(
                                  height: 5,
                                ),
                                Text('San Francisco, CA 94133 '),
                                SizedBox(
                                  height: 5,
                                ),
                                Text('12 mi  |  2x2\"'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: Text('\$10',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      )),
                ),
                Positioned(
                  left: -10,
                  top: -10,
                  child: Container(
                      height: 120,
                      width: 100,
                      decoration: BoxDecoration(
                        color: ConstantColor.secondaryColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Icon(Icons.ac_unit)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCard({
    bool? active = false,
    String? label = 'label',
    IconData? iconData = Icons.ac_unit,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Card(
            shadowColor: ConstantColor.primaryColor.withOpacity(0.3),
            elevation: 15,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: active == true ? ConstantColor.primaryColor : Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 50,
                height: 50,
                child: Icon(
                  Icons.ac_unit,
                  color: active == true
                      ? Colors.white
                      : ConstantColor.primaryColor,
                  size: 35,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '$label',
            style:
                TextStyle(fontWeight: active == true ? FontWeight.bold : null),
          )
        ],
      ),
    );
  }
}
