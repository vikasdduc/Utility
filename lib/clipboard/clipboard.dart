
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:utility/drawer/drawer_page.dart';

class Clipboard extends StatefulWidget {
  const Clipboard({Key? key}) : super(key: key);

  @override
  State<Clipboard> createState() => _ClipboardState();
}

class _ClipboardState extends State<Clipboard> {

  //static const platform = MethodChannel('www.tyreplex.com/channel');
  //late List<userModel>? _userModel = [];

  @override
  void initState(){
    // getSharedText();
    super.initState();

    //_getData();
  }

  // void _getData() async{
  //   _userModel = (await ApiService().getUsers());
  //   Future.delayed(const Duration(seconds: 1)).then((value) => setState((){}));
  // }

  bool _obscureText = true;
  bool _obscureText1 = true;
  // bool _obscureText3 = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _toggle1() {
    setState(() {
      _obscureText1 = !_obscureText1;
    });
  }
  // void _toggle2() {
  //   setState(() {
  //     _obscureText3 = !_obscureText3;
  //   });
  // }

  String dropdownvalue = 'E/Type-1';
  String button3 =  "D/Type-2";
  String button4 = "D/Type-D";

  var Buttons = [
    'E/Type-1',
    'E/Type-2',
  ];

  TextEditingController pasteArea = TextEditingController();
  TextEditingController outputArea = TextEditingController();
  //TextEditingController dataShared3 = TextEditingController();
  //var dataShared = 'no data';




  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          centerTitle: true,
          title: const Text("ClipBoard"),
          backgroundColor: Theme.of(context).primaryColor,
        ),

        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 20,),

              TextFormField(
                  autofocus: true,
                  controller: pasteArea,
                  obscureText: _obscureText,
                  keyboardType: TextInputType.text,
                  decoration:  InputDecoration(
                    labelStyle: TextStyle(fontSize: 18, color: Theme.of(context).primaryColor),
                    constraints: const BoxConstraints(maxWidth:double.infinity,maxHeight: 50 ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    labelText: 'Enter Text',
                    suffixIcon: IconButton(
                      color: Colors.red,
                      onPressed: _toggle,
                      icon: Icon(
                        _obscureText?Icons.visibility:Icons.visibility_off,
                      ),),
                  )
              ),
              Align(
                alignment: Alignment.topLeft,
                child: ElevatedButton(
                  onPressed: (){
                    FlutterClipboard.paste()
                        .then((value) {
                      setState(() {

                        outputArea.text = value;
                      });
                    } );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black38,
                      //side: const BorderSide(width: 2,color: Colors.black26),
                      minimumSize: const Size(100, 40),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)
                      ),
                      padding: const EdgeInsets.all(5)
                  ),
                  child: const Text("Paste"),
                ),
              ),

              const SizedBox(height: 10,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropdownButton(
                    // Initial Value
                      value: dropdownvalue,
                      // Down Arrow Icon
                      icon: const Icon(Icons.arrow_drop_down),
                      // Array list of items
                      items: Buttons.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                      style: TextStyle(fontSize: 18, color: Theme.of(context).primaryColor),
                      borderRadius: BorderRadius.circular(12)
                  ),

                  ElevatedButton(
                    onPressed: (){
                      FlutterClipboard.paste()
                          .then((value) {
                        setState(() {

                          outputArea.text = value;
                        });
                      } );
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.blue,
                        shadowColor: Colors.red,
                        side: const BorderSide(width: 2,color: Colors.blue),
                        minimumSize: const Size(100, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)
                        ),
                        padding: const EdgeInsets.all(5)
                    ),
                    child:  Text(button3),
                  ),

                  ElevatedButton(
                    onPressed: (){
                      FlutterClipboard.paste()
                          .then((value) {
                        setState(() {

                          outputArea.text = value;
                        });
                      } );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        // shadowColor: Colors.blue,
                        elevation: 0,
                        side: const BorderSide(width: 2,color: Colors.red),
                        minimumSize: const Size(100, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)
                        ),
                        padding: const EdgeInsets.all(5)
                    ),
                    child:  Text(button4),
                  ),

                ],
              ),

              const SizedBox(
                height: 50,
              ),

              TextFormField(
                  controller: outputArea,
                  obscureText: _obscureText1,
                  keyboardType: TextInputType.text,
                  decoration:  InputDecoration(
                    labelStyle: TextStyle(fontSize:18,
                        color: Theme.of(context).primaryColor),
                    constraints: const BoxConstraints(maxWidth:double.infinity,maxHeight: 50 ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    labelText: 'OutPut',
                    suffixIcon: IconButton(
                      color: Colors.red,
                      onPressed: _toggle1,
                      icon: Icon(
                        _obscureText1?Icons.visibility:Icons.visibility_off,
                      ),),
                  )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: (){
                      setState(() {
                        outputArea.clear();
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        //side: const BorderSide(width: 2,),
                        elevation: 0,
                        minimumSize: const Size(100, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)
                        ),
                        padding: const EdgeInsets.all(5)
                    ),
                    child: const Text("Clear"),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      if (outputArea.text.trim() == "") {

                        // do nothing
                      } else {
                        FlutterClipboard.copy(outputArea.text)
                            .then((value) => print('copied text'));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black38,
                        //side: const BorderSide(width: 2,),
                        elevation: 0,
                        minimumSize: const Size(100, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)
                        ),
                        padding: const EdgeInsets.all(5)
                    ),
                    child: const Text("Copy"),
                  ),


                ],

              ),

              const SizedBox(
                height: 5,),

              // TextField(
              //   controller: dataShared3,
              //     obscureText: _obscureText3,
              //     keyboardType: TextInputType.text,
              //     decoration:  InputDecoration(
              //       labelStyle: TextStyle(fontSize:18,
              //           color: Theme.of(context).primaryColor),
              //       constraints: const BoxConstraints(maxWidth:double.infinity,maxHeight: 70 ),
              //       border: const OutlineInputBorder(
              //         borderSide: BorderSide.none,
              //         borderRadius: BorderRadius.all(Radius.circular(5)),
              //       ),
              //       labelText: 'External data shared',
              //       suffixIcon: IconButton(
              //         onPressed: _toggle2,
              //         icon: Icon(
              //           _obscureText3?Icons.visibility:Icons.visibility_off,
              //         ),),
              //     )
              // ),

              // Expanded(
              //   child: ListView.builder(
              //       itemCount: _userModel!.length,
              //       itemBuilder: (context,index){
              //         return Card(
              //           child: Column(
              //             children: [
              //               Row(
              //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //                 children: [
              //                   Text(_userModel![index].id.toString()),
              //                   Text(_userModel![index].username),
              //                 ],
              //               ),
              //               const SizedBox( height: 20,),
              //
              //               Row(
              //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //                 children: [
              //                   Text(_userModel![index].email),
              //                   Text(_userModel![index].website),
              //                 ],
              //               )
              //             ],
              //           ),
              //         );
              //
              //       }),
              // ),

              //Text(dataShared, textAlign: TextAlign.start,)



            ],
          ),
        ),
        drawer:  const DrawerPage(),
    );

  }

// Future<void> getSharedText() async {
//   var sharedData = await platform.invokeMethod('getSharedText');
//   if (sharedData != null) {
//     setState(() {
//       dataShared3 = sharedData;
//       //outputArea = dataShared as TextEditingController;
//     });
//     print("$dataShared3.......................");
//   }
// }


}
