import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:mcamajor/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usertypeController = TextEditingController();
  List<String> userTypes = ['Pharmacist', 'User']; // List of user types
  String? selectedUserType; // Variable to store the selected user type

  Future<void> signup() async {
    try {
      await supabase.auth.signUp(
          password: passwordController.text.trim(),
          email: emailController.text.trim(),
          data: {'usertype': usertypeController.text.trim()});

      if (!mounted) return;
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: ((context) => const LoginScreen())));
    } on AuthException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 400,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: -45,
                    height: 400,
                    width: width,
                    child: FadeInUp(
                      duration: const Duration(seconds: 1),
                      child: Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/background.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    height: 400,
                    width: width + 20,
                    child: FadeInUp(
                      duration: const Duration(milliseconds: 1000),
                      child: Container(
                        decoration: const BoxDecoration(
                            // image: DecorationImage(
                            //   image: AssetImage('assets/images/background-2.png'),
                            //   fit: BoxFit.fill,
                            // ),
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.all(12),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.all(12),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.all(12),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'User Type',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    value: selectedUserType,
                    items: userTypes.map((String userType) {
                      return DropdownMenuItem<String>(
                        value: userType,
                        child: Text(userType),
                      );
                    }).toList(),
                    onChanged: (value) =>
                        setState(() => selectedUserType = value),
                    hint: const Text('Select User Type'),
                  ),

                  const SizedBox(height: 32.0),
                  FadeInUp(
                    duration: const Duration(milliseconds: 1700),
                    child: ElevatedButton(
                      onPressed: () async {
                        signup();
                      },
                      child: const Text('Sign Up'),
                    ),
                  ),
                  // "Sign up with" text remains the same
                  FadeInUp(
                    duration: const Duration(milliseconds: 1800),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      child: Text(
                        'Sign up with',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                  // Icons Row with the new format
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FadeInUp(
                        duration: const Duration(milliseconds: 2000),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: IconButton(
                            onPressed: () {
                              // Implement sign-up with Google
                            },
                            icon: SizedBox(
                              width: 40,
                              height: 40,
                              child: Image.asset(
                                  'assets/icons/search.png'), // Assuming this is Google
                            ),
                          ),
                        ),
                      ),
                      FadeInUp(
                        duration: const Duration(milliseconds: 2000),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: IconButton(
                            onPressed: () {
                              // Implement sign-up with Facebook
                            },
                            icon: SizedBox(
                              width: 40,
                              height: 40,
                              child: Image.asset(
                                  'assets/icons/facebook.png'), // Assuming this is Facebook
                            ),
                          ),
                        ),
                      ),
                      FadeInUp(
                        duration: const Duration(milliseconds: 2100),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: IconButton(
                            onPressed: () {
                              // Implement sign-up with Twitter
                            },
                            icon: SizedBox(
                              width: 40,
                              height: 40,
                              child: Image.asset(
                                  'assets/icons/twitter.png'), // Assuming this is Twitter
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // "Already have an account? Login" text remains the same
                  FadeInUp(
                    duration: const Duration(milliseconds: 2200),
                    child: TextButton(
                      onPressed: () {
                        // Navigate back to the login screen
                        Navigator.pop(context);
                      },
                      child: const Text('Already have an account? Login'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
