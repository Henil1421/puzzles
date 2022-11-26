import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:puzzles/main.dart';
import 'package:puzzles/secondpage.dart';
import 'package:puzzles/utils.dart';

class winningpage extends StatefulWidget {
  int cnt;
  winningpage(this.cnt);


  @override
  State<winningpage> createState() => _winningpageState();
}

class _winningpageState extends State<winningpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('fota/pic.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 60),
              child: Text(
                'Puzzles${widget.cnt} Completed',
                style: GoogleFonts.abel(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff1335e7)),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 100,
                        margin: EdgeInsets.only(top: 50,right: 7,left: 7),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'fota/trophy.png',
                              ),
                              fit: BoxFit.fill,
                            )
                        ),
                      ),
                      // btn(0, 50, 50),
                      // btn(1, 50, 50),
                      // btn(2, 50, 50),
                      // Container(
                      //   height: 100,
                      //   alignment: Alignment.center,
                      //   child: Text("SHARE THIS PUZZLE",
                      //       style: TextStyle(color: Colors.indigoAccent, fontSize: 20)),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

// Widget btn(int i, double height1, double width1) {
//   List<String> btname = ["CONTINUE", "MAIN MENU", "BUY PRO"];
//
//   return InkWell(
//     onTap: () {
//       //** CONTINUE **//
//       if (i == 0) {
//
//         int cnt= utils.prefs!.getInt('cnt') ?? 0;
//
//         Navigator.pushReplacement(context, MaterialPageRoute(
//           builder: (context) {
//             return secondpage(cnt);//secondpage(cnt);
//           },
//         ));
//       }
//       //** MAIN MENU **//
//       else if (i == 1) {
//         Navigator.pushReplacement(context, MaterialPageRoute(
//           builder: (context) {
//             return homepage();//homepage();
//           },
//         ));
//       }
//       //** BUY PRO **//
//       else if (i == 3) {}
//     },
//     child: Container(
//       height: height1 * .06,
//       width: 160,
//       decoration: BoxDecoration(
//           gradient: LinearGradient(colors: [
//             Colors.blueGrey.shade300,
//             Colors.white,
//             Colors.blueGrey.shade300,
//           ], begin: Alignment.bottomLeft, end: Alignment.topRight),
//           border: Border.all(color: Colors.black),
//           borderRadius: BorderRadius.circular(10)),
//       alignment: Alignment.center,
//       margin: EdgeInsets.all(5),
//       child: Text(
//         "${btname[i]}",
//         style: TextStyle(
//             color: Colors.black,
//             fontSize: height1 * .02,
//             fontWeight: FontWeight.bold),
//       ),
//     ),
//   );
// }

}
