import 'package:flutter/material.dart';
import 'package:mathpuzzle/second.dart';

class four extends StatefulWidget {
  List level_Status = [];
  int cur_level = 0;

  four(this.cur_level, this.level_Status);

  @override
  State<four> createState() => _fourState();
}

class _fourState extends State<four> {
  List level_Status = [];
  int cur_level = 0;


  @override
  void initState() {
    super.initState();
    level_Status=widget.level_Status;
    cur_level=widget.cur_level;
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
      child: Column(children: [
        Padding(
            padding: EdgeInsets.only(top: 2),
            child: Text(
              "Select Puzzle",
              style: TextStyle(
                  fontSize: 35,
                  color: Colors.blue,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold),
            )),
        Expanded(
          child: Container(
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: level_Status.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    if (level_Status[index] == "skip" ||
                        level_Status[index] == "yes") {
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (context) {
                        return two(index);
                      },));
                    }
                  },
                    child:
                    Container(
                      alignment: Alignment.center,
                      child: (index < cur_level) ? Text("${index + 1}",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,) : null,
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(width: 2,
                              color: Colors.black,
                              style: BorderStyle.solid),
                          image: (level_Status[index] == "yes")
                              ? DecorationImage(
                              image: AssetImage("photos/tick.png"))
                              :
                          (level_Status[index] == "no") ? DecorationImage(
                              image: AssetImage("photos/lock.png")) : null
                      ),
                    ));
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, mainAxisSpacing: 6, crossAxisSpacing: 2),
            ),
          ),
        ),

        // Column(
        //   children: [
        //     InkWell(onTap: () {},
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.end,
        //         children: [
        //           Container(
        //             margin: EdgeInsets.only(top: 20,right: 20),
        //             height: 70,
        //             width: 110,
        //             decoration: BoxDecoration(image: DecorationImage(image: AssetImage("photos/next.png"))),
        //           ),
        //         ],
        //       ),
        //     )
        //   ],
        // )
      ]),
    ));
  }
}
