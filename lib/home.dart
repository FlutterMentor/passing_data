import 'package:flutter/material.dart';

import 'screen_2.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Map<String, int> dataMap = {
    'Number 1': 1,
    'Number 2': 2,
    'Number 3': 3,
  };

  String name;
  int age;
  bool isAdult = false;

  // void updateBoolData(bool newData) {
  //   setState(() {
  //     isAdult = newData;
  //   });
  // }
  //
  // void moveToNextPage() async {
  //   final newBoolData = await Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => Screen2(
  //         name: name,
  //         age: age,
  //       ),
  //     ),
  //   );
  //   updateBoolData(newBoolData);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Passing Data Across Pages',
          style: TextStyle(color: Colors.white, fontSize: 18.0),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Name'),
                onChanged: (val) => name = val,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
                onChanged: (val) => age = int.tryParse(val),
              ),
              SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepOrange,
                ),
                child: Text('Submit To Next Screen'),
                onPressed: () async {
                  final boolData = await Navigator.pushNamed(
                      context, '/screen2',
                      arguments: {'name': name, 'age': age});

                  setState(() {
                    isAdult = boolData;
                  });
                },
              ),
              Text(isAdult ? 'You are an adult!' : 'You are underaged'),
            ],
          ),
        ),
      ),
    );
  }
}
