import 'package:af_6/Provider/counter_provider.dart';
import 'package:af_6/Provider/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/Globals.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<ThemeProvider>(context, listen: false)
                    .changeTheme();
              },
              icon: const Icon(Icons.wb_sunny_outlined))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('add_contact_page');
          // Provider.of<CounterProvider>(context, listen: false)
          //     .incrementCounter();
        },
        child: const Icon(Icons.add),
      ),
      body: (Globals.allContacts.isNotEmpty)
          ? ListView.builder(
              itemCount: Globals.allContacts.length,
              itemBuilder: (context, i) {
                return ListTile(
                  onTap: () {
                    Navigator.of(context).pushNamed('contact_details_page',
                        arguments: Globals.allContacts[i]);
                  },
                  title: Text(Globals.allContacts[i].name),
                  subtitle: Text(
                      "${Globals.allContacts[i].contact}\n${Globals.allContacts[i].email}"),
                  trailing: IconButton(
                    onPressed: () async {
                      await launchUrl(Uri.parse(
                          "tel:+91${Globals.allContacts[i].contact}"));
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
                    "You Have No Contacts",
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
