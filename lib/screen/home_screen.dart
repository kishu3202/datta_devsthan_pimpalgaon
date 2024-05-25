import 'package:datta_devsthan_pimpalgaon/screen/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
final _formField = GlobalKey<FormState>();
int selectOption = 0;
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
bool passToggle = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialization();
  }
  void initialization() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    // ignore_for_file: avoid_print
    print('ready in 3...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 2...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 1...');
    await Future.delayed(const Duration(seconds: 1));
    print('go!');
    FlutterNativeSplash.remove();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          child: Form(
            key: _formField,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
                  child: Image.asset(
                    "asset/images/login1Image.jpeg",
                    height: 220,
                    width: 220,
                  ),
                ),
                // const SizedBox(height: 15),
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
                        "दत्त देवस्थान",
                        style: TextStyle(fontSize: 18),
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
                              "दत्त भक्त",
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: "ईमेल",
                    // errorText: validateEmail ? null : 'Invalid email format',
                    labelText: "ईमेल",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: const Icon(Icons.email),
                  ),
                  validator: (value) {},
                ),
                SizedBox(height: 30,),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: passwordController,
                  obscureText: passToggle,
                  decoration: InputDecoration(
                    hintText: "पासवर्ड",
                    labelText: "पासवर्ड",
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
                const SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
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
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>const DashboardScreen()));
                  },
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        "Log In",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
