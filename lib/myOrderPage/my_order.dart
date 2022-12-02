import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:utility/myOrderPage/test_Screen_B.dart';
import 'package:utility/myOrderPage/test_screen_A.dart';
import 'package:utility/myOrderPage/test_screen_C.dart';

import '../drawer/drawer_page.dart';


class MyOrdersPage extends StatefulWidget{
  const MyOrdersPage({Key? key}) : super(key: key);

  @override
  MyOrdersPageState createState() => MyOrdersPageState();
  }
class MyOrdersPageState extends State<MyOrdersPage >{
  int _counter = 0;
  bool showElevatedButtonBadge = true;
  int _selectedScreenIndex = 0;
  final List _orderScreens = [
    {"screen":  TestScreenA(), },
    {"screen":  TestScreenB(), },
    {"screen":  TestScreenC(), }
  ];

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: const Text('My Orders',style: TextStyle(fontSize: 20,color: Colors.white)),
        actions: [
          IconButton(
              onPressed: (){
                setState(() {
                  _counter++;
                }); // this will increase badge counter as of now
              },
              icon: const Icon(Icons.notifications_active_outlined,color: Colors.white,)),

          Badge(
            position: BadgePosition.topEnd(top: 0,end: 3),
            animationDuration: const Duration(milliseconds: 200),
            animationType: BadgeAnimationType.slide,
            badgeContent: Text(
              _counter.toString(),
              style: const TextStyle(color: Colors.white),
            ),
            badgeColor: Colors.green,
            child: IconButton(
                onPressed: (){
                  print("These are items in your cart");
                },
                icon: const Icon(Icons.shopping_cart,color: Colors.white,)),
          ),
                 ],

                    ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 5.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      Card(
                        elevation: 5,
                        child: SizedBox(
                          height: 80,
                          width: 150,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Text('Earning in September',style: TextStyle(fontSize: 13,color: Colors.black38),),
                                ],
                              ),
                              const SizedBox(height: 6,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text('₹ 000', style: TextStyle(fontSize: 17),),
                                      SizedBox(width: 6,),
                                      Text('0.0%', style: TextStyle(fontSize: 17, color: Colors.red, ),),
                                    ],
                                  ),


                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(elevation: 5,
                        child: SizedBox(
                          height: 80,
                          width: 120,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Text('Total Earning',style: TextStyle(fontSize: 13,color: Colors.black38),),
                                ],
                              ),
                              const SizedBox(height: 6,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text('₹ 000', style: TextStyle(fontSize: 17),),

                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(elevation: 5,
                        child: SizedBox(
                          height: 80,
                          width: 160,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Text('Earning in Previous month',style: TextStyle(fontSize: 13,color: Colors.black38),),
                                ],
                              ),
                              const SizedBox(height: 6,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text('₹ 000', style: TextStyle(fontSize: 17),),



                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),

              ),
              _orderScreens[_selectedScreenIndex]["screen"],// calling body screens below cards
            ],
          ),
        ],
      ),
     // drawer: const Drawer(),

      drawer: const DrawerPage(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        currentIndex: _selectedScreenIndex,
        items:  const [
          BottomNavigationBarItem(icon: Icon(Icons.pending,size: 25,), label: "Pending", backgroundColor: Colors.red),
          BottomNavigationBarItem(icon: Icon(Icons.watch_later_outlined,color: Colors.black,size: 25,), label: "Upcoming"),
          BottomNavigationBarItem(icon: Icon(Icons.check,color: Colors.black,size: 25,), label: "Completed"),

        ],

      ),

               );



  }
}
