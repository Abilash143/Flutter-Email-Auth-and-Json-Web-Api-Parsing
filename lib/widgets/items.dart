import 'package:flutter/material.dart';
import '../models/json_parsing.dart';
import 'package:provider/provider.dart';
import '../providers/base.dart';

class PItems extends StatefulWidget {
  final Data itemData;

  PItems(this.itemData);

  @override
  _ItemsState createState() => _ItemsState();
}

class _ItemsState extends State<PItems> {
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
        itemCount: widget.itemData.items.length,
        shrinkWrap: true,
        itemBuilder: (ctx, i) => Card(
          margin: EdgeInsets.all(10),
          child: ListTile(
            title: Text(widget.itemData.items[i].itemName),
            subtitle: Text('Rs. ${widget.itemData.items[i].itemSalary}'),
            onTap: (){
              Provider.of<Base>(context, listen: false).showAlertDialog(context);
            },
          ),
        ),
      ),
    );
  }
}
