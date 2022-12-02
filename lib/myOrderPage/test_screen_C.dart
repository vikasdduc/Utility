import 'package:flutter/material.dart';

class TestScreenC extends StatelessWidget {
  TestScreenC({Key? key}) : super(key: key);

  List completeOrdersList = [
    completeOrderClass(name: "Facebook", price: 339.1),
    completeOrderClass(name: "A10 NETWORKS INC.", price: 10.34),
    completeOrderClass(name: "Intel Corp", price: 56.96),
    completeOrderClass(name: "HP Inc", price: 32.43),
    completeOrderClass(name: "Advanced Micro Devices Inc.", price: 77.44),
    completeOrderClass(name: "Amazon.com, Inc.", price: 3505.44),
    completeOrderClass(name: "Microsoft Corporation", price: 265.51),
    completeOrderClass(name: "Facebook", price: 339.1),
    completeOrderClass(name: "A10 NETWORKS INC.", price: 10.34),
    completeOrderClass(name: "Intel Corp", price: 56.96),
    completeOrderClass(name: "HP Inc", price: 32.43),
    completeOrderClass(name: "Advanced Micro Devices Inc.", price: 77.44),
    completeOrderClass(name: "Apple Inc", price: 133.98),
    completeOrderClass(name: "Amazon.com, Inc.", price: 3505.44),
    completeOrderClass(name: "Microsoft Corporation", price: 265.51)
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 572,
      child: ListView.builder(
        itemCount: completeOrdersList.length,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: ListTile(
                title: Text(
                  completeOrdersList[index].name,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                leading: CircleAvatar(
                  child: Text(
                    completeOrdersList[index].name[0],
                    style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                trailing: Text("\$ ${completeOrdersList[index].price}"),
              ),
            ),
          );
        },
      ),
    );
  }
}
class completeOrderClass {
  String name;
  double price;

  completeOrderClass({required this.name,required this.price});
}