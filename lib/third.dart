import 'package:flutter/material.dart';
import 'package:mathpuzzle/one.dart';
import 'package:mathpuzzle/second.dart';

class three extends StatefulWidget {
  int current_level;
  three(this.current_level);




  @override
  State<three> createState() => _threeState();
}

class _threeState extends State<three> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image:
              DecorationImage(image: AssetImage("photos/background.jpg"),
                  fit: BoxFit.fill),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 70, bottom: 20),
                  child: Center(
                      child: Text(
                        "Puzzle ${widget.current_level} Completed",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo,
                          fontStyle: FontStyle.italic, fontSize: 30,),
                      )),
                ),
                Container(
                  height: 250,
                  width: 250,
                  margin: EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("photos/trophy.png"),
                          fit: BoxFit.fill)),
                ),
                Center(
                  child: Container(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(

                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [Colors.black, Colors.white70, Colors.black],
                      ),
                    ),
                    child: Center(
                      child: InkWell(onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                          return two(widget.current_level);
                        },));
                      },
                        child: Text(
                        "CONTINUE",
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),)
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    height: 50,
                    width: 200,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [Colors.black, Colors.white70, Colors.black],
                      ),
                    ),
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                            return first();
                          },));
                        },
                        child: Text(
                          "MAIN MENU",
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [Colors.black, Colors.white70, Colors.black],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "BUY PRO",
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(top: 30, bottom: 30),
                  child: Center(
                      child: Text(
                        "SHARE THIS PUZZLE",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo,
                            fontStyle: FontStyle.italic, fontSize: 20),
                      )),
                ),
                Center(
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [Colors.black, Colors.white70, Colors.black],
                      ),
                      image: DecorationImage(
                          image: AssetImage("photos/shareus.png"),
                          fit: BoxFit.contain),
                    ),),
                ),

              ],
            ),
          )),
    );
  }
}

