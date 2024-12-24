import 'package:flutter/material.dart';
import 'package:symptoms/onboardingScreen.dart';
import 'package:symptoms/signupScreen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Sign In")),
      body: SingleChildScrollView( // Make content scrollable
        padding: const EdgeInsets.only(left: 16,right: 16,bottom: 16,top: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage("assets/images/splash screen.jpeg"),
            ),
            const SizedBox(height: 16),
            const Text(
              "Welcome Back!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                String email = emailController.text;
                String password = passwordController.text;

                if (email.isEmpty || password.isEmpty) {
                  showDialog(
                    context: context,
                    builder: (_) => const AlertDialog(
                      title: Text("Error"),
                      content: Text("Please fill all fields."),
                    ),
                  );
                  return;
                }

                // Add your authentication logic here.
                if (email == "elsersy@gmail.com" && password == "12345678") {
                  showDialog(
                    context: context,
                    builder: (_) => const AlertDialog(
                      title: Text("Success"),
                      content: Text("Signed in successfully!"),
                    ),

                  );
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) =>  Navbar()),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (_) => const AlertDialog(
                      title: Text("Error"),
                      content: Text("Invalid credentials."),
                    ),
                  );
                }
              },
              child: const Text("Sign In"),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SignUpScreen()),
                );
              },
              child: const Text("Don't have an account? Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}
