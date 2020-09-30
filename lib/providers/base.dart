import 'package:flutter/material.dart';
import '../models/json_parsing.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Base with ChangeNotifier {
  List<Data> _data = [];

  //Data(this._data);
  List<Data> get datas {
    return [..._data];
  }

  Future<void> fetchAndSetData() async {
    final url = 'http://dummy.restapiexample.com/api/v1/employees';
    final response = await http.get(url);
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    //print(extractedData);
    final List<Data> loadedItems = [];
    if (extractedData == null) {
      return;
    }

    //print(extractedData);

    final items = itemModelFromJson(extractedData);

    loadedItems.add(items);

    _data = loadedItems.toList();
    notifyListeners();
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Hey Buddy"),
      content: Text("This is an Alert Dialog!"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
