import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test01/views/views.dart';
import '../models.dart';
import 'package:test01/services/services.dart';
import 'package:test01/views/dashboard.dart';

class StudentBody extends StatelessWidget {
  final String docId;
  final group;
  StudentBody({this.docId, this.group});
  @override
  Widget build(BuildContext context) {
    StudentService studentService = StudentService();
    return FutureBuilder<DocumentSnapshot>(
        future: studentService.getDocument(docId),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data != null) {
              Student student = Student.fromMap(snapshot.data.data);

              return Scaffold(
                drawer: Drawer(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: <Widget>[
                      DrawerHeader(
                        child: Container(
                          child: Icon(Icons.subject,
                              size: 50, color: Colors.white),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.deepOrange,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        color: Colors.deepOrange,
                        child: ListTile(
                          leading: Icon(
                            Icons.show_chart,
                            size: 40,
                            color: Colors.white,
                          ),
                          title: Text(
                            'DashBoard',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text('Physics'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DashBoard(
                                      group, 'PHY', int.parse(docId))));
                        },
                      ),
                      ListTile(
                        title: Text('Mathematics'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DashBoard(
                                      group, 'MAT', int.parse(docId))));
                        },
                      ),
                      ListTile(
                        title: Text('Chemistry'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DashBoard(
                                      group, 'PHY', int.parse(docId))));
                        },
                      ),
                    ],
                  ),
                ),
