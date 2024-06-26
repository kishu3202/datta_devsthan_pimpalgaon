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
  const HavanBooking({super.key, required this.date, required this.slots});
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Form'),
        actions: [
          TextButton(
            child:  Text(
              'Book now for ${DateFormat('dd/MMM/yyyy').format(widget.date)}',
              style: const TextStyle(color: Colors.black),
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

                  "slot": _slot,
                  "schedule":widget.date.year,
                  "day": int.parse(DateFormat('D').format(widget.date)),
                "userId": FirebaseAuth.instance.currentUser!.uid
                };

               await db
                    .collection("appointments")
                    .doc()
                    .set(docData)
                    .onError((e, _) => print("Error writing document: $e")).then((value) async{

                 final scheduleRef = db.collection("schedules").doc('${widget.date.year}');
                  scheduleRef.update({
                   "${int.parse(DateFormat('D').format(widget.date))}" : FieldValue.arrayRemove([_slot]),
                 });
                 Navigator.of(context).pop();
                 Navigator.of(context).pop();

               });




              }
            },
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: Scrollbar(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: AutofillGroup(
              child: Column(
                children: [
                  ...[
                    //const Text('This sample demonstrates autofill. '),
                    TextFormField(
                      controller: _nameController,
                      autofocus: true,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        hintText: 'Your name',
                        labelText: 'First Name',
                      ),
                      autofillHints: const [AutofillHints.givenName],
                      validator: (String? value) {
                        if (value == '') {
                          return 'Please enter name';
                        }
                        return null;
                      },
                    ),

                    TextFormField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        hintText: '(123) 456-7890',
                        labelText: 'Telephone',
                      ),
                      autofillHints: const [AutofillHints.telephoneNumber],
                      validator: (String? value) {
                        if (value == '') {
                          return 'Please enter phone number';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _addressController,
                      keyboardType: TextInputType.streetAddress,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        hintText: '123 4th Ave',
                        labelText: 'Address',
                      ),
                      autofillHints: [AutofillHints.streetAddressLine1],
                      validator: (String? value) {
                        if (value == '') {
                          return 'Please enter address';
                        }
                        return null;
                      },
                    ),
                    // DropdownButtonFormField<String>(
                    //    value: _date,
                    //   hint: const Text("Select date"),
                    //
                    //   items: [
                    //     DropdownMenuItem(
                    //         value: DateFormat('yyyy-MM-dd').format(DateTime.now()),
                    //         child: Text(
                    //             DateFormat('yyyy-MM-dd').format(DateTime.now()))),
                    //     DropdownMenuItem(
                    //       value: DateFormat('yyyy-MM-dd').format(
                    //           DateTime.now().add(const Duration(days: 1))),
                    //       child: Text(DateFormat('yyyy-MM-dd').format(
                    //           DateTime.now().add(const Duration(days: 1)))),
                    //     ),
                    //     DropdownMenuItem(
                    //         value: DateFormat('yyyy-MM-dd').format(
                    //             DateTime.now().add(const Duration(days: 2))),
                    //         child: Text(DateFormat('yyyy-MM-dd').format(
                    //             DateTime.now().add(const Duration(days: 2)))))
                    //   ],
                    //   onChanged: (String? value) {
                    //     setState(() {
                    //       _date = value;
                    //     });
                    //   },
                    //   validator: (String? value) {
                    //     if (value == null) {
                    //       return 'Please select date';
                    //     }
                    //     return null;
                    //   },
                    // ),
                    //

                    DropdownButtonFormField<int>(
                      value: _slot,
                      hint: const Text("Select slot"),

                      items:  [
                        for (final slot in widget.slots)
                        DropdownMenuItem(value: slot, child: Text('$slot')),

                      ],
                      onChanged: (int? value) {
                        setState(() {
                          _slot = value;
                        });
                      },
                      validator: (int? value) {
                        if (value == null) {
                          return 'Please select slot';
                        }
                        return null;
                      },
                    )
                    // const TextField(
                    //   keyboardType: TextInputType.number,
                    //   textInputAction: TextInputAction.next,
                    //   decoration: InputDecoration(
                    //     hintText: '12345',
                    //     labelText: 'Postal Code',
                    //   ),
                    //   autofillHints: [AutofillHints.postalCode],
                    // ),
                    // const TextField(
                    //   textInputAction: TextInputAction.next,
                    //   decoration: InputDecoration(
                    //     hintText: 'United States',
                    //     labelText: 'Country',
                    //   ),
                    //   autofillHints: [AutofillHints.countryName],
                    // ),
                    // const TextField(
                    //   keyboardType: TextInputType.number,
                    //   decoration: InputDecoration(
                    //     hintText: '1',
                    //     labelText: 'Country Code',
                    //   ),
                    //   autofillHints: [AutofillHints.countryCode],
                    // ),
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
    );
  }
}