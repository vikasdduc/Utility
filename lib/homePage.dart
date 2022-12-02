

import 'package:flutter/material.dart';

import 'clipboard/clipboard.dart';
import 'drawer/drawer_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();

    // use this
    //Timer.run(() => Scaffold.of(context).openDrawer());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Clipboard(),
      drawer: DrawerPage(),

    );

  }
}
