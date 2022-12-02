import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:utility/homePage.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  bool otpVisibility = false;
  User? user;
  String verificationID = "";
  var countryCode = '+91';
  var phone = '';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
     onTap: (){
       FocusScope.of(context).requestFocus(FocusNode());
         },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,
          title: const Text('Signin / OTP',style: TextStyle(fontSize: 20,color: Colors.white)),
          // leading: IconButton(
          //   onPressed: () {
          //   // Navigator.of(context).pop();
          // },
          //   icon: const Icon(Icons.arrow_back, color: Colors.white,),),
        ),
        body: Container(
          color: Colors.white,
          margin: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 5,),
              Image.asset('assets/tyre.png'),

          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text('Enter 10 digit mobile number', style: TextStyle(fontSize: 15,color: Colors.black),),
              SizedBox(height: 10,),
              Text('An OTP will be sent to this mobile number', style: TextStyle(fontSize: 14,color: Colors.black38),),
              SizedBox(height: 20,)
            ],
          ),
              const SizedBox(height: 5,),

              TextFormField(
                autofocus: true,
                controller: phoneController,
                decoration:  InputDecoration(
                  labelStyle: TextStyle(fontSize: 18, color: Theme.of(context).primaryColor),
                  counterText: '',
                  constraints: const BoxConstraints(maxWidth:double.infinity,maxHeight: 50 ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  labelText: 'Mobile Number',
                  prefix: const Padding(
                    padding: EdgeInsets.all(4),
                    child: Text('+91 | ', style: TextStyle(fontSize: 18),),

                  ),
                ),
                maxLength: 10,
                keyboardType: TextInputType.phone,
                 style: const TextStyle(fontSize: 18),
                 onChanged: (value)
                 {
                   // if (otpVisibility){
                   //   FocusScope.of(context).requestFocus(FocusNode());
                   //   verifyOTP();
                   // }
                  // if ((RegExp(r'^[0-9]{10}$').hasMatch(value))){
                  //   FocusScope.of(context).requestFocus(FocusNode());
                  //   verifyOTP();
                  //
                  // }
                  phone = value;

                  print(phone + ".................");

                  if ((RegExp(r'^[0-9]{10}$').hasMatch(phone)) && (otpVisibility = true)) {
                    FocusScope.of(context).requestFocus(FocusNode());
                    loginWithPhone();
                  }

                 // if ((RegExp(r'^[0-9]{10}$').hasMatch(phone))) {
                 //   FocusScope.of(context).requestFocus(FocusNode());
                 //   otpVisibility = true;
                 // }
                 },

              ),
              const SizedBox(height: 10),


              Visibility(
                visible: otpVisibility,
                child: TextField(
                  autofocus: true,
                  controller: otpController,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(fontSize: 18, color: Theme.of(context).primaryColor),
                    constraints: const BoxConstraints(maxWidth:double.infinity,maxHeight: 73 ),
                    labelText: 'OTP',
                    prefix: const Padding(
                      padding: EdgeInsets.all(4),
                      child: Text(''),
                    ),
                  ),
                  maxLength: 6,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(fontSize: 18),
                  // onChanged: (value){
                  //   if (value == 6){
                  //     setState(() {
                  //       Navigator.of(context).push(MaterialPageRoute(builder: (_)=> HomePage()));
                  //     });
                  //   }
                  // },

                ),
              ),
              const SizedBox(
                height: 10,
              ),


              // MaterialButton(
              //   minWidth: 350,
              //   height: 45,
              //   color: Colors.red,
              //
              //   // style: ElevatedButton.styleFrom(
              //   //     primary: Theme.of(context).primaryColor, //background color of button
              //   //     side: const BorderSide(width: 2,), //border width and color
              //   //     elevation: 5, //elevation of button
              //   //     shape: RoundedRectangleBorder( //to set border radius to button
              //   //         borderRadius: BorderRadius.circular(30)
              //   //     ),
              //     //     padding: const EdgeInsets.all(5) //content padding inside button
              //   // ),
              //
              //   onPressed: () {
              //   //   setState(() {
              //   //   if (otpVisibility) {
              //   //     //FocusScope.of(context).requestFocus(FocusNode());
              //   //     verifyOTP();
              //   //   } else {
              //   //     loginWithPhone();
              //   //   }
              //   // }
              //   // );
              //
              //   },
              //   child: Text(
              //     otpVisibility ? "Verify" : "Submit",
              //     style: const TextStyle(
              //       color: Colors.white,
              //       fontSize: 20,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  void loginWithPhone() async {
    auth.verifyPhoneNumber(
      phoneNumber: "${countryCode + phone}",
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then((value) {

          print("You are logged in successfully..");
          setState(() {
            Navigator.of(context).push(MaterialPageRoute(builder: (_)=> HomePage()));
          });

        });
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        otpVisibility = true;
        verificationID = verificationId;
        setState(() {

        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void verifyOTP() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationID, smsCode: otpController.text);

    await auth.signInWithCredential(credential).then(
          (value) {
        setState(() {
          user = FirebaseAuth.instance.currentUser;
        });
      },
    ).whenComplete(
          () {
        if (user != null) {
          Fluttertoast.showToast(
            msg: "You are logged in successfully.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );

          Navigator.of(context).push(MaterialPageRoute(builder: (_)=> HomePage()));
        } else {
          Fluttertoast.showToast(
            msg: "your login is failed",

            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      },
    );
  }
}