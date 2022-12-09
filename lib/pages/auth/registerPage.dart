import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mitchy_mobile_app/helper/helperFunction.dart';
import 'package:mitchy_mobile_app/pages/homeHome.dart';
import 'package:mitchy_mobile_app/pages/loginPage.dart';
import 'package:mitchy_mobile_app/service/auth_service.dart';
import 'package:mitchy_mobile_app/widgets/widgets.dart';
// import 'package:mitchy_mobile_app/widgets/widgets.dart';

class ResgisterPage extends StatefulWidget {
  const ResgisterPage({super.key});

  @override
  State<ResgisterPage> createState() => _ResgisterPageState();
}

class _ResgisterPageState extends State<ResgisterPage> {
  bool _isLoading = false;
  final formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String fullName = "";
  final items = [
    'Start Up',
    'For Investor',
    'For Coporation',
    'For Accelerators',
  ];
  String? value;

  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    // height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              "assets/Moment to remember-rafiki.png",
                            ),
                            fit: BoxFit.cover,
                            opacity: 0.3)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 30),
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Text(
                            //   "MitchyApp",
                            //   style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                            // ),
                            GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(Icons.arrow_back)),
                            SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                "let's get started",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w400),
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Surname"),
                                  ),
                                  TextFormField(
                                    decoration: textInputDecoration.copyWith(
                                        prefixIcon:
                                            Icon(Icons.person_outlined)),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Other Name's"),
                                  ),
                                  TextFormField(
                                    decoration: textInputDecoration.copyWith(
                                        prefixIcon: Icon(Icons.person_add)),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Gmail"),
                                  ),
                                  TextFormField(
                                    decoration: textInputDecoration.copyWith(
                                        prefixIcon: Icon(Icons.email)),
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
                                  )
                                ],
                              ),
                            ),

                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Password"),
                                  ),
                                  TextFormField(
                                    decoration: textInputDecoration.copyWith(
                                        prefixIcon: Icon(Icons.password)),
                                    onChanged: (value) {
                                      setState(() {
                                        password = value;
                                      });
                                    },
                                    validator: (val) {
                                      if (val!.length < 6) {
                                        return "Password must be at least 6 character";
                                      }
                                    },
                                  )
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Phone Number"),
                                  ),
                                  TextFormField(
                                    decoration: textInputDecoration.copyWith(
                                        prefixIcon: Icon(Icons.phone_enabled)),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Date Of Birth"),
                                  ),
                                  TextFormField(
                                    decoration: textInputDecoration.copyWith(
                                        prefixIcon:
                                            Icon(Icons.date_range_sharp)),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Center(
                                child: Container(
                              // margin: EdgeInsets.all(12),
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.blue, width: 1),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  value: value,
                                  iconSize: 36,
                                  icon: Icon(Icons.arrow_drop_down,
                                      color: Colors.blue),
                                  isExpanded: true,
                                  items: items.map(buildMenuItem).toList(),
                                  onChanged: (value) =>
                                      setState(() => this.value = value),
                                ),
                              ),
                            )),
                            SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                                // height: double.infinity,
                                width: double.infinity,
                                height: 50,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Color.fromARGB(235, 197, 215, 223),
                                      // primary: Theme.of(context).primaryColor,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                  // onPressed: () {},
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 16,
                                    ),
                                  ),
                                  onPressed: () {
                                    register();
                                    // NextPageReplace(
                                    //   context,
                                    //   HomeHome(),
                                    // );
                                  },
                                )),
                            SizedBox(
                              height: 5,
                            ),
                            Text.rich(TextSpan(
                                text: "Already have an account? ",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 6, 190, 247)),
                                children: [
                                  TextSpan(
                                      text: "Login here",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          decoration: TextDecoration.underline),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          NextPage(context, LoginPage());
                                        })
                                ]))
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
      ));

  void register() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        var _isLoading = true;
      });
      await authService
          .registerUserWithEmailandPassword(fullName, email, password)
          .then((value) async {
        if (value == true) {
          // saving the shared preference state

          await HelperFunctions.saveUserLoggedInStatus(true);
          await HelperFunctions.saveUserEmailSF(email);
          await HelperFunctions.saveUserNameSF(fullName);
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
