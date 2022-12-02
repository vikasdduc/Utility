import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class DataSharedPage extends StatefulWidget {
  const DataSharedPage({super.key});

  @override
  State<DataSharedPage> createState() => _DataSharedPageState();
}

class _DataSharedPageState extends State<DataSharedPage> {

  var textarea = TextEditingController();
  static const platform = MethodChannel('www.tyreplex.com/channel');
  var dataShared = 'No data';
  String myUrl = "no url";
  @override
  void initState() {
    super.initState();
    getSharedText();
    getBrowsablePath();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
          const SizedBox(
            height: 50,
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            padding: const EdgeInsets.all(10.0),
            constraints: const BoxConstraints(minHeight: 50, minWidth: double.infinity),

            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                border: Border.all(color: Colors.red,width: 2)
            ),
            child: Text(dataShared),
          ),
          const SizedBox(
            height: 10,
          ),

          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: textarea,
              keyboardType: TextInputType.multiline,
              maxLines: 4,
              decoration: InputDecoration(
                  labelStyle: TextStyle(fontSize: 20, color: Theme.of(context).primaryColor),
                  labelText: "Shared data",
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.redAccent)
                  )
              ),

            ),
          ),
        ]));
  }

  Future<void> getSharedText() async {
    var sharedData = await platform.invokeMethod('getSharedText');
       if (sharedData != null) {
      setState(() {
        dataShared = sharedData;
      });
    }
  }

  Future<void> getBrowsablePath() async {
    var launchedUrl = await platform.invokeMethod("initialLink");
    if (launchedUrl != null) {
      setState(() {
        myUrl = launchedUrl;
      });
    }
  }
}
