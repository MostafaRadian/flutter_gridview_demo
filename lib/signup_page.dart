import 'package:flutter/material.dart';
import 'home_page.dart';
import 'login_page.dart';

const purple = Color(0xFF9215B5);
const ink = Color(0xFF251033);
const palePurple = Color(0xFFF1DDF8);

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();
  bool hidePassword = true;

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFAFF),
      body: SafeArea(child: Center(child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
        child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 440), child: Form(key: formKey, child: Column(children: [
          const SizedBox(height: 18),
          const Text('Sign Up', style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold, color: ink)),
          const SizedBox(height: 8),
          const Text('Create your account', style: TextStyle(fontSize: 18, color: ink)),
          const SizedBox(height: 28),
          _field('Username', Icons.person_outline, usernameController),
          _field('Email', Icons.mail_outline, emailController, validator: (value) => value == null || !value.contains('@') ? 'Enter a valid email' : null),
          _field('Password', Icons.lock_outline, passwordController, obscure: hidePassword, suffix: _visibilityButton()),
          _field('Confirm Password', Icons.lock_outline, confirmController, obscure: hidePassword, suffix: _visibilityButton(), validator: (value) => value != passwordController.text ? 'Passwords do not match' : null),
          const SizedBox(height: 14),
          _button('Sign Up', () {
            if (formKey.currentState!.validate()) {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomePage()));
            }
          }),
          const SizedBox(height: 22),
          const Row(children: [Expanded(child: Divider()), Padding(padding: EdgeInsets.symmetric(horizontal: 14), child: Text('Or')), Expanded(child: Divider())]),
          const SizedBox(height: 18),
          OutlinedButton.icon(
            onPressed: () => _message('Google sign-in is not configured yet'),
            icon: const Icon(Icons.g_mobiledata, size: 28),
            label: const Text('Sign In with Google'),
            style: OutlinedButton.styleFrom(foregroundColor: ink, side: const BorderSide(color: purple), minimumSize: const Size(double.infinity, 54), shape: const StadiumBorder()),
          ),
          const SizedBox(height: 24),
          Wrap(alignment: WrapAlignment.center, children: [const Text('Already have an account? ', style: TextStyle(color: ink)), TextButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginPage())), child: const Text('Login', style: TextStyle(color: purple, fontWeight: FontWeight.bold)))]),
        ]))),
      ))),
    );
  }

  Widget _field(String label, IconData icon, TextEditingController controller, {bool obscure = false, Widget? suffix, FormFieldValidator<String>? validator}) {
    return Padding(padding: const EdgeInsets.only(bottom: 12), child: TextFormField(
      controller: controller,
      obscureText: obscure,
      validator: validator ?? (value) => value == null || value.isEmpty ? '$label must not be empty' : null,
      decoration: InputDecoration(prefixIcon: Icon(icon, color: ink), suffixIcon: suffix, hintText: label, filled: true, fillColor: palePurple, border: OutlineInputBorder(borderRadius: BorderRadius.circular(32), borderSide: BorderSide.none), contentPadding: const EdgeInsets.symmetric(vertical: 18)),
    ));
  }

  Widget _visibilityButton() => IconButton(onPressed: () => setState(() => hidePassword = !hidePassword), icon: Icon(hidePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined, color: ink));
  Widget _button(String label, VoidCallback action) => SizedBox(width: double.infinity, height: 54, child: ElevatedButton(onPressed: action, style: ElevatedButton.styleFrom(backgroundColor: purple, foregroundColor: Colors.white, shape: const StadiumBorder(), elevation: 5), child: Text(label, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold))));
  void _message(String text) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
}
