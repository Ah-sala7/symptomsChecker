import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Sign Up")),
      body: SingleChildScrollView( // Make content scrollable
        padding: const EdgeInsets.only(left: 16,right: 16,bottom: 16,top: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch, // Stretch widgets to fill width
          children: [
            const CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage("assets/images/splash screen.jpeg"),
            ),
            const SizedBox(height: 16),
            const Text(
              "Create a New Account",
              textAlign: TextAlign.center, // Center the text
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
            TextField(
              controller: confirmPasswordController,
              decoration: const InputDecoration(
                labelText: "Confirm Password",
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                String email = emailController.text;
                String password = passwordController.text;
                String confirmPassword = confirmPasswordController.text;

                if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
                  showDialog(
                    context: context,
                    builder: (_) => const AlertDialog(
                      title: Text("Error"),
                      content: Text("Please fill all fields."),
                    ),
                  );
                  return;
                }

                if (password != confirmPassword) {
                  showDialog(
                    context: context,
                    builder: (_) => const AlertDialog(
                      title: Text("Error"),
                      content: Text("Passwords do not match."),
                    ),
                  );
                  return;
                }

                // Add your sign-up logic here.
                showDialog(
                  context: context,
                  builder: (_) => const AlertDialog(
                    title: Text("Success"),
                    content: Text("Account created successfully!"),
                  ),
                );
              },
              child: const Text("Sign Up"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Navigate back to the SignInScreen
              },
              child: const Text("Already have an account? Sign In"),
            ),
          ],
        ),
      ),
    );
  }
}
