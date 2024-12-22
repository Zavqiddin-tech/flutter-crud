import 'package:cli_project/components/my_button.dart';
import 'package:cli_project/components/my_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final void Function()? onTap;

  LoginPage({super.key, required this.onTap});

  // text controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // login method
  void login() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // logo
                  Icon(
                    Icons.person,
                    size: 80,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  // app name
                  const Text(
                    "M I N I M A L",
                    style: TextStyle(fontSize: 20),
                  ),

                  const SizedBox(
                    height: 50,
                  ),

                  // email textfield
                  MyTextfield(
                      hintText: "Email",
                      obscureText: false,
                      controller: emailController),

                  const SizedBox(
                    height: 10,
                  ),

                  // password textfield
                  MyTextfield(
                      hintText: "Password",
                      obscureText: true,
                      controller: passwordController),

                  const SizedBox(
                    height: 10,
                  ),

                  // forgot password
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Forgot password?",
                        style: TextStyle(
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  // sign in button
                  MyButton(text: "Login", onTap: login),

                  const SizedBox(
                    height: 25,
                  ),

                  // don't have an accound? Register here
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account",
                        style: TextStyle(
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
                      ),
                      GestureDetector(
                        onTap: onTap,
                        child: const Text(
                          " Register here",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
