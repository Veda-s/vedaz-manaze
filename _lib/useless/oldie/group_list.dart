import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:test01/oldie/group_header.dart';

class GroupList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Baby Names',
        //home: MyHomePage(),
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepOrange,
            elevation: 0,
            title: Icon(
              Icons.linear_scale,
              size: 50,
              //color: Colors.deepOrange,
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
                    color: Colors.deepOrange,
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: new FloatingActionButton.extended(
            backgroundColor: Colors.deepOrange,
            icon: Icon(Icons.add),
            label: Text('Add New'),
            onPressed: () => {},
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          body: Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.deepOrange,
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(55)),
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 16, top: 40, right: 16, bottom: 0),
                        child: ListView.builder(
                          itemCount: dummyGroupList.length,
                          itemBuilder: (context, index) {
                            return Card(
                              elevation: 5.0,
                              shadowColor: Colors.white,
                              color: Colors.white,
                              child: ListTile(
                                leading: Container(
                                  padding: EdgeInsets.only(right: 12.0),
                                  decoration: new BoxDecoration(
                                      border: new Border(
                                          right: new BorderSide(
                                              width: 1.0,
                                              color: Colors.black87))),
                                  child: Icon(Icons.account_box,
                                      color: Colors.black),
                                ),
                                title: Text(
                                  dummyGroupList[index],
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                ),
                                trailing: Icon(
                                  Icons.ac_unit,
                                  color: Colors.deepOrange,
                                ),
                                onTap: () => {},
                                visualDensity: VisualDensity.compact,
                                subtitle: Row(
                                  children: <Widget>[
                                    Icon(Icons.linear_scale,
                                        color: Colors.deepOrangeAccent),
                                    Text(" Intermediate",
                                        style: TextStyle(fontSize: 12))
                                  ],
                                ),
                                selected: false,
                                enabled: false,
                                dense: true,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 10.0),
                                //contentPadding: EdgeInsets.only(top:0,bottom:0),
                                //shape: ShapeBorder.lerp(a, b, t),
                                //shape: ,
                                //contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
                              ),
                            );
                          },
                        ),
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

final List<String> dummyGroupList = ['group01', 'group02', 'group03'];
