import 'package:flutter/material.dart';
import 'package:puzzles/data.dart';
import 'package:puzzles/main.dart';
import 'package:puzzles/utils.dart';
import 'package:puzzles/winningpage.dart';

class secondpage extends StatefulWidget {
  int cnt;

  secondpage(this.cnt);

  @override
  State<secondpage> createState() => _secondpageState();
}

class _secondpageState extends State<secondpage> {
  String temp = "";

  int cnt = 0;
  List<String> anslist = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14"];

  @override
  void initState() {
    super.initState();

    cnt = widget.cnt;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage(data.pic3), fit: BoxFit.fill),
        ),
        child: Expanded(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_right_rounded),
                  ),
                  InkWell(
                    onTap: () {
                      if (cnt < data.phota1.length - 1) {
                        cnt++;
                      }
                      setState(() {});
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      margin: EdgeInsets.only(top: 30, left: 7),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(data.pic5), fit: BoxFit.fill)),
                      alignment: Alignment.center,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(data.pic4), fit: BoxFit.fill)),
                    alignment: Alignment.center,
                    child: Text(
                      "Leval ${cnt + 1}",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    margin: EdgeInsets.only(top: 30, right: 7),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(data.pic6), fit: BoxFit.fill)),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 25, left: 15, right: 15),
                height: 350,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("phota/p${cnt + 1}.png"),
                  fit: BoxFit.fill,
                )),
              ),
              Spacer(),
              Container(
                color: Colors.black.withOpacity(0.6),
                margin: EdgeInsets.only(bottom: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 35,
                          width: 150,
                          color: Colors.white,
                          child: Text(
                            temp,
                            style: TextStyle(
                                fontSize: 15, color: Colors.deepOrange),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            if (temp != null && temp.length > 0) {
                              temp = temp.substring(0, temp.length - 1);
                            }
                            setState(() {});
                          },
                          child: Container(
                            margin:
                                EdgeInsets.only(top: 30, bottom: 35, left: 5),
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(data.pic7),
                                    fit: BoxFit.fill)),
                            alignment: Alignment.center,
                          ),
                        ),
                        Container(
                          height: 30,
                          width: 90,
                          margin:
                              EdgeInsets.only(top: 30, bottom: 35, left: 35),
                          child: OutlinedButton(
                              style: TextButton.styleFrom(
                                textStyle: TextStyle(fontSize: 30),
                              ),
                              onPressed: () async {
                                // 0 : Pending
                                // 1 : clear
                                // 2 : Skip
                                if (temp == anslist[cnt]) {
                                  int status =
                                      utils.prefs!.getInt('level$cnt') ?? 0;

                                  if (status == 0) {
                                    await utils.prefs!.setInt('lavel$cnt', 1);
                                    cnt++;
                                    await utils.prefs!.setInt("cnt", cnt);

                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(
                                      builder: (context) {
                                        return winningpage(cnt);
                                      },
                                    ));
                                  } else if (status == 1) {
                                    cnt++;
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(
                                      builder: (context) {
                                        return winningpage(cnt);
                                      },
                                    ));
                                  } else if (status == 2) {
                                    await utils.prefs!.setInt('lavel$cnt', 1);
                                    cnt++;
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(
                                      builder: (context) {
                                        return winningpage(cnt);
                                      },
                                    ));
                                  }
                                }
                              },
                              child: Text(
                                "SUMBIT",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        buton(0),
                        buton(1),
                        buton(2),
                        buton(3),
                        buton(4),
                        buton(5),
                        buton(6),
                        buton(7),
                        buton(8),
                        buton(9)
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> goback() {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return homepage();
      },
    ));
    return Future.value();
  }

  buton(int i) {
    List<String> l = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"];

    return InkWell(
      onTap: () {
        temp = "${temp}${l[i]}";

        setState(() {});
      },
      child: Container(
        margin: EdgeInsets.all(5),
        height: 20,
        width: 25,
        decoration: BoxDecoration(
          color: Colors.grey,
          border: Border.all(
            color: Colors.white,
            width: 1,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          l[i],
          style: TextStyle(fontSize: 15, color: Colors.white),
        ),
      ),
    );
  }
}
