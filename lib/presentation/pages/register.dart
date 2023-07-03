import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandangku_web/controller/database_controller.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(FirebaseController());
    return Scaffold(
      backgroundColor: context.theme.colorScheme.secondaryContainer,
      body: Center(
        child: Card(
          child: Container(
            padding: const EdgeInsets.all(20),
            width: 340,
            height: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'SIGN UP',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: c.email,
                  decoration: InputDecoration(
                      hintText: "Alamat Email",
                      labelText: "Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                Obx(
                  () => TextField(
                    controller: c.password,
                    obscureText: (c.isSelect.isTrue) ? false : true,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              c.isSelect.toggle();
                            },
                            icon: Icon(
                              (c.isSelect.isFalse)
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            )),
                        hintText: "password",
                        labelText: "password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        style: ButtonStyle(
                            foregroundColor: MaterialStatePropertyAll(
                                context.theme.colorScheme.onSecondaryContainer),
                            backgroundColor: MaterialStatePropertyAll(
                                context.theme.colorScheme.secondaryContainer)),
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text("back")),
                    ElevatedButton(
                        style: ButtonStyle(
                            foregroundColor: MaterialStatePropertyAll(
                                context.theme.colorScheme.onPrimary),
                            backgroundColor: MaterialStatePropertyAll(
                                context.theme.colorScheme.primary)),
                        onPressed: () {
                          c.signUp();
                        },
                        child: const Text("Sign Up"))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
