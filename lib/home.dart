import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Apple Sign In App.",
        ),
      ),
      body: FooterView(
          footer: Footer(
            child: Container(
              padding: EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Text(
                    "CodingWithSobhy",
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Icon(
                    Icons.favorite,
                    color: Colors.red,
                  )
                ],
              ),
            ),
          ),
          children: <Widget>[
            Container(
              padding: new EdgeInsets.symmetric(vertical: 100.0),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Container(
                    padding: new EdgeInsets.all(20.0),
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Text(
                          "Successfully SignIn With Apple!",
                          style: TextStyle(fontSize: 18.0),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Icon(
                          Icons.verified,
                          color: Colors.blue,
                        )
                      ],
                    ),
                  ),
                  Text(
                    "Welcome Mohamed Sobhy!",
                    style: TextStyle(fontSize: 18.0),
                  ),
                ],
              ),
            ),
          ]),
    );
  }
}
