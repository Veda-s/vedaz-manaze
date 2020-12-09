import 'package:flutter/material.dart';
import 'package:test01/views/views.dart';

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
              onPressed: () => {Navigator.of(context).pop()},
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
