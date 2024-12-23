import 'package:cli_project/components/my_button.dart';
import 'package:cli_project/components/my_textfield.dart';
import 'package:cli_project/helper/helper_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text controllers
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPwController = TextEditingController();

  // register method
  void registerUser() async {
    // show loading circle
    showDialog(
        context: context,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));

    // make sure passwords match
    if (passwordController.text != confirmPwController.text) {
      // pop loading circle
      Navigator.pop(context);

      // show error message
      displayMessageToUser("Passwords don't match", context);
    }

    // if passwords do match
    else {
    // try creating the user
    try {
      // create the user
      UserCredential? userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);

      // pop loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // pop loading circle
      Navigator.pop(context);

      // display error message to user
      displayMessageToUser(e.code, context);
      return;
    }
  }

  }

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

                  // username textfield
                  MyTextfield(
                      hintText: "Username",
                      obscureText: false,
                      controller: usernameController),

                  const SizedBox(
                    height: 10,
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

                  // confirm password textfield
                  MyTextfield(
                      hintText: "Confirm password",
                      obscureText: true,
                      controller: confirmPwController),

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
                  MyButton(text: "Register", onTap: registerUser),

                  const SizedBox(
                    height: 25,
                  ),

                  // don't have an accound? Register here
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account",
                        style: TextStyle(
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          " Login here",
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
