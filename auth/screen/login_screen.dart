import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/Register_Controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  var register = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Text(
        "UserName",
        style: TextStyle(fontSize: 12),
      ),
      TextFormField(
        controller: register.nameCTC,
        textAlign: TextAlign.center,
      ),
      SizedBox(
        height: 20,
      ),
      Text(
        "surname",
        style: TextStyle(fontSize: 12),
      ),
      TextFormField(
        controller: register.sNameCTC,
        textAlign: TextAlign.center,
      ),
      SizedBox(
        height: 20,
      ),
      Text(
        "email",
        style: TextStyle(fontSize: 12),
      ),
      TextFormField(
        controller: register.emailCTC,
        textAlign: TextAlign.center,
      ),
      Text(
        "Password",
        style: TextStyle(fontSize: 12),
      ),
      TextFormField(
        obscureText: true,
        controller: register.passCTC,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 12),
      ),
      SizedBox(
        height: 20,
      ),
      Obx(() => register.isLoading.value
          ? CircularProgressIndicator()
          : ElevatedButton(
              onPressed: () {
                register.registerCont();
              },
              child: Text(
                "Register",
                style: TextStyle(color: Colors.red),
              ))),
    ]));
  }
}
