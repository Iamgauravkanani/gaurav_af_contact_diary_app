import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/Globals.dart';

class Hidden_Page extends StatefulWidget {
  const Hidden_Page({Key? key}) : super(key: key);

  @override
  State<Hidden_Page> createState() => _Hidden_PageState();
}

class _Hidden_PageState extends State<Hidden_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: (Globals.hiddenContacts.isNotEmpty)
          ? ListView.builder(
              itemCount: Globals.hiddenContacts.length,
              itemBuilder: (context, i) {
                return ListTile(
                  onTap: () {
                    Navigator.of(context).pushNamed('contact_details_page',
                        arguments: Globals.hiddenContacts[i]);
                  },
                  title: Text(Globals.hiddenContacts[i].name),
                  subtitle: Text(
                      "${Globals.hiddenContacts[i].contact}\n${Globals.hiddenContacts[i].email}"),
                  trailing: IconButton(
                    onPressed: () async {
                      await launchUrl(Uri.parse(
                          "tel:+91${Globals.hiddenContacts[i].contact}"));
                    },
                    icon: const Icon(
                      CupertinoIcons.phone,
                      size: 35,
                    ),
                  ),
                );
              })
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.account_box,
                    size: 180,
                  ),
                  Text(
                    "You Have No Hidden Contacts",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
    );
  }
}
