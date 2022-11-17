import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        centerTitle: false,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text(
          'Hey, Jane!',
          style: GoogleFonts.dmSans(
            textStyle: TextStyle(color: Colors.black87.withOpacity(0.75)),
            fontSize: 20,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
          ),
          textAlign: TextAlign.start,
        ),
        actions: [
          Icon(
            Icons.add_photo_alternate_outlined,
            color: Colors.black54,
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.emoji_flags_rounded,
            color: Colors.black54,
          ),
          SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 14.0, bottom: 14.0),
            child: Container(
              width: 45,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        const Color(0xFF3366FF),
                        Color.fromARGB(255, 0, 172, 215),
                      ],
                      begin: const FractionalOffset(0.0, 0.0),
                      end: const FractionalOffset(1.0, 0.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  '10+',
                  style: GoogleFonts.dmSans(
                    textStyle: TextStyle(color: Colors.white),
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
            child: CircleAvatar(
              radius: 20,
            ),
          )
        ],
      ),
      // appBar: AppBar(
      //   shadowColor: Colors.transparent,
      //   backgroundColor: Colors.blue[100],
      //   actions: [
      //     IconButton(
      //         onPressed: () {},
      //         icon: Icon(
      //           Icons.star,
      //           color: Colors.amber[900],
      //         )),
      //     IconButton(
      //         onPressed: () {
      //           NavigatorController().navigatorToReturn(context, AddPostitScreen());
      //         },
      //         icon: Icon(
      //           Icons.add,
      //           color: Colors.black,
      //         ))
      //   ],
      // ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
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
            ),
          )
        ],
      ),
    );
  }
}
