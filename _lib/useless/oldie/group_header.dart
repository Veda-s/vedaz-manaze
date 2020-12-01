import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class GroupHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 240.0,
      color: Colors.deepOrange,
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Card(
                  color: Colors.white,
                  elevation: 1.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircularPercentIndicator(
                      radius: 100.0,
                      lineWidth: 13.0,
                      animation: true,
                      percent: 0.8,
                      backgroundColor: Colors.white70,
                      arcType: ArcType.FULL,
                      arcBackgroundColor: Colors.black,
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: Colors.deepOrange,
                      center: Text("",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrange)),
                      //footer: Text("Present",style:TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: Column(
                children: [
                  Expanded(
                    child: Container(
                        height: 150.0,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 50.0,
                                        child: Card(
                                            color: Colors.white,
                                            elevation: 10.0,
                                            child: Center(
                                                child: Text('lorem.',
                                                    style: TextStyle(
                                                        color: Colors.white)))),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: 50.0,
                                        child: Card(
                                            color: Colors.white,
                                            elevation: 10.0,
                                            child: Center(
                                                child: Text('lorem.',
                                                    style: TextStyle(
                                                        color: Colors.white)))),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Container(
                                  height: 145.0,
                                  width: 40.0,
                                  child: Card(
                                    color: Colors.white,
                                    elevation: 10.0,
                                    child: Column(
                                      children: [
                                        Expanded(
                                            child: Text(
                                          dummyStudentList.length.toString(),
                                          style: TextStyle(
                                              fontSize: 36,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.deepOrange),
                                        )),
                                        Icon(
                                          Icons.line_style_outlined,
                                          size: 50,
                                          color: Colors.deepOrange,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 50.0,
                            child: Card(
                                color: Colors.deepOrangeAccent,
                                elevation: 10.0,
                                child: Center(
                                    child: Text('lorem.',
                                        style:
                                            TextStyle(color: Colors.white)))),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 50.0,
                            child: Card(
                                color: Colors.deepOrangeAccent,
                                elevation: 10.0,
                                child: Center(
                                    child: Text('lorem.',
                                        style:
                                            TextStyle(color: Colors.white)))),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}

final dummyGroupDoc = {
  'name': 'NM1102D',
  'createdOn': 'date',
  'lastUpdatedOn': 'date_',
  'students': [
    'Kushagr Juneja',
    'Prateek Rathi',
    'Naveen Singh',
    'Kushagr Juneja',
    'Prateek Rathi',
    'Naveen Singh',
    'Kushagr Juneja',
    'Prateek Rathi',
    'Naveen Singh',
    'Narak Swami',
    'Thekedar Ka'
  ],
};

final List<String> dummyStudentList = dummyGroupDoc['students'];
