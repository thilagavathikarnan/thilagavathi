import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/IconPicker/Packs/Material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:habittrackergad/Components/Loginpage/Login.dart';
import 'package:habittrackergad/Utils/Constants.dart';
import 'package:habittrackergad/controller/auth_controller.dart';

import '../../Api_providers/api_provider.dart';
import '../Habit/Custom_habitpage.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  UserController userController = Get.put(UserController());

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController gender = TextEditingController();
  void  initState()
  {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: ListView(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 40,
                  ),
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Row(
                      children: const [
                        CircleAvatar(
                            backgroundColor: Colors.grey,
                            foregroundColor: Colors.white,
                            child: Icon(Icons.arrow_back_ios_new_outlined)),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
            const SizedBox(
              height: 30,
            ),
            Image.asset(
              REGISTER_IMG,
              width: 150,
              height: 150,
            ),
            const SizedBox(
              height: 10,
            ),
            // Text(
            //   "Register",
            //   style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            // ),

            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                "First name",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),

            TextField(
              controller: userController.first_name,
              decoration: InputDecoration(
                // label: Text("Enter your name"),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 255, 255, 255))),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                "Last name",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),

            TextField(
              controller: userController.last_name,

              decoration: InputDecoration(
                // label: Text("Last name"),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 255, 255, 255))),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                "Email",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            TextField(
              controller: userController.email,
              decoration: InputDecoration(
                // label: Text("Email"),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 255, 255, 255))),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                "Password",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            TextField(
              controller: userController.password,
              decoration: InputDecoration(
                // label: Text("Password"),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 255, 255, 255))),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Obx(()
            {
              return  InkWell(
                onTap: ()
                {

                  userController.registerUser();
                },
                // onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Customhabit()),

                child: userController.isLoaderReg.value == true?
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0XFFffbf96),
                        Color(0XFFfe7096),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      )
                  ),
                ):Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0XFFffbf96),
                        Color(0XFFfe7096),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Text('Sign up',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: BUTTONTEXTCOLOR)),
                  ),
                ),
              );
            }),

            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Text(
                    "You have any account?",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                  ),
                  child: const Text(
                    "Sign in",
                    style: TextStyle(fontSize: 18, color: Colors.green),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
