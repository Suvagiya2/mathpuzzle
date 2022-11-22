import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mathpuzzle/model.dart';
import 'package:mathpuzzle/third.dart';
import 'package:shared_preferences/shared_preferences.dart';


class two extends StatefulWidget {
  int c_value;
  two(this.c_value);

  @override
  State<two> createState() => _twoState();
}

class _twoState extends State<two> {
  String ans="";
  int current_level=0;
  SharedPreferences ?pref;


  @override
  void initState() {
    current_level=widget.c_value;
    getdata();
  }

  getdata()
  async {
    pref=await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    double tot_size=MediaQuery.of(context).size.height;
    double Statusbar_size=MediaQuery.of(context).padding.top;
    double Screen_size=tot_size-Statusbar_size;
    return Scaffold(
      body: Container(margin: EdgeInsets.only(top: Statusbar_size),
        height:Screen_size,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("photos/gameplaybackground.jpg"),
                fit: BoxFit.fill)),
        child: Center(
          child: Column(
            children: [
              Container(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {

                            showDialog(context: context, builder: (context){
                              return AlertDialog(backgroundColor: Colors.white,
                              content: Text("Are you sure you want to skip this level?you can play skipped levels later by cliking on puzzzles menu from main menu"),
                                actions: [
                                  TextButton(onPressed: () {
                                  setState(() {
                                    pref!.setString("level_status$current_level", "skip");
                                    current_level++;
                                    pref!.setInt("levelno",current_level);
                                  });
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                                    return two(current_level);
                                  },));
                                  Navigator.pop(context);
                                }, child: Text("ok")),
                                TextButton(onPressed: () {
                                  Navigator.pop(context);
                                }, child: Text("cancel"))
                                ],
                              );
                            });
                        },
                        child: Container(
                            margin: EdgeInsets.only(top: 5),
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("photos/skip.png"),
                                    fit: BoxFit.fill)),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 5),
                          height: 50,
                          width: 230,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("photos/level_board.png"),
                                  fit: BoxFit.fill)),
                        child: Center(child: Text("Puzzle ${current_level+1}",style: TextStyle(fontSize: 25,color: Colors.black,),)),
        ),
                      Container(
                          margin: EdgeInsets.only(top: 5),
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("photos/hint.png"),
                                  fit: BoxFit.fill))),
                    ],
                  )),
              Column(
                children: [
                  Container(
                    height: 583,
                    width: double.infinity,
                    child: Container(
                      margin: EdgeInsets.only(
                          top: 40, bottom: 170, left: 25, right: 25),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("photos/${model.myimg[current_level]}"),
                              fit: BoxFit.fill)),
                    ),
                  ),
                ],
              ),
              Container(
                height: 130,
                color: Colors.black,
                child: Column(
                  children: [
                    Container(
                      height: 70,
                      color: Colors.black,
                      child: Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(right: 5),
                              height: 50,
                              width: 180,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Center(child: Text("$ans",style: TextStyle(fontSize: 22),))),
                          InkWell(onTap: () {
                            setState(() {
                              ans=ans.substring(0,ans.length-1);

                            });
                          },
                            child: Container(
                              margin: EdgeInsets.only(left: 10),
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  image: DecorationImage(
                                      image: AssetImage("photos/delete.png"))),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                if(model.ans[current_level]==int.parse(ans)) {

                                  pref!.setString("level_status$current_level", "yes");

                                  current_level++;
                                  pref!.setInt("levelno", current_level);
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                        return three(current_level);
                                      },));
                                }
                                else
                                  {
                                    FlutterClipboard.copy(ans).then((value) =>
                                        Fluttertoast.showToast(
                                          msg: "Wrong!!",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 3,
                                          backgroundColor: Colors.black,
                                          textColor: Colors.red,
                                          fontSize: 16,
                                        ),
                                    );
                                  }
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(left: 10),
                              height: 50,
                              width: 100,
                              color: Colors.white10,
                              child: Text("Submit",style: TextStyle(color:Colors.white),textAlign: TextAlign.center,),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: Row(
                      children: [
                        Expanded(
                            child: InkWell(
                          onTap: () {abc("1");},
                          child: Container(
                            height: 38,
                            alignment: Alignment.center,
                            margin: EdgeInsets.all(3),
                            color: Colors.white,
                            child: Text("1",textAlign: TextAlign.center,),
                          ),
                        )),
                        Expanded(
                            child: InkWell(
                          onTap: () {abc("2");},
                          child: Container(
                              height: 38,
                              alignment: Alignment.center,
                              margin: EdgeInsets.all(3),
                              color: Colors.white,
                            child: Text("2",textAlign: TextAlign.center,),
                          ),
                        )),
                        Expanded(
                            child: InkWell(
                          onTap: () {abc("3");},
                          child: Container(
                              height: 38,
                              alignment: Alignment.center,
                              margin: EdgeInsets.all(3),
                              color: Colors.white,
                            child: Text("3",textAlign: TextAlign.center,),
                          ),
                        )),
                        Expanded(
                            child: InkWell(
                          onTap: () {abc("4");},
                          child: Container(
                              height: 38,
                              alignment: Alignment.center,
                              margin: EdgeInsets.all(3),
                              color: Colors.white,
                            child: Text("4",textAlign: TextAlign.center,),
                          ),
                        )),
                        Expanded(
                            child: InkWell(
                          onTap: () {abc("5");},
                          child: Container(
                              height: 38,
                              alignment: Alignment.center,
                              margin: EdgeInsets.all(3),
                              color: Colors.white,
                            child: Text("5",textAlign: TextAlign.center,),
                          ),
                        )),
                        Expanded(
                            child: InkWell(
                          onTap: () {abc("6");},
                          child: Container(
                              height: 38,
                              alignment: Alignment.center,
                              margin: EdgeInsets.all(3),
                              color: Colors.white,
                            child: Text("6",textAlign: TextAlign.center,),
                          ),
                        )),
                        Expanded(
                            child: InkWell(
                          onTap: () {abc("7");},
                          child: Container(
                              height: 38,
                              alignment: Alignment.center,
                              margin: EdgeInsets.all(3),
                              color: Colors.white,
                            child: Text("7",textAlign: TextAlign.center,),
                          ),
                        )),
                        Expanded(
                            child: InkWell(
                          onTap: () {abc("8");},
                          child: Container(
                              height: 38,
                              alignment: Alignment.center,
                              margin: EdgeInsets.all(3),
                              color: Colors.white,
                            child: Text("8",textAlign: TextAlign.center,),
                          ),
                        )),
                        Expanded(
                            child: InkWell(
                          onTap: () {abc("9");},
                          child: Container(
                              height: 38,
                              alignment: Alignment.center,
                              margin: EdgeInsets.all(3),
                              color: Colors.white,
                            child: Text("9",textAlign: TextAlign.center,),
                          ),
                        )),
                        Expanded(
                            child: InkWell(
                          onTap: () {abc("0");},
                          child: Container(
                              height: 38,
                              alignment: Alignment.center,
                              margin: EdgeInsets.all(3),
                              color: Colors.white,
                            child: Text("0",textAlign: TextAlign.center,),
                          ),
                        )),
                      ],
                    ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void abc(String a)
  {
    setState(() {
      ans=ans+a;
    });
  }

}
