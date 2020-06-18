import 'package:flutter/material.dart';
import 'package:letstalkmoney/widgets/webvieweg.dart';
import 'package:letstalkmoney/services/auth_service.dart';
import 'package:shimmer/shimmer.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              AuthService().signOut();
            },
          )
        ],
        title: Shimmer.fromColors(
          baseColor: Colors.white,
          highlightColor: Colors.yellow,
                  child: Text(
            "Let's Talk Money",
            style: TextStyle(
                color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Center(child: WebViewExample()),
    );
  }
}
