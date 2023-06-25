import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:habittrackergad/Components/Accounts/Cash/cashcategory.dart';
import 'package:habittrackergad/Components/Home/Homepage.dart';

import 'package:habittrackergad/Utils/Constants.dart';
import 'package:intl/intl.dart';
import 'package:simple_time_range_picker/simple_time_range_picker.dart';
import 'package:flutter_switch/flutter_switch.dart';

class Cashinadd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Homepage();
  }
}

class Homepage extends State<Cashinadd> {
  //////////////////////contact
  List<Contact>? _contacts;
  bool _permissionDenied = false;

  @override
  void initState() {
    super.initState();

    _fetchContacts();
    dateInput.text = "select"; //datepic calender
    _resetSelectedDate();
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
  String _selected = 'Select contact';
  List<String> _items = ['Party Name(Contact)', "Other"];
  TextEditingController dateInput = TextEditingController();
//////////////
  late DateTime _selectedDate;
  // datepickcalender

  void _resetSelectedDate() {
    _selectedDate = DateTime.now().add(const Duration(days: 2));
  }

  Future<void> getContactsList() async {
    if (await FlutterContacts.requestPermission()) {
      List<Contact> contacts = await FlutterContacts.getContacts();
      print('The List Of Contacts List $contacts');
    }
  }

///////////////

  TimeOfDay _startTime = TimeOfDay.now();
  TimeOfDay _endTime = TimeOfDay.now();

  bool status = false;

  double? height;
  double? width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: ListView(
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                ),
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
          const Text(
            "Cash in",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text('Amount',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 255, 255, 255))),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text('Remark',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 255, 255, 255))),
            ),
          ),
          Container(
              padding: const EdgeInsets.all(15),
              height: MediaQuery.of(context).size.width / 3,
              child: Center(
                  child: TextField(
                controller: dateInput,
                //editing controller of this TextField
                decoration: const InputDecoration(
                    icon: Icon(Icons.calendar_today), //icon of text field
                    labelText: "Enter Date" //label text of field
                    ),
                readOnly: true,
                //set it true, so that user will not able to edit text
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2100));

                  if (pickedDate != null) {
                    print(
                        pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                    String formattedDate =
                        DateFormat('dd-MM-yyyy').format(pickedDate);
                    print(
                        formattedDate); //formatted date output using intl package =>  2021-03-16
                    setState(() {
                      dateInput.text =
                          formattedDate; //set output date to TextField value.
                    });
                  } else {}
                },
              ))),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => const Cashcategory()))),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.blue,
              ),
              width: width! - 30,
              height: 55,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Choose category",
                        style: TextStyle(color: BUTTONTEXTCOLOR, fontSize: 16)),
                    Icon(
                      Icons.arrow_drop_down,
                      size: 40,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: width! - 40,
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ))),
                  child: Text('$_selected',
                      style: const TextStyle(
                          color: BUTTONTEXTCOLOR,
                          fontSize: 16,
                          fontWeight: FontWeight.w400)),
                  onPressed: () => showModalcontact(context),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Select payment mode',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                Container(
                  child: FlutterSwitch(
                    width: 105.0,
                    height: 45.0,
                    valueFontSize: 15.0,
                    toggleSize: 35.0,
                    value: status,
                    activeText: "Online",
                    inactiveText: "Offline",
                    borderRadius: 30.0,
                    activeColor: const Color(0xff54B435),
                    inactiveColor: const Color(0xff9C254D),
                    padding: 8.0,
                    showOnOff: true,
                    onToggle: (val) {
                      setState(() {
                        status = val;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 40,
          ),
          Center(
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: APPBACKGROUNDCOLOR),
                width: width! - 20,
                height: 50,
                child: const Center(
                  child: Text('Submit',
                      style: TextStyle(color: BUTTONTEXTCOLOR, fontSize: 18)),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  void showModal(context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.all(20),
            height: 110,
            alignment: Alignment.center,
            child: ListView.separated(
                itemCount: _items.length,
                separatorBuilder: (context, int) {
                  return const Divider();
                },
                itemBuilder: (context, index) {
                  return GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text(_items[index]),
                      ),
                      onTap: () {
                        setState(() {
                          _selected = _items[index];
                        });
                        Navigator.of(context).pop();
                      });
                }),
          );
        });
  }

  String _timeFormated(TimeOfDay time) {
    if (time == null) return "--:--";
    return "${time.hour}:${time.minute}";
  }

  void showModalcontact(context) {
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
