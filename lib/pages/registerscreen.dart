// ignore_for_file: camel_case_types, prefer_const_constructors, avoid_print, unnecessary_null_comparison, non_constant_identifier_names, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:secret_pr/bottombarinitalpage/bottombarpage.dart';
import 'package:secret_pr/globalvariabes/globalvariables.dart';
import '../decorations/inputfields.dart';
import '../decorations/welocmescreenbuttons.dart';

class registerpage extends StatefulWidget {
  static String id = 'registerpage';
  const registerpage({super.key});

  @override
  State<registerpage> createState() => _registerpageState();
}

class _registerpageState extends State<registerpage> {
  late String usernameqq;
  late String Passwordqq;
  late String name = "vivek";
  late String phoneNumber = "9192999";
  late String address = "hh";
  // late String refreal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 191, 216, 243),
      body: ProgressHUD(
        child: Builder(builder: (context) {
          return ListView(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Hero(
                    tag: "logo",
                    child: const CircleAvatar(
                      backgroundImage: AssetImage("asset/logo.jpg"),
                      radius: 120,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Nice to meet you!",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Welcome back You've ",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const Text(
                    "been missed! ",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 35, right: 50, left: 50),
                    child: TextField(
                      onChanged: (value) {
                        usernameqq = value;
                      },
                      decoration: inputdecorusernmae,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 50, left: 50, top: 20),
                    child: TextField(
                        onChanged: (value) {
                          Passwordqq = value;
                        },
                        keyboardType: TextInputType.phone,
                        obscureText: true,
                        decoration: inputdecorpassword),
                  ),
                  // Padding(
                  //   padding:
                  //       const EdgeInsets.only(top: 20, right: 50, left: 50),
                  //   child: TextField(
                  //     onChanged: (value) {
                  //       refreal = value;
                  //     },
                  //     decoration: inputdecorrefreal,
                  //   ),
                  // ),
                  const SizedBox(
                    height: 30,
                  ),
                  lastredbutton_register_login(
                    onpressed: () async {
                      final progress = ProgressHUD.of(context);
                      progress?.showWithText("Ruko JARA..");
                      // print(usernameqq);
                      // print(Passwordqq);
                      // print(refreal);
                      try {
                        await registerUser(
                            usernameqq, Passwordqq, name, phoneNumber, address);
                        // Registration successful, navigate to the next screen
                        Navigator.pushNamed(context, bottombar.id);
                        // await _auth.createUserWithEmailAndPassword(
                        //     email: usernameqq, password: Passwordqq);
                        // print(ifregister.verificationId);
                        // if (ifregister != null) {
                        //   Navigator.pushNamed(context, bottombar.id);
                        //   progress?.dismiss();
                        // }
                        // progress?.dismiss();
                      } catch (e) {
                        print(e);
                      } finally {
                        progress?.dismiss();
                      }
                    },
                    text: "Register",
                  ),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}
