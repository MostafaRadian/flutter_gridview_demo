import 'package:flutter/material.dart';

import 'form_field_component.dart';
import 'home_page.dart';
import 'login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFAFF),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
            children: [
              const SizedBox(height: 20),
              const Text(
                'Sign Up',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Create your account',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              MyTextFormField(
                label: 'Username',
                icon: Icons.person_outline,
                controller: usernameController,
              ),
              MyTextFormField(
                label: 'Email',
                icon: Icons.mail_outline,
                controller: emailController,
                validator: (value) => value == null || !value.contains('@')
                    ? 'Enter a valid email'
                    : null,
              ),
              MyTextFormField(
                label: 'Password',
                icon: Icons.lock_outline,
                controller: passwordController,
                obscureText: true,
              ),
              MyTextFormField(
                label: 'Confirm Password',
                icon: Icons.lock_outline,
                controller: confirmPasswordController,
                obscureText: true,
                validator: (value) => value != passwordController.text
                    ? 'Passwords do not match'
                    : null,
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF9215B5),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(15),
                ),
                child: const Text('Sign Up', style: TextStyle(fontSize: 20)),
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(padding: EdgeInsets.all(10), child: Text('Or')),
                  Expanded(child: Divider()),
                ],
              ),
              OutlinedButton(
                onPressed: () {},
                child: const Text('Sign In with Google'),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account?'),
                  TextButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    ),
                    child: const Text('Login'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
