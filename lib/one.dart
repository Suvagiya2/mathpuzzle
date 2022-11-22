import 'package:flutter/material.dart';
import 'package:mathpuzzle/forth.dart';
import 'package:mathpuzzle/model.dart';
import 'package:mathpuzzle/second.dart';
import 'package:shared_preferences/shared_preferences.dart';

class first extends StatefulWidget {
  const first({Key? key}) : super(key: key);

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  String fonts = "f1";
  bool l=false;
  bool p=false;
  bool b=false;
  int cur_level=0;
  List<String> level_Status=[];
  SharedPreferences ?pref;


  @override
  void initState() {
    super.initState();
    level_Status=List.filled(model.ans.length, "no");
    getdata();
  }

  getdata()
  async {
   pref = await SharedPreferences.getInstance();
   print("pref: ${pref!.getInt("levelno")}");
   cur_level=pref!.getInt("levelno") ?? 0;
   for(int i=0;i<level_Status.length;i++)
     {
       level_Status[i]=pref?.getString("level_status$i") ?? "no";
       print(pref!.getString("level_status"));
     }
  }

  @override
  Widget build(BuildContext context) {
    double tot_size = MediaQuery.of(context).size.height;
    double Statusbar_size = MediaQuery.of(context).padding.top;
    double Screen_size = tot_size - Statusbar_size;

    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: Statusbar_size),
        height: Screen_size,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("photos/background.jpg"), fit: BoxFit.fill)),
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  "Math Puzzles",
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.blue,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                )),
            Center(
              child: Container(
                margin: EdgeInsets.all(20),
                height: 500,
                width: 400,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("photos/blackboard_main_menu.png"),
                        fit: BoxFit.fill)),
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 170, bottom: 10),
                        child: InkWell(
                          onTapUp: (details) {
                            setState(() {
                              l=false;
                            });
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return two(cur_level);
                            },));
                          },
                          onTapCancel: (){
                            setState(() {
                              l=true;
                            });
                          },
                          onTapDown: (details){
                            setState(() {
                              l=true;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(border: Border.all(color: (l==true)? Colors.white : Colors.black,width: 3)),
                            child: Text("CONTINUE",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: fonts,
                                      color: Colors.white)),
                          ),
                          ),
                        ),
                      InkWell(
                          onTapUp: (details) {
                            setState(() {
                              p=false;
                            });
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return four(cur_level, level_Status);
                            },));
                          },
                          onTapCancel: (){
                            setState(() {
                              p=true;
                            });
                          },
                          onTapDown: (details){
                            setState(() {
                              p=true;
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.only(top: 5, bottom: 10),
                            child: Container(
                              decoration: BoxDecoration(border: Border.all(color: (p==true)? Colors.white : Colors.black,width: 3)),
                              child: Text("PUZZLES",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: fonts,
                                      color: Colors.white)),
                            ),
                          )),
                      InkWell(onTapUp: (details) {
                        setState(() {
                          b=false;
                        });
                      },
                        onTapCancel: (){
                          setState(() {
                            b=true;
                          });
                        },
                        onTapDown: (details){
                          setState(() {
                            b=true;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(border: Border.all(color: (b==true)? Colors.white : Colors.black,width: 3)),
                          child: Text("BUY PRO",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: fonts,
                                  color: Colors.white)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 1,right: 170),
                      height: 62,
                      width: 68,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          colors: [Colors.black, Colors.white70, Colors.black],
                        ),
                        image: DecorationImage(
                            image: AssetImage("photos/ltlicon.png"),
                            fit: BoxFit.fill),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          colors: [Colors.black, Colors.white70, Colors.black],
                        ),
                        image: DecorationImage(
                            image: AssetImage("photos/shareus.png"),
                            fit: BoxFit.contain),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 25, top: 10),
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          colors: [Colors.black, Colors.white70, Colors.black],
                        ),
                        image: DecorationImage(
                            image: AssetImage("photos/emailus.png"),
                            fit: BoxFit.contain),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 5,right: 25),
                      child: Text(
                        "Privacy Policy",
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}

