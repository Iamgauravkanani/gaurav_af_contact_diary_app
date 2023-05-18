import 'package:af_6/Models/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../utils/Globals.dart';

class Contact_Details_page extends StatefulWidget {
  const Contact_Details_page({Key? key}) : super(key: key);

  @override
  State<Contact_Details_page> createState() => _Contact_Details_pageState();
}

class _Contact_Details_pageState extends State<Contact_Details_page> {
  @override
  Widget build(BuildContext context) {
    Contact contact = ModalRoute.of(context)!.settings.arguments as Contact;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Detail"),
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<Globals>(context, listen: false)
                    .removeContacts(contact);
                Provider.of<Globals>(context, listen: false)
                    .addContacts(contact);
              },
              icon: Icon(Icons.lock))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 100,
          ),
          Text(contact.name),
          const SizedBox(
            height: 10,
          ),
          Text(contact.email),
          const SizedBox(
            height: 10,
          ),
          Text(contact.contact),
          const Divider(
            thickness: 5,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                onPressed: () async {
                  await launchUrl(Uri.parse("tel:+91${contact.contact}"));
                },
                child: const Icon(Icons.phone),
              ),
              FloatingActionButton(
                onPressed: () async {
                  await launchUrl(
                      Uri.parse("sms:${contact.name},${contact.contact}"));
                },
                child: const Icon(Icons.message),
              ),
              FloatingActionButton(
                onPressed: () async {
                  await launchUrl(
                      Uri.parse("mailto:${contact.email}?subject:Hello "));
                },
                child: const Icon(Icons.email),
              ),
              FloatingActionButton(
                onPressed: () async {
                  await Share.share("${contact.name},${contact.contact}");
                },
                child: const Icon(Icons.share),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            thickness: 5,
          ),
        ],
      ),
    );
  }
}
