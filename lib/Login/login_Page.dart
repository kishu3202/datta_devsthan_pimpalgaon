import 'package:datta_devsthan_pimpalgaon/Login/sign_up.dart';
import 'package:flutter/material.dart';

import 'forget_password.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  int selectOption = 0; // 0: Nothing selected, 1: Admin, 2: user
  bool passToggle = true;

  void _login() {
    if (_formKey.currentState!.validate()) {
      // Perform login logic here
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login Successful')),
      );
    }
  }

  void _forgotPassword() {
    // Navigate to forgot password screen or logic
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Forgot Password?')),
    );
  }

  void _signUp() {
    // Navigate to sign-up screen or logic
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Sign Up Clicked')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo Image
              Image.asset(
                'asset/icon/iconImage.jpeg', // Replace with your logo asset path
                height: 100,
                width: 100,
              ),
              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Radio<int>(
                      value: 1,
                      groupValue: selectOption,
                      onChanged: (value) {
                        setState(() {
                          selectOption = value!;
                        });
                      },
                    ),
                    const Text(
                      "Admin",
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Radio(
                            value: 2,
                            groupValue: selectOption,
                            onChanged: (value) {
                              setState(() {
                                selectOption = value!;
                              });
                            },
                          ),
                          const Text(
                            "User",
                            style: TextStyle(fontSize: 16),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Form Fields
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    // Email Text Field
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter your email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        prefixIcon: const Icon(Icons.email),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),

                    // Password Text Field
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _passwordController,
                      obscureText: passToggle,
                      decoration: InputDecoration(
                        hintText: "Password",

                        // labelText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        prefixIcon: const Icon(Icons.lock),

                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              passToggle = !passToggle;
                            });
                          },
                          child: Icon(passToggle
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return 'Please enter Password';

                        return null;
                      },
                    ),
                    const SizedBox(height: 10),

                    // Forgot Password Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ResetPasswordScreen()),
                            );
                          },
                          child: const Text(
                            "Forget Password",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Login Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _login,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: Colors.orange,
                        ),
                        child: const Text(
                          'Log In',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),

                    // Sign Up Button
                    // if (selectOption == 2)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Create a new Account !!",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.black87,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const RegistrationPage()));
                              });
                            },
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
                                color: Colors.orangeAccent,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
