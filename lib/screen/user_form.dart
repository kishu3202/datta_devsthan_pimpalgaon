import 'package:flutter/material.dart';

class UserForm extends StatefulWidget {
  const UserForm({super.key});

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _havanCountController = TextEditingController();
  List<String> _selectedTabs = [];


  void _saveData() {
    // Validate tab selection before saving data
    _validateSelection();

    // Proceed with saving the data only if tabs are selected
    if (_selectedTabs.isNotEmpty && _formKey.currentState!.validate()) {
      // Collect data from the form fields
      final data = {
        "नाव": _nameController.text,
        "पत्ता": _addressController.text,
        "फोन नंबर": _phoneController.text,
        "हवन नंबर": _havanCountController.text,
        "होणारा त्रास": _selectedTabs,
      };

      // Printing data to the console
      print("Data Saved: $data");
      // Displaying data in a dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('सेव्ह केलेला डेटा'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: data.entries.map((entry) {
                return Text("${entry.key}: ${entry.value}");
              }).toList(),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text('बंद करा'),
              ),
            ],
          );
        },
      );
    }
  }

  void _toggleTabSelection(String tab) {
    setState(() {
      if (_selectedTabs.contains(tab)) {
        // If the tab is already selected, deselect it
        _selectedTabs.remove(tab);
      } else {
        // If the tab is not selected, select it
        _selectedTabs.add(tab);
      }
    });
  }
  // Function to check if any tab is selected
  // void _validateSelection() {
  //   if (_selectedTabs.isEmpty) {
  //     // If no tab is selected, show a validation message
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('कृपया एक पर्याय निवडा!')),
  //     );
  //   } else {
  //     // If tab(s) are selected, proceed with your logic (e.g., saving data)
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('निवडलेले पर्याय: ${_selectedTabs.join(', ')}')),
  //     );
  //   }
  // }

  void _validateSelection() {
    if (_selectedTabs.isEmpty) {
      // If no tab is selected, show a validation message and prevent saving
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('कृपया एक पर्याय निवडा!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('हवन अर्ज',style: TextStyle(color: Colors.white,fontSize: 18)), centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name Field
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'नाव',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0), // Add border radius
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(
                        color: Colors.greenAccent, // Customize the border color when focused
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(
                        color: Colors.grey, // Customize the border color when not focused
                        width: 1.0,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'कृपया नाव प्रविष्ट करा';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 10),

                TextFormField(
                  controller: _addressController,
                  decoration: InputDecoration(
                    labelText: 'पत्ता',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0), // Add border radius
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(
                        color: Colors.greenAccent, // Border color when focused
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(
                        color: Colors.grey, // Border color when enabled
                        width: 1.0,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'कृपया पत्ता प्रविष्ट करा';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),

// Phone No Field
                TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    labelText: 'फोन नंबर',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(
                        color: Colors.greenAccent,
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'कृपया फोन नंबर प्रविष्ट करा';
                    } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                      return 'कृपया एक वैध फोन नंबर प्रविष्ट करा';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),

// Havan Count Field
                TextFormField(
                  controller: _havanCountController,
                  decoration: InputDecoration(
                    labelText: 'हवन नंबर',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(
                        color: Colors.greenAccent,
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'कृपया हवन संख्या प्रविष्ट करा';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                // Trass Tabs
                Text(
                  "होणारा त्रास:",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: ["क्रिया","वाईट शक्ति","पित्र", "दैविक बाधा", "वास्तुदोष"].map((tab) {
                    bool isSelected = _selectedTabs.contains(tab); // Check if the tab is selected
                    return Expanded( // Ensures equal width for all tabs
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            // _selectedTab = tab;
                            _toggleTabSelection(tab); // Toggle selection when clicked
                          });
                        },
                        child: Container(
                          height: 50.0, // Fixed height for tabs
                          margin: EdgeInsets.symmetric(horizontal: 8.0), // Spacing between tabs
                          decoration: BoxDecoration(
                            color: isSelected ? Colors.greenAccent : Colors.grey[300],
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          alignment: Alignment.center, // Center text within the tab
                          child: Text(
                            tab,
                            style: TextStyle(
                              fontSize: 14,
                              color: isSelected ? Colors.white : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 30),

                // Save Button
                Center(
                  child: ElevatedButton(
                    onPressed: _saveData,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orangeAccent,
                      foregroundColor: Colors.white,
                      padding:
                      EdgeInsets.symmetric(horizontal: 200.0, vertical: 15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        side: BorderSide(color: Colors.orangeAccent, width: 2.0),
                      ),
                    ),
                    child: Text(
                      "जतन करा",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
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



