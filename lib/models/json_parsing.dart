Data itemModelFromJson(Map<String, dynamic> data) => Data.fromJson(data);

class Data {
  Data({
    this.items,
  });

  List<Item> items;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        items: List<Item>.from(json['data'].map((x) => Item.fromJson(x))),
      );
}

class Item {
  Item({
    this.itemName,
    this.itemSalary,
  });

  String itemName;
  int itemSalary;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        itemName: json["employee_name"],
        itemSalary: json["employee_salary"],
      );
}
