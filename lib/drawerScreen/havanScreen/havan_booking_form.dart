// Copyright 2020, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Demonstrates how to use autofill hints. The full list of hints is here:
// https://github.com/flutter/engine/blob/master/lib/web_ui/lib/src/engine/text_editing/autofill_hint.dart
class HavanBooking extends StatefulWidget {
  const HavanBooking({super.key, required this.date, required this.slots, required String dayOfYear});
  final DateTime date;
  final List slots;

  @override
  State<HavanBooking> createState() => _HavanBookingState();
}

class _HavanBookingState extends State<HavanBooking> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  String? _date ;
  int? _slot;
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final availableSlots=[];
    final currentHour = DateFormat('H').format(DateTime.now());
    for(final slot in widget.slots){
      if(slot>=int.parse(currentHour)){
        availableSlots.add(slot);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Form', style: TextStyle(color: Colors.white, fontSize: 18)),
        centerTitle: true,
        actions: [

        ],
      ),
      body: Column(
        children: [
          Form(
            key: _formKey,
            child: Scrollbar(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: AutofillGroup(
                  child: Column(
                    children: [
                      ...[
                        //const Text('This sample demonstrates autofill. '),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white, // Background color
                            borderRadius: BorderRadius.circular(12), // Rounded corners
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3), // Shadow color with transparency
                                blurRadius: 6, // Blur radius for shadow
                                offset: const Offset(0, 3), // Offset for shadow
                              ),
                            ],
                          ),
                          child: TextFormField(
                            controller: _nameController,
                            autofocus: true,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12), // Padding inside the field
                              hintText: 'नाव',
                              labelText: 'नाव',
                              labelStyle: const TextStyle(color: Colors.grey), // Label text style
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12), // Match border radius with the container
                                borderSide: BorderSide.none, // Remove default border
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12), // Rounded border on focus
                                borderSide: BorderSide(color: Colors.orangeAccent, width: 2), // Border style on focus
                              ),
                            ),
                            autofillHints: const [AutofillHints.givenName],
                            validator: (String? value) {
                              if (value == '') {
                                return 'कृपया नाव प्रविष्ट करा';
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white, // Background color
                            borderRadius: BorderRadius.circular(12), // Rounded corners
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3), // Shadow color with transparency
                                blurRadius: 6, // Blur radius for shadow
                                offset: const Offset(0, 3), // Offset for shadow
                              ),
                            ],
                          ),
                          child: TextFormField(
                            controller: _phoneController,
                            keyboardType: TextInputType.phone,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12), // Padding inside the field
                              hintText: '(123) 456-7890',
                              labelText: 'फोन नंबर',
                              labelStyle: const TextStyle(color: Colors.grey), // Label text style
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12), // Match border radius with the container
                                borderSide: BorderSide.none, // Remove default border
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12), // Rounded border on focus
                                borderSide: BorderSide(color: Colors.green.shade400, width: 2), // Border style on focus
                              ),
                            ),
                            autofillHints: const [AutofillHints.telephoneNumber],
                            validator: (String? value) {
                              if (value == '') {
                                return 'कृपया फोन नंबर प्रविष्ट करा';
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white, // Background color
                            borderRadius: BorderRadius.circular(12), // Rounded corners
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3), // Shadow color with transparency
                                blurRadius: 6, // Blur radius for shadow
                                offset: const Offset(0, 3), // Offset for shadow
                              ),
                            ],
                          ),
                          child: TextFormField(
                            controller: _addressController,
                            keyboardType: TextInputType.streetAddress,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12), // Padding inside the field
                              hintText: 'पत्ता',
                              labelText: 'पत्ता',
                              labelStyle: const TextStyle(color: Colors.grey), // Label text style
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12), // Rounded border
                                borderSide: BorderSide.none, // Remove default border
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12), // Rounded border on focus
                                borderSide: BorderSide(color: Colors.orangeAccent, width: 2), // Blue border when focused
                              ),
                            ),
                            autofillHints: const [AutofillHints.streetAddressLine1],
                            validator: (String? value) {
                              if (value == '') {
                                return 'कृपया पत्ता प्रविष्ट करा';
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white, // Background color for the dropdown
                            borderRadius: BorderRadius.circular(12), // Rounded corners
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3), // Shadow color with transparency
                                blurRadius: 6, // Blur radius for shadow
                                offset: const Offset(0, 3), // Offset for shadow
                              ),
                            ],
                          ),
                          child: DropdownButtonFormField<int>(
                            value: _slot,
                            hint: const Text(
                              "Select slot",
                              style: TextStyle(color: Colors.grey), // Hint text style
                            ),
                            items: [
                              for (final slot in availableSlots)
                                DropdownMenuItem(
                                  value: slot,
                                  child: Text(
                                    slot < 12
                                        ? "$slot am"
                                        : slot == 12
                                        ? "$slot noon"
                                        : "${slot - 12} pm",
                                  ),
                                ),
                            ],
                            onChanged: (int? value) {
                              setState(() {
                                _slot = value;
                              });
                            },
                            validator: (int? value) {
                              if (value == null) {
                                return 'कृपया स्लॉट निवडा';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12), // Padding for dropdown content
                              filled: true,
                              fillColor: Colors.white, // Background color for dropdown field
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12), // Rounded border
                                borderSide: BorderSide.none, // Remove default border
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.orangeAccent, width: 2), // Blue border on focus
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(color: Colors.red, width: 2), // Red border on error
                              ),
                              hintStyle: const TextStyle(color: Colors.grey), // Hint style
                            ),
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.grey, // Icon color
                            ),
                            dropdownColor: Colors.white, // Background color of the dropdown menu
                            style: const TextStyle(color: Colors.black, fontSize: 16), // Style for dropdown text
                          ),
                        ),


                      ].expand(
                        (widget) => [
                          widget,
                          const SizedBox(
                            height: 24,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 50,
              width: MediaQuery.sizeOf(context).width,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.orange, // Button background color
                  padding: EdgeInsets.all(16.0), // Button padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0), // Rounded corners
                  ),
                ),
                onPressed: () async{
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    final docData = {
                      "name": _nameController.text,
                      "telephone": _phoneController.text,
                      "address": _addressController.text,
                      "bookingDate": Timestamp.fromDate(widget.date),
                      "createdOn": FieldValue.serverTimestamp(),
                      "status": "Booked",
                      "slot": _slot,
                      "schedule":widget.date.year,
                      "day": int.parse(DateFormat('D').format(widget.date)),
                      "userId": FirebaseAuth.instance.currentUser!.uid
                    };

                     db
                        .collection('users/${FirebaseAuth.instance.currentUser!.uid}/appointments')
                        .doc()
                        .set(docData)
                        .onError((e, _) => print("Error writing document: $e")).then((value) async{

                      final scheduleRef = db.collection("schedules").doc('${widget.date.year}');
                       scheduleRef.update({
                         DateFormat('D').format(widget.date) : FieldValue.arrayRemove([_slot]),
                      });

                      final bookedScheduleRef = db
                          .collection("schedules_booked")
                          .doc('${widget.date.year}');
                       bookedScheduleRef.set({
                        DateFormat('D').format(widget.date): FieldValue.arrayUnion([_slot]),
                      },SetOptions(merge: true));
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    });
                  }
                },
                child:  Text(
                  '${DateFormat('dd/MMM/yyyy').format(widget.date)} साठी आता बुक करा',
                  style: const TextStyle(color: Colors.white,fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
