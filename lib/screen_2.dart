import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {
  final String name;
  final int age;

  Screen2({this.name, this.age});

  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  bool isAdult = true;

  @override
  Widget build(BuildContext context) {
    final routeData =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final newName = routeData['name'];
    final newAge = routeData['age'];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'What Goes On That Property??',
          style: TextStyle(color: Colors.white, fontSize: 18.0),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(40.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.deepOrange, width: 5),
              ),
              child: Column(
                children: [
                  Text(
                    newName ?? 'Your Name',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  Divider(),
                  Text(
                    newAge.toString(),
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.indigo,
              ),
              child: Text('Go Back'),
              onPressed: () {
                final int newAgeInt = newAge;
                newAgeInt >= 18 ? isAdult = true : isAdult = false;
                Navigator.pop(context, isAdult);
              },
            ),
          ],
        ),
      ),
    );
  }
}
