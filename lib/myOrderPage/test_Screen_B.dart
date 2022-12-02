import 'package:flutter/material.dart';

class TestScreenB extends StatelessWidget {
  TestScreenB({Key? key}) : super(key: key);


  List upcomingOrders = [
  upcomingOrderClass(name: "Facebook", price: 339.1),
  upcomingOrderClass(name: "A10 NETWORKS INC.", price: 10.34),
  upcomingOrderClass(name: "Intel Corp", price: 56.96),
  upcomingOrderClass(name: "HP Inc", price: 32.43),
  upcomingOrderClass(name: "Advanced Micro Devices Inc.", price: 77.44),
    upcomingOrderClass(name: "Amazon.com, Inc.", price: 3505.44),
    upcomingOrderClass(name: "Microsoft Corporation", price: 265.51),
    upcomingOrderClass(name: "Facebook", price: 339.1),
    upcomingOrderClass(name: "A10 NETWORKS INC.", price: 10.34),
    upcomingOrderClass(name: "Intel Corp", price: 56.96),
    upcomingOrderClass(name: "HP Inc", price: 32.43),
    upcomingOrderClass(name: "Advanced Micro Devices Inc.", price: 77.44),
    upcomingOrderClass(name: "Apple Inc", price: 133.98),
    upcomingOrderClass(name: "Amazon.com, Inc.", price: 3505.44),
    upcomingOrderClass(name: "Microsoft Corporation", price: 265.51)
];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 572,
        child: ListView.builder(
          itemCount: upcomingOrders.length,
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: ListTile(
                  title: Text(
                   upcomingOrders[index].name,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  leading: CircleAvatar(
                    child: Text(
                      upcomingOrders[index].name[0],
                      style:
                      const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  trailing: Text("\$ ${upcomingOrders[index].price}"),
                ),
              ),
            );
          },
        ),
      );
  }
}
class upcomingOrderClass {
  String name;
  double price;

  upcomingOrderClass({required this.name,required this.price});
}