import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:puzzles/puzzle.dart';
import 'package:puzzles/secondpage.dart';
import 'package:puzzles/splash.dart';
import 'package:puzzles/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main()
{
  runApp(MaterialApp(home: splash(),));
}

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {

  int? cnt;
  int ?i;
  void initState(){

    super.initState();
    loadPref();

  }

  loadPref() async {
    utils.prefs=await SharedPreferences.getInstance();
    cnt=utils.prefs!.getInt("cnt") ?? 0;

  }

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
                'Math Puzzles',
                style: GoogleFonts.abel(
                    fontSize: 40,
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
                  child: Container(
                    height: 480,
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'fota/blackboard.png',
                          ),
                          fit: BoxFit.fill,
                        )),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 140),
                          child: OutlinedButton(
                              style: TextButton.styleFrom(
                                textStyle: TextStyle(fontSize: 30),
                              ),
                              onPressed: () {
                                if(i == 0)
                                {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                                    return secondpage(cnt!);
                                  },
                                  ));
                                }
                              },
                              child: Text(
                                "Continue",
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 40),
                          child: OutlinedButton(
                              style: TextButton.styleFrom(
                                textStyle: TextStyle(fontSize: 30),
                              ),
                              onPressed: () {
                                if(i == 1)
                                {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                                    return puzzle(cnt!);
                                  },));
                                }
                              },
                              child: Text(
                                "Puzzles",
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 40),
                          child: OutlinedButton(
                              style: TextButton.styleFrom(
                                textStyle: TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                              onPressed: () {
                                if (i == 2) {}
                              },
                              child: Text(
                                "Buy Pro",
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
