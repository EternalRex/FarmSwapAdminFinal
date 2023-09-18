import "package:flutter/material.dart";
import "sign_up_text_field.dart";

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final Widget emaillabel = const Text("Email");
  final Widget passwordLabel = const Text("Password");
  final bool isPassword = true;
  final bool isNotPassword = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              SignUpTxtField(
                label: emaillabel,
                textType: isNotPassword,
                signupController: emailController,
              ),
              const SizedBox(
                height: 20,
              ),
              SignUpTxtField(
                label: passwordLabel,
                textType: isPassword,
                signupController: passwordController,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Sign Up"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
