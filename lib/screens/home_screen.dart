import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';
import '../providers/base.dart';
import '../widgets/items.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          actions: [
            FlatButton(
                onPressed: () {
                  Provider.of<Auth>(context, listen: false).logout();
                },
                child: Text('Logout', style: TextStyle(color: Colors.white)))
          ],
        ),
        body: FutureBuilder(
          future: Provider.of<Base>(context, listen: false).fetchAndSetData(),
          builder: (ctx, dataSnapshot) {
            if (dataSnapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              if (dataSnapshot.error != null) {
                // ...
                // Do error handling stuff
                return Center(
                  child: Text('An error occurred!'),
                );
              } else {
                return Consumer<Base>(
                    builder: (ctx, orderData, child) =>
                        PItems(orderData.datas[0]));
              }
            }
          },
        ));
  }
}
