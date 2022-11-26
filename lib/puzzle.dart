import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:puzzles/secondpage.dart';
import 'package:puzzles/utils.dart';

class puzzle extends StatefulWidget {
  int cnt;

  puzzle(this.cnt);

  @override
  State<puzzle> createState() => _puzzleState();
}

class _puzzleState extends State<puzzle> {

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
                'Select Puzzles',
                style: GoogleFonts.abel(
                    fontSize: 40,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff1335e7)),
              ),
            ),
            Expanded(
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: GridView.builder(
                      itemCount: 20,
                      itemBuilder: (context, index) {

                        int cnt=utils.prefs!.getInt('cnt') ?? 0;
                        // 0 : Pending
                        // 1 : Clear
                        // 2 : Skip
                        int status = utils.prefs!.getInt('level$index') ?? 0;

                        if(status == 1)
                        {
                          return InkWell(
                            onTap: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                                return secondpage(index);
                              },));
                            },
                            child: Container(
                              color: Colors.green,
                              margin: EdgeInsets.all(10),
                              child: Text("${index+1}"),
                            ),
                          );
                        } else if(status == 2){
                          return InkWell(
                            onTap: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                                return secondpage(index);
                              },));
                            },
                            child: Container(
                              color: Colors.amberAccent,
                              margin: EdgeInsets.all(10),
                              child: Text("${index+1}"),
                            ),
                          );
                        } else{
                          if(index == cnt)
                          {
                            return InkWell(
                              onTap: () {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                                  return secondpage(index);
                                },));
                              },
                              child: Container(
                                color: Colors.amberAccent,
                                margin: EdgeInsets.all(10),
                                child: Text("${index+1}"),
                              ),
                            );
                          }
                          else{
                            return Container(
                              color: Colors.red,
                              margin: EdgeInsets.all(10),
                            );
                          }
                        }
                      },gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10)),
                )),
            InkWell(
              child: Container(
                height: 50,
                margin: EdgeInsets.all(15),
                alignment: Alignment.centerRight,
                child: Image(image: AssetImage("fota/trophy.png"),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