/*               appBar: AppBar(
                backgroundColor: Colors.deepOrange,
                centerTitle: true,
                //leading: Icon(Icons.group_add),
                title: Text(student.rollNo),
                // elevation: 50.0,
              ), */

                body: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      title: Icon(
                        Icons.local_play,
                        size: 50,
                      ),

                      backgroundColor: Colors.white,
                      floating: true,
                      pinned: true, //flexibleSpace: Placeholder(),
                      expandedHeight: 300,
                      flexibleSpace: Stack(
                        children: <Widget>[
                          Positioned.fill(
                            child: Image.network(
                              "https://images.unsplash.com/photo-1457369804613-52c61a468e7d?ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SliverList(
                        delegate: SliverChildListDelegate([
                      ListTile(
                        leading: Icon(
                          Icons.info,
                          color: Colors.deepOrange,
                        ),
                        title: Text('Ward Info'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 10,
                          child: ListTile(
                            title: Text(student.name['first'] ?? 'N/A'),
                            subtitle: Text('First Name'),
                            //title: Text('# $index'),
                            trailing: Icon(Icons.ac_unit),
                            onTap: () => {
                              /* print(snapshot.data.data['students'][index]['roll_no']) */
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 10,
                          child: ListTile(
                            title: Text(student.name['middle'] ?? 'N/A'),
                            subtitle: Text('Middle Name'),
                            //title: Text('# $index'),
                            trailing: Icon(Icons.ac_unit),
                            onTap: () => {
                              /* print(snapshot.data.data['students'][index]['roll_no']) */
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 10,
                          child: ListTile(
                            title: Text(student.name['last'] ?? 'N/A'),
                            subtitle: Text('Last Name'),
                            //title: Text('# $index'),
                            trailing: Icon(Icons.ac_unit),
                            onTap: () => {
                              /* print(snapshot.data.data['students'][index]['roll_no']) */
                            },
                          ),
                        ),
                      ),
                    ])),
                    SliverList(
                        delegate: SliverChildListDelegate([
                      ListTile(
                        leading: Icon(
                          Icons.contacts,
                          color: Colors.deepOrange,
                        ),
                        title: Text('Info'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 10,
                          child: ListTile(
                            title: Text(student.program ?? 'N/A'),
                            subtitle: Text('Student Program'),
                            //title: Text('# $index'),
                            trailing: Icon(Icons.ac_unit),
                            onTap: () => {
                              /* print(snapshot.data.data['students'][index]['roll_no']) */
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 10,
                          child: ListTile(
                            title: Text(student.group ?? 'N/A'),
                            subtitle: Text('Group'),
                            //title: Text('# $index'),
                            trailing: Icon(Icons.ac_unit),
                            onTap: () => {
                              /* print(snapshot.data.data['students'][index]['roll_no']) */
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 10,
                          child: ListTile(
                            title: Text(student.regNo ?? 'N/A'),
                            subtitle: Text('Reg No.'),
                            //title: Text('# $index'),
                            trailing: Icon(Icons.ac_unit),
                            onTap: () => {
                              /* print(snapshot.data.data['students'][index]['roll_no']) */
                            },
                          ),
                        ),
                      ),
                    ])),
                    SliverList(
                        delegate: SliverChildListDelegate([
                      ListTile(
                        leading: Icon(
                          Icons.contacts,
                          color: Colors.deepOrange,
                        ),
                        title: Text('Gaurdians'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 10,
                          child: ListTile(
                            title: Text(
                                student.guardianName['fatherName'] ?? 'N/A'),
                            subtitle: Text('Father\'s Name'),
                            //title: Text('# $index'),
                            trailing: Icon(Icons.ac_unit),
                            onTap: () => {
                              /* print(snapshot.data.data['students'][index]['roll_no']) */
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 10,
                          child: ListTile(
                            title: Text(
                                student.guardianName['motherName'] ?? 'N/A'),
                            subtitle: Text('Mother\'s Name'),
                            //title: Text('# $index'),
                            trailing: Icon(Icons.ac_unit),
                            onTap: () => {
                              /* print(snapshot.data.data['students'][index]['roll_no']) */
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 10,
                          child: ListTile(
                            title: Text(
                                student.guardianName['otherName'] ?? 'N/A'),
                            subtitle: Text('Other Gaurdian'),
                            //title: Text('# $index'),
                            trailing: Icon(Icons.ac_unit),
                            onTap: () => {
                              /* print(snapshot.data.data['students'][index]['roll_no']) */
                            },
                          ),
                        ),
                      ),
                    ])),
                    SliverList(
                        delegate: SliverChildListDelegate([
                      ListTile(
                        leading: Icon(
                          Icons.contacts,
                          color: Colors.deepOrange,
                        ),
                        title: Text('Contact'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 10,
                          child: ListTile(
                            title: Text(student.contact['primary'] ?? 'N/A'),
                            subtitle: Text('Primary Contact'),
                            //title: Text('# $index'),
                            trailing: Icon(Icons.ac_unit),
                            onTap: () => {
                              /* print(snapshot.data.data['students'][index]['roll_no']) */
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 10,
                          child: ListTile(
                            title: Text(student.contact['secondary'] ?? 'N/A'),
                            subtitle: Text('Secondary Contact'),
                            //title: Text('# $index'),
                            trailing: Icon(Icons.ac_unit),
                            onTap: () => {
                              /* print(snapshot.data.data['students'][index]['roll_no']) */
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 10,
                          child: ListTile(
                            title: Text(student.contact['email'] ?? 'N/A'),
                            subtitle: Text('Email'),
                            //title: Text('# $index'),
                            trailing: Icon(Icons.ac_unit),
                            onTap: () => {
                              /* print(snapshot.data.data['students'][index]['roll_no']) */
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 10,
                          child: ListTile(
                            title: Text(student.contact['address'] ?? 'N/A'),
                            subtitle: Text('Home Address'),
                            //title: Text('# $index'),
                            trailing: Icon(Icons.ac_unit),
                            onTap: () => {
                              /* print(snapshot.data.data['students'][index]['roll_no']) */
                            },
                          ),
                        ),
                      ),
                    ])),
                  ],
                ),
              );
            } else {
              return EmptyPage();
            }
          }

          return Center(
              child: CircularProgressIndicator(
            strokeWidth: 16.0,
            backgroundColor: Colors.amber,
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),
          ));
        });
  }
}

class AddStudentView extends StatefulWidget {
  final group;
  AddStudentView({this.group});
  @override
  _AddStudentViewState createState() => _AddStudentViewState();
}

class _AddStudentViewState extends State<AddStudentView> {
  StudentService studentService = StudentService();

  final firstName = TextEditingController();
  final middleName = TextEditingController();
  final lastName = TextEditingController();

  final program = TextEditingController();
  final group = TextEditingController();
  final rollNo = TextEditingController();
  final regNo = TextEditingController();

  final fatherName = TextEditingController();
  final motherName = TextEditingController();
  final guardianName = TextEditingController();

  final primaryContact = TextEditingController();
  final secondaryContact = TextEditingController();

  final email = TextEditingController();

  final address = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
/*         appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          centerTitle: true,
          title: Icon(
            Icons.linear_scale,
            size: 50,
          ),
          elevation: 50.0,
        ), */

        bottomNavigationBar: new BottomAppBar(
          color: Colors.white,
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  )
                },
                icon: Icon(
                  Icons.home,
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
          onPressed: () {
            Map<String, dynamic> theData = {
              'name': {
                'first': firstName.text ?? 'N/A',
                'middle': middleName.text ?? 'N/A',
                'last': lastName.text ?? 'N/A'
              },
              'guardian_name': {
                'father_name': fatherName.text ?? 'N/A',
                'mother_name': motherName.text ?? 'N/A',
                'guardian_name': guardianName.text ?? 'N/A'
              },
              'contact': {
                'primary': primaryContact.text ?? 'N/A',
                'secondary': secondaryContact.text ?? 'N/A',
                'email': email.text ?? 'N/A',
                'address': address.text ?? 'N/A'
              },
              'program': program.text ?? 'N/A',
              'group': widget.group,
              'roll_no': rollNo.text ?? 'N/A',
              'reg_no': regNo.text ?? 'N/A',
            };

            studentService
                .addStudent(theData['roll_no'], theData)
                .then((value) => studentService.addStudentToGroup(
                    widget.group,
                    theData['name']['first'],
                    theData['roll_no'],
                    theData['contact']['primary']))
                .then((value) => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    ))
                .catchError((error) => print("Failed to add user: $error"));
/*             Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            ); */
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              ListTile(
                leading: Icon(Icons.info, color: Colors.deepOrange),
                title: Text('student info',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: firstName,
                  decoration: InputDecoration(
                    icon: Icon(Icons.featured_play_list,
                        color: Colors.deepOrange),
                    labelText: 'First Name',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: middleName,
                  decoration: InputDecoration(
                    icon: Icon(Icons.featured_play_list,
                        color: Colors.deepOrange),
                    labelText: 'Middle Name',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: lastName,
                  decoration: InputDecoration(
                      icon: Icon(Icons.featured_play_list,
                          color: Colors.deepOrange),
                      labelText: 'last name'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                leading: Icon(Icons.info, color: Colors.deepOrange),
                title: Text('info',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: program,
                  decoration: InputDecoration(
                      icon: Icon(Icons.featured_play_list,
                          color: Colors.deepOrange),
                      labelText: 'Program'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: rollNo,
                  decoration: InputDecoration(
                      icon: Icon(Icons.featured_play_list,
                          color: Colors.deepOrange),
                      labelText: 'Roll Number'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: regNo,
                  decoration: InputDecoration(
                      icon: Icon(Icons.featured_play_list,
                          color: Colors.deepOrange),
                      labelText: 'Reg Number'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                leading: Icon(Icons.info, color: Colors.deepOrange),
                title: Text('Gaurdian info',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: fatherName,
                  decoration: InputDecoration(
                      icon: Icon(Icons.featured_play_list,
                          color: Colors.deepOrange),
                      labelText: 'Father Name'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: motherName,
                  decoration: InputDecoration(
                      icon: Icon(Icons.featured_play_list,
                          color: Colors.deepOrange),
                      labelText: 'Mother Name'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: guardianName,
                  decoration: InputDecoration(
                      icon: Icon(Icons.featured_play_list,
                          color: Colors.deepOrange),
                      labelText: 'Guardian Name'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                leading: Icon(Icons.info, color: Colors.deepOrange),
                title: Text('Contact info',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: primaryContact,
                  decoration: InputDecoration(
                      icon: Icon(Icons.featured_play_list,
                          color: Colors.deepOrange),
                      labelText: 'Primary Contact'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: secondaryContact,
                  decoration: InputDecoration(
                      icon: Icon(Icons.featured_play_list,
                          color: Colors.deepOrange),
                      labelText: 'Secondary Contact'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: email,
                  decoration: InputDecoration(
                      icon: Icon(Icons.featured_play_list,
                          color: Colors.deepOrange),
                      labelText: 'Email'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: address,
                  decoration: InputDecoration(
                      icon: Icon(Icons.featured_play_list,
                          color: Colors.deepOrange),
                      labelText: 'Address'),
                ),
              ),
            ],
          ),
        ));
/*     return ListView(
      children: [
        TextField(
          controller: firstName,
        ),
        FlatButton(
            onPressed: () {
              return showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text(firstName.text),
                    );
                  });
            },
            child: Text('fuck'))
      ],
    ); */
  }
}
