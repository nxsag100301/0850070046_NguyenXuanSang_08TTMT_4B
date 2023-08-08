import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My app', // used by the OS task switcher
      home: MyHomeScreen(),
    ),
  );
}

class MyHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('My Test Home Page'),
      ),
      body: SafeArea(
        child: Container(
            alignment: Alignment.center,
            width: 390,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Home Screen',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
                ),
                SizedBox(
                  height: 20,
                ),
                buildRowLayout(),
                SizedBox(
                  height: 20,
                ),
                Image.network(
                  'https://dart.dev/assets/shared/dart-logo-for-shares.png?2',
                  width: 120,
                ),
                Image.network(
                  'data:image/png;base64,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',
                  width: 200,
                ),
                Image.network(
                  'data:image/png;base64,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',
                  width: 120,
                ),

                ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Nut da duoc bam!')));
                    },
                    child: Text('Click here!')),
              ],
            )),
      ),
    );
  }
}

Widget buildRowLayout() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        color: Colors.blue,
        height: 100,
        width: 100,
      ),
      Container(
        color: Colors.green,
        height: 100,
        width: 100,
      ),
      Container(
        color: Colors.orange,
        height: 100,
        width: 100,
      )
    ],
  );
}