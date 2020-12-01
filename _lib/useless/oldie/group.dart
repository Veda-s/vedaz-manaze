import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Baby Names',
        //home: MyHomePage(),
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.amberAccent,
            elevation: 0,
            title: Icon(
              Icons.linear_scale,
              size: 50,
            ),
            centerTitle: true,
          ),
          bottomNavigationBar: new BottomAppBar(
            color: Colors.white,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  onPressed: () => {},
                  icon: Icon(
                    Icons.menu,
                    color: Colors.amberAccent,
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: new FloatingActionButton.extended(
            backgroundColor: Colors.amberAccent,
            icon: Icon(Icons.add),
            label: Text('Add New'),
            onPressed: () => {},
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                height: 250.0,
                color: Colors.amberAccent,
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: CircularPercentIndicator(
                            radius: 100.0,
                            lineWidth: 13.0,
                            animation: true,
                            percent: 0.8,
                            backgroundColor: Colors.black,
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: Colors.amberAccent,
                            center: Text("80%"),
                            footer: Text("Present"),
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
                                          child: Center(
                                        child: RichText(
                                          text: TextSpan(
                                            text: 'Non-Medical',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      )),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(6.0),
                                          child: Container(
                                            height: 145.0,
                                            width: 40.0,
                                            child: Card(
                                              color: Colors.amberAccent,
                                              elevation: 10.0,
                                              child: Column(
                                                children: [
                                                  //Expanded(child: Icon(Icons.people_outline,color: Colors.white,size: 50,)),
                                                  Expanded(
                                                      child: Text(
                                                    dummyStudentList.length
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontSize: 36,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white),
                                                  ))
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
                                      height: 60.0,
                                      child: Card(
                                        color: Colors.amberAccent,
                                        elevation: 10.0,
                                        child: Icon(
                                          Icons.airplay,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 60.0,
                                      child: Card(
                                        color: Colors.amberAccent,
                                        elevation: 10.0,
                                        child: Icon(
                                          Icons.android,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 60.0,
                                      child: Card(
                                        color: Colors.amberAccent,
                                        elevation: 10.0,
                                        child: Icon(
                                          Icons.home,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 60.0,
                                      child: Card(
                                        color: Colors.amberAccent,
                                        elevation: 10.0,
                                        child: Icon(
                                          Icons.search,
                                          color: Colors.white,
                                        ),
                                      ),
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
              ),
              Container(
                  color: Colors.amberAccent,
                  width: double.infinity,
                  child: Icon(
                    Icons.linear_scale_outlined,
                    size: 40,
                    color: Colors.white,
                  )),
              Expanded(
                child: ClipRRect(
                  //borderRadius: BorderRadius.only(topLeft:Radius.circular(99),bottomRight: Radius.circular(99)),
                  child: Container(
                    color: Colors.amberAccent,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 16, top: 20, right: 16, bottom: 0),
                      child: ListView.builder(
                        itemCount: dummyStudentList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 30.0,
                            shadowColor: Colors.white,
                            color: Colors.white,
                            child: ListTile(
                              leading: Icon(
                                Icons.account_box,
                                color: Colors.black,
                              ),
                              title: Text(
                                "| " + dummyStudentList[index],
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                              trailing: Icon(
                                Icons.ac_unit,
                                color: Colors.amberAccent,
                              ),
                              onTap: () => {},
                              visualDensity: VisualDensity.compact,
                              subtitle: Text('midName'),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
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
