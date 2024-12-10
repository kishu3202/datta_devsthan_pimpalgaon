import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserUpdatePage extends StatefulWidget {
  const UserUpdatePage({Key? key, this.address, this.phone}) : super(key: key);
  final String? address;
  final String? phone;

  @override
  State<UserUpdatePage> createState() => _UserUpdatePageState();
}

class _UserUpdatePageState extends State<UserUpdatePage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  List<String> _selectedTabs = [];


  @override
  void initState(){
    super.initState();
    _addressController.text=widget.address??'';
    _phoneController.text=widget.phone??'';
  }

  void _toggleTabSelection(String tab) {
    setState(() {
      if (_selectedTabs.contains(tab)) {
        _selectedTabs.remove(tab); // Deselect the tab if already selected
      } else {
        _selectedTabs.add(tab); // Add the tab to the selection
      }
    });
  }

  void _update() async{
    if (_formKey.currentState!.validate()) {
      // Save the form and selected tabs
      final formData = {
      //  "name": _nameController.text,
        "address": _addressController.text,
        "phone": _phoneController.text,
       // "email": _emailController.text,
       // "password": _passwordController.text,
       // "cases": _selectedTabs,
      };

      print("Registration Data: $formData"); // Debugging or save data to backend

      try {


        //print(credential.user!.uid);
        await FirebaseFirestore.instance.collection("trust_users").doc(FirebaseAuth.instance.currentUser!.uid).set(formData, SetOptions(merge: true));
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Updated Successfully!')),
        );

        Navigator.of(context).pop();
        Navigator.of(context).pop();

      }
      // on FirebaseAuthException catch (e) {
      //   if (e.code == 'weak-password') {
      //     ScaffoldMessenger.of(context).showSnackBar(
      //       const SnackBar(content: Text('The password provided is too weak!!')),
      //     );
      //     print('');
      //   } else if (e.code == 'email-already-in-use') {
      //     print('The account already exists for that email.');
      //     ScaffoldMessenger.of(context).showSnackBar(
      //       const SnackBar(content: Text('The account already exists for that email!!!')),
      //     );
      //   }
      // }
      catch (e) {
        print(e);
      }



      // Optionally, clear the form after successful registration
      // _formKey.currentState!.reset();
      // setState(() {
      //   _selectedTabs.clear();
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text("Edit Details"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Name Field
              // TextFormField(
              //   controller: _nameController,
              //   decoration: InputDecoration(
              //     labelText: "Name",
              //     hintText: "Enter your name",
              //     prefixIcon: const Icon(Icons.person),
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //     filled: true,
              //     fillColor: Colors.white,
              //   ),
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return "Please enter your name";
              //     }
              //     return null;
              //   },
              // ),
              // const SizedBox(height: 20),

              // Address Field
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(
                  labelText: "Address",
                  hintText: "Enter your address",
                  prefixIcon: const Icon(Icons.home),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your address";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Phone Number Field
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: "Phone Number",
                  hintText: "Enter your phone number",
                  prefixIcon: const Icon(Icons.phone),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your phone number";
                  }
                  if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                    return "Enter a valid phone number (10 digits)";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              //
              // // Email Field
              // TextFormField(
              //   controller: _emailController,
              //   keyboardType: TextInputType.emailAddress,
              //   decoration: InputDecoration(
              //     labelText: "Email",
              //     hintText: "Enter your email",
              //     prefixIcon: const Icon(Icons.email),
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //     filled: true,
              //     fillColor: Colors.white,
              //   ),
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return "Please enter your email";
              //     }
              //     if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
              //       return "Enter a valid email address";
              //     }
              //     return null;
              //   },
              // ),
              // const SizedBox(height: 20),
              //
              // // Password Field
              // TextFormField(
              //   controller: _passwordController,
              //   obscureText: true,
              //   decoration: InputDecoration(
              //     labelText: "Password",
              //     hintText: "Enter your password",
              //     prefixIcon: const Icon(Icons.lock),
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //     filled: true,
              //     fillColor: Colors.white,
              //   ),
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return "Please enter your password";
              //     }
              //     if (value.length < 6) {
              //       return "Password must be at least 6 characters";
              //     }
              //     return null;
              //   },
              // ),
              //
              // const SizedBox(height: 20),
              //
              // // Tabs Selection
              // Card(
              //   elevation: 4.0,
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(12.0),
              //     // side: BorderSide(color: Colors.black87, width: 2.0),
              //   )  ,
              //   margin: const EdgeInsets.all(6.0),
              //   child: Padding(
              //     padding: const EdgeInsets.all(6.0),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         const Text(
              //           "होणारा त्रास:",
              //           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              //         ),
              //         const SizedBox(height: 10),
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceAround,
              //           children: ["क्रिया", "वाईट शक्ति", "पित्र", "दैविक बाधा", "वास्तुदोष"].map((tab) {
              //             bool isSelected = _selectedTabs.contains(tab);
              //             return Expanded(
              //               child: GestureDetector(
              //                 onTap: () => _toggleTabSelection(tab),
              //                 child: Container(
              //                   height: 50.0,
              //                   margin: const EdgeInsets.symmetric(horizontal: 8.0),
              //                   decoration: BoxDecoration(
              //                     color: isSelected ? Colors.greenAccent : Colors.grey[300],
              //                     borderRadius: BorderRadius.circular(8.0),
              //                   ),
              //                   alignment: Alignment.center,
              //                   child: Text(
              //                     tab,
              //                     style: TextStyle(
              //                       fontSize: 14,
              //                       color: isSelected ? Colors.white : Colors.black,
              //                       fontWeight: FontWeight.bold,
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //             );
              //           }).toList(),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              //
              // const SizedBox(height: 30),

              // Sign Up Button
              ElevatedButton(
                onPressed: _update,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Colors.orange,
                ),
                child: const Text(
                  "Update",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              // const SizedBox(height: 10),
              // Center(child: Text('Or')),
              // const SizedBox(height: 10),
              // InkWell(
              //   onTap: (){
              //     Navigator.of(context).pop();
              //   },
              //
              //   child: Center(
              //     child: const Text(
              //       "Login",
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
