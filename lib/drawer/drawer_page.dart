import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:utility/userlocate/location.dart';

import '../clipboard/clipboard.dart';
import '../login/login.dart';
import '../sharedData/shared_data.dart';

class DrawerPage extends StatefulWidget{
  const DrawerPage({Key? key}) : super(key: key);

  @override
  DrawerPageState createState() => DrawerPageState();
}
class DrawerPageState extends State<DrawerPage >{
  String? appVersion;
  Future<void> getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      appVersion = '${packageInfo.version} Build ${packageInfo.buildNumber}';
    });
  }

  @override
  Widget build(BuildContext context){

    return Drawer(
        child: Column(

          children: [
            SizedBox(
              height: 140,
              child: UserAccountsDrawerHeader(
                decoration: const BoxDecoration(

                    color: Colors.red
                ),
                accountName: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Howdy Vikas "),
                    CircleAvatar(
                      radius: 32,
                      // backgroundColor:
                      // Theme.of(context).platform == TargetPlatform.iOS
                      //     ? Color(0xFF56ccf2)
                      //     : Colors.white,
                      child: Text("VK",

                        style: TextStyle(fontSize: 30,
                          // color: Colors.lightGreenAccent,
                        ),
                      ),
                    ),
                  ],
                ),
                accountEmail: const Text("7171717171"),
              ),
            ),
            Expanded(
                child: ListView(
                  children: [

                    Card(
                      elevation:0,
                      child: ListTile(
                        title: const Text('log out',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            )),
                        contentPadding: const EdgeInsets.fromLTRB(20, 0, 0, 5),
                        leading: const Icon(Icons.logout,size: 25,),
                        onTap: () async {
                          await FirebaseAuth.instance.signOut();
                          Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) => const LoginScreen()));

                        },


                        //Navigator.of(context).pop();
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (BuildContext context) => HomeScreen()));

                      ),
                    ),
                    Card(
                      elevation:0,
                      child: ListTile(
                        title: const Text('Locate',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            )),
                        contentPadding: const EdgeInsets.fromLTRB(20, 0, 0, 5),
                        leading: const Icon(Icons.map, size: 25,),
                        onTap: () async {
                          await FirebaseAuth.instance.signOut();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => const LocateUser()));

                        },


                      ),
                    ),


                    Card(
                      child: ListTile(
                        title: const Text('ClipBoard',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            )),
                        contentPadding: const EdgeInsets.fromLTRB(20, 0, 0, 5),
                        leading: const Icon(Icons.dashboard_customize_sharp,size: 25,),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                             builder: (BuildContext context) => const Clipboard()));
                        },
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: const Text('Autopaste',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            )),
                        contentPadding: const EdgeInsets.fromLTRB(20, 0, 0, 5),
                        leading: const Icon(Icons.dashboard_customize_sharp,size: 25,),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => const DataSharedPage()));
                        },
                      ),
                    ),

                  ],
                )
            ),

            Align(
              alignment: FractionalOffset.bottomCenter,
              child: Container(
                padding: const EdgeInsets.only(bottom: 5.0),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text('TyrePlex',style: TextStyle(fontSize: 20),),
                            Text('trusted by 3000+ dealers',style: TextStyle(fontSize: 10),),
                          ],
                        ),
                        const SizedBox(width: 100,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            const Text('2.0.12 Build 68', style: TextStyle(fontSize: 10),),
                            if (appVersion != null) Text('$appVersion')
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

            ),

          ],
        ),
      );

  }


}