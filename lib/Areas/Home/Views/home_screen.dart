import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vexa_postit/Areas/Postit/Views/add_postit_screen.dart';
import 'package:vexa_postit/Common/GlobalFunctions.dart';
import 'package:vexa_postit/Common/Navigator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.star,
                color: Colors.amber[900],
              )),
          IconButton(
              onPressed: () {
                NavigatorController().navigatorToReturn(context, AddPostitScreen());
              },
              icon: Icon(
                Icons.add,
                color: Colors.black,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: getSize(context).width * 0.45,
                  decoration: BoxDecoration(color: Colors.pink, borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      "data",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  width: getSize(context).width * 0.02,
                ),
                Container(
                  height: 100,
                  width: getSize(context).width * 0.45,
                  decoration: BoxDecoration(color: Colors.pink, borderRadius: BorderRadius.circular(20)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
