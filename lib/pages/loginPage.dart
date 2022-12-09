import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mitchy_mobile_app/helper/helperFunction.dart';
import 'package:mitchy_mobile_app/pages/homeHome.dart';
import 'package:mitchy_mobile_app/service/auth_service.dart';
import 'package:mitchy_mobile_app/service/database_service.dart';
import 'package:mitchy_mobile_app/widgets/widgets.dart';
import 'auth/registerPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  bool isVisible = true;
  bool isCLicked = false;
  bool _isLoading = false;
  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ))
          : SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Logic Transit",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Login now and let's get started",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Image.asset("assets/loginlogo.png"),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        obscureText: false,
                        decoration: textInputDecoration.copyWith(
                            labelText: "Email",
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.black,
                            )),
                        validator: (value) {
                          return RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value!)
                              ? null
                              : "Please enter a valid email";
                        },
                        onChanged: (value) {
                          setState(() {
                            email = value;
                          });
                        },
                      ),
                      SizedBox(
                        height: 15.0,
                      ),

                      TextFormField(
                        obscureText: isVisible,
                        decoration: textInputDecoration.copyWith(
                            labelText: "Password",
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.black,
                            ),
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isVisible = !isVisible;
                                    isCLicked = !isCLicked;
                                  });
                                },
                                child: isCLicked
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.visibility))),

                        onChanged: (value) {
                          setState(() {
                            password = value;
                          });
                        },
                        // check validation
                        validator: (val) {
                          if (val!.length < 6) {
                            return "Password must be at least 6 character";
                          }
                        },
                      ),
                      SizedBox(
                        height: 15.0,
                      ),

                      SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(235, 197, 215, 223),
                                // primary: Theme.of(context).primaryColor,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30))),
                            // onPressed: () {},
                            child: Text(
                              "Sign In",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 16),
                            ),
                            onPressed: () {
                              // HomeHome();
                              login();
                            },
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Text.rich(TextSpan(
                          text: "Don't have an account? ",
                          style: TextStyle(
                              color: Color.fromARGB(255, 6, 190, 247)),
                          children: [
                            TextSpan(
                                text: "Register here",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    decoration: TextDecoration.underline),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    NextPage(context, ResgisterPage());
                                  })
                          ]))
                      // ElevatedButton(
                      //     onPressed: () {
                      //       login();
                      //     },
                      //     child: Text("For Lagos"))
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  login() async {
    // if (formKey.currentState!.validate()) {}
    if (formKey.currentState!.validate()) {
      setState(() {
        var _isLoading = true;
      });
      await authService
          .loginWithUserNameandPassword(email, password)
          .then((value) async {
        if (value == true) {
          QuerySnapshot snapshot =
              await DataBaseService(uid: FirebaseAuth.instance.currentUser!.uid)
                  .gettingUserData(email);
          // saving the values to our shared preferences
          await HelperFunctions.saveUserLoggedInStatus(true);
          await HelperFunctions.saveUserEmailSF(email);
          await HelperFunctions.saveUserNameSF(snapshot.docs[0]["fullName"]);

          NextPageReplace(context, HomeHome());
        } else {
          showSnackbar(
            context,
            Colors.red,
            value,
          );
          setState(() {
            _isLoading = false;
          });
        }
      });
    }
  }
}
