import 'package:flutter/material.dart';

class Add_Contact_Page extends StatefulWidget {
  const Add_Contact_Page({Key? key}) : super(key: key);

  @override
  State<Add_Contact_Page> createState() => _Add_Contact_PageState();
}

class _Add_Contact_PageState extends State<Add_Contact_Page> {
  int initialIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Contact Page"),
        centerTitle: true,
      ),
      body: Stepper(
        type: StepperType.horizontal,
        controlsBuilder: (context, controlObject) {
          return Column(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text("Next"),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("Cancel"),
              ),
            ],
          );
        },
        margin: EdgeInsets.all(100),
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
            subtitle: Text("Pick Image Here"),
            title: Text("Pick Your Image"),
            isActive: (initialIndex == 0) ? true : false,
            content: CircleAvatar(
              radius: 60,
              child: Text("Pick Image"),
            ),
          ),
          Step(
            title: Text("Enter Your Details"),
            isActive: (initialIndex == 1) ? true : false,
            content: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Your First Name"),
            ),
          ),
          Step(
            title: Text("Enter Your Contact Info"),
            isActive: (initialIndex == 2) ? true : false,
            content: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Enter Your Number"),
            ),
          ),
          Step(
            title: Text("Enter Your Email"),
            isActive: (initialIndex == 3) ? true : false,
            content: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Enter Your Email"),
            ),
          ),
        ],
      ),
    );
  }
}
