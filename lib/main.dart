// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// Future<String> sendSMS( String phoneNumber, String message) async {
//   String username = 'API_USER';
//   String password = 'API_PASS';
//   // String basicAuth =
//   //     'Basic ' + base64Encode(utf8.encode('$username:$password'));
//   // print(basicAuth);
//   var url = Uri.parse('https://api.46elks.com/a1/sms');
//   var response = await http.post(
//          url,
//       headers: <String, String>{'authorization': basicAuth},
//       body: {'to': phoneNumber, 'from': 'Android', 'message' : message});
//   print('Response status: ${response.statusCode}');
//   print('Response body: ${response.body}');
//   return response.body;
// }
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final appTitle = '46elks send SMS sample';
//     return MaterialApp(
//       title: appTitle,
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text(appTitle),
//         ),
//         body: MyCustomForm(),
//       ),
//     );
//   }
// }
// // Create a Form widget.
// class MyCustomForm extends StatefulWidget {
//   @override
//   MyCustomFormState createState() {
//     return MyCustomFormState();
//   }
// }
// // Create a corresponding State class, which holds data related to the form.
// class MyCustomFormState extends State<MyCustomForm> {
//   // Create a global key that uniquely identifies the Form widget
//   // and allows validation of the form.
//   final _formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     // Build a Form widget using the _formKey created above.
//     TextEditingController phoneNumberEditingController = TextEditingController();
//     TextEditingController messageEditingController = TextEditingController();
//     return Form(
//       key: _formKey,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           TextFormField(
//             controller: phoneNumberEditingController,
//             decoration: const InputDecoration(
//               icon: const Icon(Icons.phone),
//               hintText: 'Enter a phone number',
//               labelText: 'Phone',
//             ),
//             validator: (value) {
//               if (value.isEmpty) {
//                 return 'Please enter valid phone number';
//               }
//               return null;
//             },
//           ),
//           TextFormField(
//             controller: messageEditingController,
//             decoration: const InputDecoration(
//               icon: const Icon(Icons.message),
//               hintText: 'Enter your message.',
//               labelText: 'Message',
//             ),
//             validator: (value) {
//               if (value.isEmpty) {
//                 return 'Please enter the message.';
//               }
//               return null;
//             },
//           ),
//           new Container(
//               padding: const EdgeInsets.only(left: 150.0, top: 40.0),
//               child:  RaisedButton(
//                 child: const Text('Submit'),
//                 onPressed: () {
//                   // It returns true if the form is valid, otherwise returns false
//                   if (_formKey.currentState.validate()) {
//                     // If the form is valid, display a Snackbar.
//                     sendSMS(phoneNumberEditingController.text, messageEditingController.text).then((value) {
//                       Scaffold.of(context)
//                           .showSnackBar(SnackBar(content: Text(value)));
//                     });
//                   }
//                 },
//               )),
//         ],
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
//
// import 'dart:async';
//
// import 'package:flutter_sms/flutter_sms.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// SmsPermission() async{
//   var status = await Permission.sms.status;
//   if(status.isPermanentlyDenied){
//     print('sms service is permenantly denied');
//   }
//
//   if(status.isDenied || status.isRestricted) {
//     await Permission.sms.request();
//   }
//
//     Permission.sms.isGranted;
//     return;
//
// }
//
// class _MyAppState extends State<MyApp> {
//   late TextEditingController _controllerPeople, _controllerMessage;
//   String? _message, body;
//   String _canSendSMSMessage = 'Check is not run.';
//   List<String> people = [];
//   bool sendDirect = false;
//
//   @override
//   void initState() {
//     SmsPermission();
//     super.initState();
//     initPlatformState();
//   }
//
//   Future<void> initPlatformState() async {
//     _controllerPeople = TextEditingController();
//     _controllerMessage = TextEditingController();
//   }
//
//   Future<void> _sendSMS(List<String> recipients) async {
//     try {
//       String _result = await sendSMS(
//         message: _controllerMessage.text,
//         recipients: recipients,
//         sendDirect: sendDirect,
//       );
//       setState(() => _message = _result);
//     } catch (error) {
//       setState(() => _message = error.toString());
//     }
//   }
//
//   Future<bool> _canSendSMS() async {
//     bool _result = await canSendSMS();
//     setState(() => _canSendSMSMessage =
//     _result ? 'This unit can send SMS' : 'This unit cannot send SMS');
//     return _result;
//   }
//
//   Widget _phoneTile(String name) {
//     return Padding(
//       padding: const EdgeInsets.all(3),
//       child: Container(
//           decoration: BoxDecoration(
//               border: Border(
//                 bottom: BorderSide(color: Colors.grey.shade300),
//                 top: BorderSide(color: Colors.grey.shade300),
//                 left: BorderSide(color: Colors.grey.shade300),
//                 right: BorderSide(color: Colors.grey.shade300),
//               )),
//           child: Padding(
//             padding: const EdgeInsets.all(4),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 IconButton(
//                   icon: const Icon(Icons.close),
//                   onPressed: () => setState(() => people.remove(name)),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(0),
//                   child: Text(
//                     name,
//                     textScaleFactor: 1,
//                     style: const TextStyle(fontSize: 12),
//                   ),
//                 )
//               ],
//             ),
//           )),
//     );
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     //checkPermissions(context);
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('SMS Example'),
//         ),
//         body: ListView(
//           children: <Widget>[
//             if (people.isEmpty)
//               const SizedBox(height: 0)
//             else
//               SizedBox(
//                 height: 90,
//                 child: Padding(
//                   padding: const EdgeInsets.all(3),
//                   child: ListView(
//                     scrollDirection: Axis.horizontal,
//                     children: List<Widget>.generate(people.length, (int index) {
//                       return _phoneTile(people[index]);
//                     }),
//                   ),
//                 ),
//               ),
//             ListTile(
//               leading: const Icon(Icons.people),
//               title: TextField(
//                 controller: _controllerPeople,
//                 decoration:
//                 const InputDecoration(labelText: 'Add Phone Number'),
//                 keyboardType: TextInputType.number,
//                 onChanged: (String value) => setState(() {}),
//               ),
//               trailing: IconButton(
//                 icon: const Icon(Icons.add),
//                 onPressed: _controllerPeople.text.isEmpty
//                     ? null
//                     : () => setState(() {
//                   people.add(_controllerPeople.text.toString());
//                   _controllerPeople.clear();
//                 }),
//               ),
//             ),
//             const Divider(),
//             ListTile(
//               leading: const Icon(Icons.message),
//               title: TextField(
//                 decoration: const InputDecoration(labelText: 'Add Message'),
//                 controller: _controllerMessage,
//                 onChanged: (String value) => setState(() {}),
//               ),
//             ),
//             const Divider(),
//             ListTile(
//               title: const Text('Can send SMS'),
//               subtitle: Text(_canSendSMSMessage),
//               trailing: IconButton(
//                 padding: const EdgeInsets.symmetric(vertical: 16),
//                 icon: const Icon(Icons.check),
//                 onPressed: () {
//                   _canSendSMS();
//                 },
//               ),
//             ),
//             SwitchListTile(
//                 title: const Text('Send Direct'),
//                 subtitle: const Text(
//                     'Should we skip the additional dialog? (Android only)'),
//                 value: sendDirect,
//                 onChanged: (bool newValue) {
//                   setState(() {
//                     sendDirect = newValue;
//                   });
//                 }),
//             Padding(
//               padding: const EdgeInsets.all(8),
//               child: ElevatedButton(
//                 style: ButtonStyle(
//                   backgroundColor: MaterialStateProperty.resolveWith(
//                           (states) => Theme.of(context).colorScheme.secondary),
//                   padding: MaterialStateProperty.resolveWith(
//                           (states) => const EdgeInsets.symmetric(vertical: 10)),
//                 ),
//                 onPressed: () {
//                   _send();
//                 },
//                 child: Text(
//                   'SEND',
//                   style: Theme.of(context).textTheme.displayMedium,
//                 ),
//               ),
//             ),
//             Visibility(
//               visible: _message != null,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Expanded(
//                     child: Padding(
//                       padding: const EdgeInsets.all(12),
//                       child: Text(
//                         _message ?? 'No Data',
//                         maxLines: null,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _send() {
//     if (people.isEmpty) {
//       setState(() => _message = 'At Least 1 Person or Message Required');
//     } else {
//       _sendSMS(people);
//     }
//   }
// }


import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utility/login/login.dart';

import 'clipboard/clipboard.dart';
import 'homePage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

        Provider<LoginScreen>(
          create: (_) =>   LoginScreen(),
        ),
        Provider<HomePage>(
            create: (_) => HomePage()
        ),

        Provider<Clipboard>(
          create: (_) => const Clipboard(),
        ),

      ],


      child: MaterialApp(
        // navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'Tyreplex Utils',
        theme: ThemeData(
            primaryColor: Colors.red,
            secondaryHeaderColor: Colors.cyan,
            inputDecorationTheme: const InputDecorationTheme(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.red),
                ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.red)
              )
             // contentPadding: EdgeInsets.all(10)
            ),
            textTheme: const TextTheme(
              titleMedium: TextStyle(
                fontWeight: FontWeight.w300,
                color: Colors.black,
                fontSize: 25.0,
              ),
            ),
           // colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red).copyWith(secondary: Colors.white)
           ),


        home: const LoginScreen(),

      ),
    );
  }
}