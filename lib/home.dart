import 'dart:convert';


import 'package:flutter/material.dart';

import 'function.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String url = '';
  var data;
  String output = 'Initial Output';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Simple Flask App')),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextField(
              onChanged: (value) {
//                url = 'http://10.0.2.2:5000/api?query=' + value.toString();
                url='http://127.0.0.1:5000/api?query='+value.toString();
              },
            ),
            TextButton(
              onPressed: () async {
                try {
                  data = await fetchdata(url);
                  print('Response: $data'); // Log the response for debugging
                  var decoded = jsonDecode(data);
                  setState(() {
                    output = decoded['output'];
                  });
                } catch (e) {
                  if (e is Exception) {
                    // Check if the error is an exception
                    print('Error fetching data: $e'); // Log the exception for debugging
                  } else {
                    // Handle other types of errors
                    print('Unexpected error: $e');
                  }
                }
              },
              child: Text(
                'Fetch ASCII Value',
                style: TextStyle(fontSize: 20),
              ),
            ),

            Text(
              output,
              style: TextStyle(fontSize: 40, color: Colors.green),
            )
          ]),
        ),
      ),
    );
  }
}