import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:habittrackergad/Components/Accounts/Cash/cashcategory.dart';
import 'package:habittrackergad/Components/Home/Homepage.dart';
import 'package:habittrackergad/Utils/Constants.dart';
import 'package:intl/intl.dart';
import 'package:simple_time_range_picker/simple_time_range_picker.dart';
import 'package:flutter_switch/flutter_switch.dart';
import '../../../controller/accountController.dart';
import '../../../controller/teamController.dart';

class Cashinadd extends StatefulWidget {
  @override
  final  type;
  const Cashinadd({Key? key, this.type}) : super(key: key);
  State<StatefulWidget> createState() {
    return Homepage();
  }
}

class Homepage extends State<Cashinadd> {
  //////////////////////contact
  List<Contact>? _contacts;
  bool _permissionDenied = false;
  AccountController accountCController = Get.put(AccountController());
  List<String>? searchResults = [];
  List<String>? contactList = [];

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
      setState(()
          {
            _contacts = contacts;
            searchResults!.clear();
            contactList!.clear();

            for(int i = 0; i<contacts.length;i++)
              {
                contactList!.add(contacts[i].displayName);
                searchResults!.add(contacts[i].displayName);
              }

          });
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
  Widget build(BuildContext context)
  {
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
     SizedBox(
    height: 10,
    ),
     Text(
    "${widget.type}",
    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
    ),
     Padding(
    padding: EdgeInsets.only(top: 20),
    child: Text('Amount',
    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
    ), SizedBox(
    height: 10,
    ),
    TextField(
    controller: accountCController.amountController,
    keyboardType: TextInputType.number,
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
    controller: accountCController.remarkController,
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
    String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
    String formatDate = DateFormat('yyyy-MM-dd').format(pickedDate);
    print(
    formattedDate); //formatted date output using intl package =>  2021-03-16
    setState(() {
    dateInput.text = formattedDate;
    accountCController.selectDate.value = formatDate;
    //set output date to TextField value.
    });
    } else {}
    },
    ))),
    const SizedBox(
    height: 10,
    ),
    // accountCController.selectCate.value.isNotEmpty?   RichText(
    //     text: TextSpan(
    //       text: 'Selected category ',
    //       style:TextStyle(fontSize: 14,color: Colors.black),
    //       children:  <TextSpan>[
    //         TextSpan(
    //             text: '${accountCController.selectCateName.value}', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue,fontSize: 16)),
    //       ],
    //     ),
    // ):Container(),
    // accountCController.selectCate.value.isNotEmpty?Text("Selected category ${accountCController.selectCateName.value}"):Container(),
    const SizedBox(
    height: 10,
    ),
    Row(
    children: [
    Container(
    width: 220,
    child: TextField(
    readOnly: true,
    controller: accountCController.selectCatController,
    decoration:InputDecoration(
    hintText: "Select Category"
    ),
    ),
    ),
    SizedBox(width: 10,),
    InkWell(
    onTap: () => Navigator.push(
    context,
    MaterialPageRoute(
    builder: ((context) => const Cashcategory()))),
    child: Container(

    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(12),
    color: Colors.blue,
    ),

    child:Center(child: Text("Choose", style: TextStyle(color: BUTTONTEXTCOLOR, fontSize: 16))),

    ),
    ),
    ],
    ),
    const SizedBox(
    height: 30,
    ),
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        width: 220,
        child: TextField(
          readOnly: true,
          controller: accountCController.selectContactName,
          decoration:InputDecoration(
              hintText: "Select contact"
          ),
        ),
      ),
      // SizedBox(width: 10,),
    InkWell(
      onTap: ()
      {
        _fetchContacts().then((value)
        {
          showModalcontact(context);

        });
      },
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.blue,
        ),
        child: Center(
          child: Text('Choose',
              style: const TextStyle(
                  color: BUTTONTEXTCOLOR,
                  fontSize: 16,
                  fontWeight: FontWeight.w400)),
        ),
      ),
    ),
    // SizedBox(
    // width: width! - 40,
    // height: 50,
    // child: ElevatedButton(
    // style: ButtonStyle(
    // shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    // RoundedRectangleBorder(
    // borderRadius: BorderRadius.circular(12.0),
    // ))),
    // child: Text('$_selected',
    // style: const TextStyle(
    // color: BUTTONTEXTCOLOR,
    // fontSize: 16,
    // fontWeight: FontWeight.w400)),
    // onPressed: () {
    //   _fetchContacts().then((value)
    //   {
    //     showModalcontact(context);
    //
    //   });
    //     },
    // ),
    // ),
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
    print("SELECTMODE");
    print(val);
    accountCController.selectPayment.value = val;
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
    Obx(()
    {
      if(accountCController.cashInLoader.isTrue || accountCController.cashOutLoader.isTrue)
        {
          return Center(
            child: InkWell(
              onTap: ()
              {

              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: APPBACKGROUNDCOLOR),
                width: width! - 20,
                height: 50,
                child: const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 1,
                    color: Colors.white,
                  )
                ),
              ),
            ),
          );
        }
      else
        {
          return Center(
            child: InkWell(
              onTap: ()
              {
                if(accountCController.selectCate.isNotEmpty && accountCController.amountController.text.isNotEmpty && accountCController.remarkController.text.isNotEmpty&& accountCController.selectDate.isNotEmpty )
                {

                  accountCController.accCategory();
                  if(widget.type == "Cash out")
                  {
                    accountCController.addCashOutAccount();

                  }
                  else
                  {
                    accountCController.addCashInAccount();

                  }
                }
                else
                {
                  Get.snackbar('Alert','Please enter all fields',
                      backgroundColor: Colors.black.withOpacity(0.7),
                      colorText: Colors.white,
                      icon: Icon(
                        Icons.warning,
                        color: Colors.white,
                      ),
                      snackPosition: SnackPosition.BOTTOM);
                }
              },
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
          );
        }
    })


    ],
    ),
    )
    );
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
          return Container(
            height: 550,
              // height:_contacts!.length*150,
              child: ListView(
              children: [

                Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    width: 300,
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.grey.shade400
                      )
                    ),
                    child: Center(
                      child: TextField(
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(8),
                          hintText: "Search contact......"
                        ),
                     
                          onChanged: (val)
                        {
                          setState(() {
                            searchResults!.clear();
                            searchResults = contactList!.where((item) => item.toLowerCase().contains(val.toLowerCase())).cast<String>().toList();
                            print("SEARCH LSIT");
                            print(searchResults);

                          });

                          },
                      ),
                    ),

                  ),
                ),
                  searchResults!.isEmpty?
                  Container(
                    height: 400,
                    child: Center(child: Text("No match")),
                  ):Container(
                    height:450,
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        for(int i = 0; i<searchResults!.length;i++)
                          ListTile(
                            title: Text(searchResults![i]),
                            onTap: () async {
                              // final fullContact = await FlutterContacts.getContact(_contacts![i].id);
                              // accountCController.selectContactName.text = fullContact!.displayName;
                              accountCController.selectContactName.text = searchResults![i].toString();
                               Navigator.of(context).pop();

                              // await Navigator.of(context).push(MaterialPageRoute(builder: (_) => ContactPage(fullContact!)));


                            })
                      ],
                    ),
                  )


              ],
            ),
          );
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


