import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:habittrackergad/Utils/Constants.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

import '../../controller/teamController.dart';

class Addteam extends StatefulWidget {
  const Addteam({super.key});

  @override
  State<Addteam> createState() => _AddteamState();
}

double? height;
double? width;

Future<void> getContactsList() async {
  if (await FlutterContacts.requestPermission()) {
    List<Contact> contacts = await FlutterContacts.getContacts();
    print('The List Of Contacts List $contacts');
  }
}

class _AddteamState extends State<Addteam> {
  //////////////////////contact
  List<Contact>? _contacts;
  bool _permissionDenied = false;
  TeamController teamController = Get.put(TeamController());
  TextEditingController nameController = TextEditingController();
  TextEditingController designationController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _fetchContacts();
  }

  Future _fetchContacts() async {
    if (!await FlutterContacts.requestPermission(readonly: true)) {
      setState(() => _permissionDenied = true);
    } else {
      final contacts = await FlutterContacts.getContacts();
      setState(() => _contacts = contacts);
    }
  }

  //////////////////contact
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 10),
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const CircleAvatar(
                        backgroundColor: Colors.grey,
                        foregroundColor: Colors.white,
                        child: Icon(Icons.arrow_back_ios_new_outlined)),
                  ),
                )),
            const SizedBox(
              height: 10,
            ),
            const Text("Add team",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 10),
              child: Text('Name',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                label: const Text("Enter the name"),
                filled: true,
                fillColor: const Color(0xffeaf0f6),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 10),
              child: Text('Designation',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: designationController,
              decoration: InputDecoration(
                label: const Text("Enter the designation"),
                filled: true,
                fillColor: const Color(0xffeaf0f6),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 10),
              child: Text('Email',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                label: const Text("Enter the email"),
                filled: true,
                fillColor: const Color(0xffeaf0f6),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 10),
              child: Text('Phone',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                label: const Text("Enter the phone number "),
                filled: true,
                fillColor: const Color(0xffeaf0f6),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () => showModal(context),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: width! - 300,
                  height: 45,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0XFFffbf96),
                        Color(0XFFfe7096),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Text('Add',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: BUTTONTEXTCOLOR)),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const ListTile(
              title: Text("Naveenraj@gmail.com"),
              trailing: Text("Manager"),
            ),
            const Divider(
              color: Colors.grey,
            ),
            const ListTile(
              title: Text("Pranav@gmail.com"),
              trailing: Text("Lead"),
            ),
            const Divider(
              color: Colors.grey,
            ),
            const ListTile(
              title: Text("Rajesh@gmail.com"),
              trailing: Text("Task"),
            ),
            const Divider(
              color: Colors.grey,
            ),
            const SizedBox(
              height: 10,
            ),
            Obx(
              () {
                if(teamController.isTeamSaveLoaders.isFalse)
                  {
                    return InkWell(
                      onTap: () {
                        String name = nameController.text.toString();
                        String designation = designationController.text.toString();
                        String email = emailController.text.toString();
                        String phone = phoneController.text.toString();
                        if(name.isNotEmpty && designation.isNotEmpty && email.isNotEmpty && phone.isNotEmpty)
                        {
                          teamController.teamAdd(name,designation, email,phone);
                        }
                        else
                        {
                          Get.snackbar("Alert", "Please enter all fields",colorText: Colors.white,
                              icon: Icon(
                                Icons.warning,
                                color: Colors.white,
                              ),
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.black);
                        }

                      },
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: width! - 80,
                          height: 50,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Color(0XFFffbf96),
                                Color(0XFFfe7096),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Center(
                            child: Text('Submit',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                    color: BUTTONTEXTCOLOR)),
                          ),
                        ),
                      ),
                    );
                  }
                else
                  {
                    return Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: width! - 80,
                        height: 50,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Color(0XFFffbf96),
                              Color(0XFFfe7096),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: CircularProgressIndicator(strokeWidth: 2,color: Colors.white,),
                        ),
                      ),
                    );
                  }

              }
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  void showModal(context) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(15),
          ),
        ),
        context: context,
        builder: (context) {
          if (_permissionDenied)
            return Center(child: Text('Permission denied'));
          if (_contacts == null)
            return Center(child: CircularProgressIndicator());
          return ListView.builder(
              itemCount: _contacts!.length,
              itemBuilder: (context, i) => ListTile(
                  title: Text(_contacts![i].displayName),
                  onTap: () async {
                    final fullContact =
                        await FlutterContacts.getContact(_contacts![i].id);
                    await Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => ContactPage(fullContact!)));
                  }));
        });
  }
}

class ContactPage extends StatelessWidget {
  final Contact contact;
  ContactPage(this.contact);

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: Text(contact.displayName)),
      body: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('First name: ${contact.name.first}'),
          Text('Last name: ${contact.name.last}'),
          Text(
              'Phone number: ${contact.phones.isNotEmpty ? contact.phones.first.number : '(none)'}'),
          Text(
              'Email address: ${contact.emails.isNotEmpty ? contact.emails.first.address : '(none)'}'),
        ]),
      ));
}
