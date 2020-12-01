import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test01/views/home.dart';
import '../models.dart';
import 'package:test01/services/services.dart';

class StudentBody extends StatelessWidget {
  final String docId;
  StudentBody({this.docId});
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
                            title: Text(
                                student.contact['primaryContact'] ?? 'N/A'),
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
                            title: Text(
                                student.contact['secondaryContact'] ?? 'N/A'),
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
  SCWVState createState() => SCWVState();
}

class SCWVState extends State<AddStudentView> {
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
                onPressed: () => {Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
                )},
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
                    theData['roll_no']))
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
              ListTile(leading:Icon(Icons.info,color:Colors.deepOrange),title: Text('student info',style:TextStyle(fontWeight: FontWeight.bold,)),),
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
              ListTile(leading:Icon(Icons.info,color:Colors.deepOrange),title: Text('info',style:TextStyle(fontWeight: FontWeight.bold,)),),
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
              ListTile(leading:Icon(Icons.info,color:Colors.deepOrange),title: Text('Gaurdian info',style:TextStyle(fontWeight: FontWeight.bold,)),),
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
              ListTile(leading:Icon(Icons.info,color:Colors.deepOrange),title: Text('Contact info',style:TextStyle(fontWeight: FontWeight.bold,)),),
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

class SuccesfulMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: FloatingActionButton(
          onPressed: () => {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            )
          },
          child: Icon(Icons.home),
          backgroundColor: Colors.green,
          elevation: 50,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 50.0,
              child: Column(
                children: [
                  Expanded(
                    child: Icon(Icons.done_all_outlined,
                        size: 170.0, color: Colors.green),
                  ),
                  Expanded(
                    child: Center(
                      child: Text('Succesful !',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class UnSuccesfulMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              heroTag: 'retry',
              onPressed: () => { Navigator.of(context).pop()},
              child: Icon(Icons.replay),
              backgroundColor: Colors.amberAccent,
              elevation: 50,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              heroTag: 'home',
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                )
              },
              child: Icon(Icons.home),
              backgroundColor: Colors.red,
              elevation: 50,
              mini: true,
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 50.0,
              child: Column(
                children: [
                  Expanded(
                    child: Center(
                      child: Icon(Icons.cancel_presentation_rounded,
                          size: 150.0, color: Colors.redAccent),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text('Failed !',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class EmptyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              heroTag: 'retry',
              onPressed: () => {Navigator.pop(context)},
              child: Icon(Icons.replay),
              backgroundColor: Colors.amberAccent,
              elevation: 50,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              heroTag: 'home',
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                )
              },
              child: Icon(Icons.home),
              backgroundColor: Colors.red,
              elevation: 50,
              mini: true,
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 50.0,
              child: Column(
                children: [
                  Expanded(
                    child: Center(
                      child: Icon(Icons.cancel_presentation_rounded,
                          size: 150.0, color: Colors.redAccent),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text('Oops! 404',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/* Column(
                  children: [
                    Container(
                      child: Card(
                        child: Column(
                          children: [
                            Text(student.group ?? ''),
                            Text(student.program ?? ''),
                            Text(student.rollNo ?? ''),
                            Text(student.regNo ?? '')
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Card(
                        child: Column(
                          children: <Widget>[
                            Text(student.name['first'] ?? ''),
                            Text(student.name['middle'] ?? ''),
                            Text(student.name['last'] ?? ''),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Card(
                        child: Column(
                          children: [
                            Text(student.contact['primaryContact'] ?? ''),
                            Text(student.contact['secondaryContact'] ?? 'N/A'),
                            Text(student.contact['email'] ?? ''),
                            Text(student.contact['address'] ?? '')
                          ],
                        ),
                      ),
                    )
                  ],
                ) */
