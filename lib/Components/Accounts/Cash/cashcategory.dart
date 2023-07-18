import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:habittrackergad/Utils/Constants.dart';

import '../../../controller/accountController.dart';

class Cashcategory extends StatefulWidget {
  const Cashcategory({super.key});

  @override
  State<Cashcategory> createState() => _CashcategoryState();
}

class _CashcategoryState extends State<Cashcategory> {
  String? Category;
  AccountController accountCController = Get.put(AccountController());

  int _currentTimeValue = 1;

  TextEditingController radiocontroller = TextEditingController();
  void addItemToList() {
    setState(() {
      radio.add(radiocontroller.text);
      radiocontroller.clear();
    });
  }

  final List<String> radio = [
    "Recharge",
    "Rent",
    "Cash received",
    "Salary",
    "Sales",
    "petrol"
  ];

  var _radioValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const CircleAvatar(
                        backgroundColor: Colors.grey,
                        foregroundColor: Colors.white,
                        child: Icon(Icons.arrow_back_ios_new_outlined)),
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Add custom category",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                      width: 100,
                      height: 40,
                      child: ElevatedButton(

                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ))),
                          onPressed: accountCController.addCategory,
                          child: const Text('Add'))),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                controller: accountCController.newtCatController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 255, 255, 255))),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            accountCController.accCategory.isEmpty?
                Container():
            Obx(() {
                return SizedBox(
                  height: accountCController.accCategory.length*40,
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                            itemCount: accountCController.accCategory.length,
                            controller: ScrollController(),
                            separatorBuilder: (_, __) => const SizedBox(height: 1),
                            itemBuilder: (context, index) {
                              return RadioListTile(
                                title: Text(accountCController.accCategory[index].name),
                                value: accountCController.accCategory[index].id,
                                groupValue: _radioValue,
                                onChanged: (value) {
                                  setState(() {
                                    _radioValue = value.toString();
                                    print("SELECTCATEGORY");
                                    accountCController.selectCatController.text =  accountCController.accCategory[index].name.toString();
                                    print(accountCController.accCategory[index].id);
                                    accountCController.selectCate.value = accountCController.accCategory[index].id.toString();
                                    accountCController.selectCateName.value = accountCController.accCategory[index].name.toString();


                                  });
                                },
                              );
                            }),
                      ),
                    ],
                  ),
                );
              }
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, bottom: 15, top: 10),
              child: Text(
                "Choose one category",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
              ),
            ),
            Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, right: 20),
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.blue,
                        ),
                        width: 100,
                        height: 40,
                        child: const Center(
                            child: Text("save",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: BUTTONTEXTCOLOR)))),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  void _showcontent() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("category"),
            content: SingleChildScrollView(
                child: ListBody(
              children: [Text("this box close")],
            )),
            actions: [
              ElevatedButton(
                  onPressed: (() {
                    Navigator.of(context).pop();
                  }),
                  child: const Text("ok"))
            ],
          );
        });
  }
}
