import 'package:af_6/Models/contact_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/Globals.dart';

class Add_Contact_Page extends StatefulWidget {
  const Add_Contact_Page({Key? key}) : super(key: key);

  @override
  State<Add_Contact_Page> createState() => _Add_Contact_PageState();
}

class _Add_Contact_PageState extends State<Add_Contact_Page> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController contact = TextEditingController();
  int initialIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Contact Page"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                Globals.allContacts.add(
                  Contact(
                    name: name.text,
                    email: email.text,
                    contact: contact.text,
                  ),
                );
                await Navigator.of(context)
                    .pushNamedAndRemoveUntil('Home_Page', (route) => false);
                setState(() {});
              },
              icon: const Icon(CupertinoIcons.checkmark_seal))
        ],
      ),
      body: Stepper(
        type: StepperType.vertical,
        // controlsBuilder: (context, controlObject) {
        //   return Column(
        //     children: [
        //       ElevatedButton(
        //         onPressed: () {},
        //         child: Text("Next"),
        //       ),
        //       ElevatedButton(
        //         onPressed: () {},
        //         child: Text("Cancel"),
        //       ),
        //     ],
        //   );
        // },
        // margin: EdgeInsets.all(100),
        onStepTapped: (val) {
          setState(() {
            initialIndex = val;
          });
        },
        currentStep: initialIndex,
        onStepContinue: () {
          setState(() {
            if (initialIndex < 3) {
              initialIndex++;
            }
          });
        },
        onStepCancel: () {
          setState(() {
            if (initialIndex > 0) {
              initialIndex--;
            }
          });
        },
        steps: [
          Step(
            state: StepState.editing,
            subtitle: const Text("Pick Image Here"),
            title: const Text("Pick Your Image"),
            isActive: (initialIndex == 0) ? true : false,
            content: const CircleAvatar(
              radius: 60,
              child: Text("Pick Image"),
            ),
          ),
          Step(
            title: const Text("Enter Your Name"),
            isActive: (initialIndex == 1) ? true : false,
            content: TextFormField(
              controller: name,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  hintText: "Enter Your name"),
            ),
          ),
          Step(
            title: const Text("Enter Your Contact Number"),
            isActive: (initialIndex == 2) ? true : false,
            content: TextFormField(
              controller: contact,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  hintText: "Enter Your Number"),
            ),
          ),
          Step(
            title: const Text("Enter Your Email"),
            isActive: (initialIndex == 3) ? true : false,
            content: TextFormField(
              controller: email,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  hintText: "Enter Your Email"),
            ),
          ),
        ],
      ),
    );
  }
}
