import 'package:flutter/material.dart';

class TestScreenA extends StatelessWidget {
     TestScreenA({Key? key}) : super(key: key);
     List pendingOrders = [
       PendingOrdersClass(tyreConfig : " MRF TYRE ZLX", name: "Facebook", price: 339.1, quantity: 2, date: "01/03/2022"),
       PendingOrdersClass(tyreConfig : " Appollo Amazer TYRE ZLX", name: "Whatsapp", price: 339.1, quantity: 2,date: "01/01/2022"),

     ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 573,
      //height: MediaQuery.of(context).size.height,
     // myHeight :  = height * 0.65,
      child: ListView.builder(
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${pendingOrders[index].tyreConfig}", style:
                        const TextStyle(fontSize: 17,color: Colors.black, fontWeight: FontWeight.bold),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("${pendingOrders[index].price}"),
                            Text(" Qnt: ${pendingOrders[index].quantity}"),
                            Text("${pendingOrders[index].price}")
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("${pendingOrders[index].price}"),
                            SizedBox(width: 10,),
                            Text("${pendingOrders[index].date}"),
                            SizedBox(width: 10,),
                            Text("${pendingOrders[index].price}")
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white, //background color of button
                              side: const BorderSide(width: 2,), //border width and color
                              elevation: 3, //elevation of button
                              shape: RoundedRectangleBorder( //to set border radius to button
                                  borderRadius: BorderRadius.circular(5)
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10), //content padding inside button
                            ),

                            onPressed: (){},
                            child: const Text('Accept', style: TextStyle(color: Colors.black, fontSize: 15),)
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white, //background color of button
                              side: const BorderSide(width: 2,), //border width and color
                              elevation: 3, //elevation of button
                              shape: RoundedRectangleBorder(
                                //to set border radius to button
                                  borderRadius: BorderRadius.circular(5)
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10), //content padding inside button
                            ),

                            onPressed: (){},
                            child: const Text('Accept', style: TextStyle(color: Colors.red, fontSize: 15),)
                        ),

                      ],
                    )
                  ],

                ),
              ),

            );
          }),
    );
  }

}
class PendingOrdersClass {
  String name;
  double price;
  int quantity;
  String tyreConfig;
  dynamic date;

  PendingOrdersClass({required this.name,required this.price, required this.quantity, required this.tyreConfig, required this.date});
}