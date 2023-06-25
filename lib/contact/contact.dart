import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

class Contact {
  late String id;
  late String displayName;
  Uint8List? photo;
  Uint8List? thumbnail;
  late Name name;
  late List<Phone> phones;
  late List<Email> emails;
  late List<Address> addresses;
  late List<Organization> organizations;
  late List<Website> websites;
  late List<SocialMedia> socialMedias;
  late List<Event> events;
  late List<Note> notes;
  late List<Group> groups;
}

class Name {
  late String first;
  late String last;
}

class Phone {
  late String number;
  late PhoneLabel label;
}

class Email {
  late String address;
  late EmailLabel label;
}

class Address {
  late String address;
  late AddressLabel label;
}

class Organization {
  late String company;
  late String title;
}

class Website {
  late String url;
  late WebsiteLabel label;
}

class SocialMedia {
  late String userName;
  late SocialMediaLabel label;
}

class Event {
  int? year;
  late int month;
  late int day;
  late EventLabel label;
}

class Note {
  late String note;
}

class Group {
  late String id;
  late String name;
}

void main() => runApp(FlutterContactsExample());

class FlutterContactsExample extends StatefulWidget {
  @override
  _FlutterContactsExampleState createState() => _FlutterContactsExampleState();
}

class _FlutterContactsExampleState extends State<FlutterContactsExample> {
  List<Contact>? _contacts;
  bool _permissionDenied = false;

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
      setState(() => _contacts = contacts.cast<Contact>());
    }
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text('flutter_contacts_example')),
          body: _body()));

  Widget _body() {
    if (_permissionDenied) return Center(child: Text('Permission denied'));
    if (_contacts == null) return Center(child: CircularProgressIndicator());
    return ListView.builder(
        itemCount: _contacts!.length,
        itemBuilder: (context, i) => ListTile(
            title: Text(_contacts![i].displayName),
            onTap: () async {
              getContactsList();
            }));
  }

  Future<void> getContactsList() async {
    List<Contact> contacts = (await FlutterContacts.getContacts()).cast<Contact>();
  }
}

class ContactPage extends StatelessWidget {
  final Contact contact;
  ContactPage(this.contact);

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: Text(contact.displayName)),
      body: Column(children: [
        Text('First name: ${contact.name.first}'),
        Text('Last name: ${contact.name.last}'),
        Text(
            'Phone number: ${contact.phones.isNotEmpty ? contact.phones.first.number : '(none)'}'),
        Text(
            'Email address: ${contact.emails.isNotEmpty ? contact.emails.first.address : '(none)'}'),
      ]));
}
