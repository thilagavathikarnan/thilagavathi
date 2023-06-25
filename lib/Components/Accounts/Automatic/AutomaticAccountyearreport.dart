import 'dart:math';

import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:flutter/material.dart';
import 'package:habittrackergad/Utils/Constants.dart';
import 'package:intl/intl.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class Automatic_Accountyear_report extends StatefulWidget {
  const Automatic_Accountyear_report({super.key});

  @override
  State<Automatic_Accountyear_report> createState() =>
      _Automatic_Accountyear_reportState();
}

class _Automatic_Accountyear_reportState
    extends State<Automatic_Accountyear_report> {
  final dataMap = <String, double>{
    "Credit": 35,
    "Upi funds transfer": 15,
    "Atm": 35,
    "Net banking": 15,
  };

  final colorList = <Color>[
    const Color(0xfffdcb6e),
    const Color(0xff0984e3),
    const Color(0xfffd79a8),
    const Color(0xffe17055),
    const Color(0xff6c5ce7),
  ];

  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    employees = getEmployeeData();
    employeeDataSource = EmployeeDataSource(employeeData: employees);

    _resetSelectedDate();
  }

  void _resetSelectedDate() {
    _selectedDate = DateTime.now().add(const Duration(days: 2));
  }

  final random = Random();
  static List<Color> listColors = const [
    // Color(0xffF473B9),
    // Color(0xff5584AC),
    // Color(0xffFFBC97),
    // Color(0xffFF7777),
    // Color(0xff9FE6A0),
    // Color(0xffFFBD35),
    // Color(0xffFF9F45),
    // Color(0xffFF6363),
    // Color(0xff94B3FD),
    // Color(0xff96C7C1),
    // Color(0xff42C2FF),
    // Color(0xff676FA3),
    Color(0xffD8D9CF),
    Color(0xff27E1CE),
    Color(0xffFF98DA),
    Color(0xffFDFF8F),
    Color(0xffD8D9CF),
    Color(0xff8DED8E),
    Color(0xff00BEBED),
    Color(0xffFCD2C2),
    Color(0xffC7F5FE),
    Color(0xff84DFFF),
    Color(0xffFFFCDC),
    Color(0xffA3F7BF),

    Color(0xff58DADA),
    Color(0xffC7F0DB),
    Color(0xffE8A0BF),
    Color(0xffB9BBDF),
    Color(0xffF1FEA4),
  ];

  Color getColor() {
    return listColors[random.nextInt(listColors.length)];
  }

  double? height;
  double? width;

  final List<DateTime> events = [
    DateTime.now(),
    DateTime(2022, 10, 10),
  ];

  DateTime? startDate;
  DateTime? endDate;
  List<Employee> employees = <Employee>[];
  late EmployeeDataSource employeeDataSource;
  var buttonText = 'Click Me!';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          //////////
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () => Navigator.pop(context),
                            child: const CircleAvatar(
                                backgroundColor: Colors.grey,
                                foregroundColor: Colors.white,
                                child: Icon(Icons.arrow_back_ios_new_outlined)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        showCustomDateRangePicker(
                                          context,
                                          dismissible: true,
                                          minimumDate: new DateTime.now()
                                              .subtract(
                                                  new Duration(days: 2000)),
                                          maximumDate: DateTime.now()
                                              .add(const Duration(days: 0)),
                                          endDate: endDate,
                                          startDate: startDate,
                                          onApplyClick: (start, end) {
                                            setState(() {
                                              buttonText =
                                                  '${startDate != null ? DateFormat("dd-MMM-yy").format(startDate!) : '-'} - ${endDate != null ? DateFormat("dd-MMM-yy").format(endDate!) : ''}';
                                              endDate = end;
                                              startDate = start;
                                            });
                                          },
                                          onCancelClick: () {
                                            setState(() {
                                              endDate = null;
                                              startDate = null;
                                            });
                                          },
                                        );
                                      },
                                      child: Row(
                                        children: const [
                                          Text(
                                            "Dec",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w800),
                                          ),
                                          Icon(Icons.arrow_drop_down_outlined)
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  '${startDate != null ? DateFormat("dd-MMM-yy").format(startDate!) : ''} - ${endDate != null ? DateFormat("dd-MMM-yy").format(endDate!) : 'All transcation'}',
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Center(
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: const Color(0xff223faf)),
                            width: 40,
                            height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/icons/download.icon.png",
                                  width: 25,
                                  height: 25,
                                  color: BUTTONTEXTCOLOR,
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
              )),
          // ElevatedButton(
          //     onPressed: () {
          //       setState(() {
          //         buttonText =
          //             '${startDate != null ? DateFormat("dd-MMM-yy").format(startDate!) : '-'} - ${endDate != null ? DateFormat("dd-MMM-yy").format(endDate!) : '-'}';
          //       });
          //     },
          //     style: ButtonStyle(
          //         backgroundColor:
          //             MaterialStateProperty.all<Color>(Colors.red)),
          //     child: Text(buttonText)),

          const SizedBox(
            height: 30,
          ),

          // give the tab bar a height [can change hheight to preferred height]

          // Padding(
          //   padding: const EdgeInsets.only(left: 5, right: 5),
          //   child: Card(
          //     elevation: 2,
          //     child: Center(
          //       child: Container(
          //         height: 210,
          //         child: SfDataGrid(
          //           source: employeeDataSource,
          //           frozenColumnsCount: 1,
          //           columns: <GridColumn>[
          //             GridTextColumn(
          //                 columnName: 'Date',
          //                 label: Container(
          //                     padding: EdgeInsets.all(0),
          //                     alignment: Alignment.center,
          //                     child: Text(
          //                       'Date',
          //                       style: TextStyle(
          //                           color: Color.fromARGB(255, 77, 218, 201)),
          //                     ))),
          //             GridTextColumn(
          //                 columnName: 'Remark',
          //                 label: Container(
          //                     padding: EdgeInsets.all(0),
          //                     alignment: Alignment.center,
          //                     child: Text(
          //                       'Remark',
          //                       style: TextStyle(
          //                           color: Color.fromARGB(255, 77, 218, 201)),
          //                     ))),
          //             GridTextColumn(
          //                 columnName: 'Party \ntype',
          //                 label: Padding(
          //                   padding:
          //                       EdgeInsets.only(top: 0, left: 0, right: 0),
          //                   child: Container(
          //                       padding: EdgeInsets.only(
          //                           top: 15, left: 20, right: 0),
          //                       alignment: Alignment.center,
          //                       child: Text(
          //                         'Party \ntype',
          //                         style: TextStyle(
          //                             color:
          //                                 Color.fromARGB(255, 77, 218, 201)),
          //                       )),
          //                 )),
          //             GridTextColumn(
          //                 columnName: 'Category',
          //                 label: Container(
          //                     padding: EdgeInsets.all(0),
          //                     alignment: Alignment.center,
          //                     child: Text(
          //                       'Category',
          //                       style: TextStyle(
          //                           color: Color.fromARGB(255, 77, 218, 201)),
          //                     ))),
          //             GridTextColumn(
          //                 columnName: 'Payment mode',
          //                 label: Container(
          //                     padding: EdgeInsets.all(0),
          //                     alignment: Alignment.center,
          //                     child: Text(
          //                       'Payment \nmode',
          //                       style: TextStyle(
          //                           color: Color.fromARGB(255, 77, 218, 201)),
          //                     ))),
          //             GridTextColumn(
          //                 columnName: 'Payment mode',
          //                 label: Container(
          //                     padding: EdgeInsets.all(0),
          //                     alignment: Alignment.center,
          //                     child: Text(
          //                       'Payment \nmode',
          //                       style: TextStyle(
          //                           color: Color.fromARGB(255, 77, 218, 201)),
          //                     ))),
          //             GridTextColumn(
          //                 columnName: 'Payment mode',
          //                 label: Container(
          //                     padding: EdgeInsets.all(0),
          //                     alignment: Alignment.center,
          //                     child: Text(
          //                       'Payment \nmode',
          //                       style: TextStyle(
          //                           color: Color.fromARGB(255, 77, 218, 201)),
          //                     ))),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: PieChart(
              dataMap: dataMap,
              chartType: ChartType.ring,
              baseChartColor:
                  const Color.fromARGB(255, 235, 143, 143)!.withOpacity(0.15),
              colorList: colorList,
              chartValuesOptions: const ChartValuesOptions(
                showChartValuesInPercentage: true,
              ),
              totalValue: 100,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text("Non-budgeted categories",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
          ),
          const SizedBox(
            height: 20,
          ),

          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2.3,
                    height: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: getColor()),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text("Credit",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700)),
                        SizedBox(
                            width: 30,
                            height: 30,
                            child: Image.asset(CREDITICON)),
                        const Text("₹1,20,000")
                      ],
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2.3,
                    height: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: getColor()),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text("Atm",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700)),
                        SizedBox(
                            width: 30, height: 30, child: Image.asset(ATMICON)),
                        const Text("₹60,000")
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2.3,
                    height: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: getColor()),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          "Upi funds transfer",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                            width: 30,
                            height: 30,
                            child: Image.asset(UPIFOUNDSICON)),
                        const Text("₹1,000")
                      ],
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2.3,
                    height: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: getColor()),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text("Net banking",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700)),
                        SizedBox(
                            width: 30,
                            height: 30,
                            child: Image.asset(NETBANKINGICON)),
                        const Text("₹21,000")
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(
            height: 30,
          ),

          // Center(
          //   child: Container(
          //       decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(12),
          //           color: Color(0xff223faf)),
          //       width: 350,
          //       height: 50,
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           Image.asset(
          //             "assets/icons/download.icon.png",
          //             width: 25,
          //             height: 25,
          //             color: BUTTONTEXTCOLOR,
          //           ),
          //           Padding(
          //             padding: const EdgeInsets.only(left: 10),
          //             child: Text(
          //               "Downlod report",
          //               style: TextStyle(fontSize: 18, color: BUTTONTEXTCOLOR),
          //             ),
          //           ),
          //         ],
          //       )),
          // ),
        ],
      ),
    );
  }
}

List<Employee> getEmployeeData() {
  return [
    Employee("14-10-22", "Office", 'Contact', 'Atm', 'Cash', "-", "₹5000"),
    Employee("19-11-22", "Sales", 'Contact', 'Upi', 'Online', "₹2,00000", "-"),
    Employee(
        "15-12-22", "Petrol", 'Other', 'Net banking', 'Online', "-", "₹8000"),
  ];
}

/// Custom business object class which contains properties to hold the detailed
/// information about the employee which will be rendered in datagrid.
class Employee {
  /// Creates the employee class with required details.
  Employee(this.Date, this.Remark, this.Partytype, this.Category,
      this.Paymentmode, this.Credit, this.Debit);

  /// Name of an employee.
  final String Date;

  /// Id of an employee.
  final String Remark;

  /// Designation of an employee.
  final String Partytype;

  /// Salary of an employee.
  final String Category;

  final String Paymentmode;

  final String Credit;

  final String Debit;
}

/// An object to set the employee collection data source to the datagrid. This
/// is used to map the employee data to the datagrid widget.
class EmployeeDataSource extends DataGridSource {
  /// Creates the employee data source class with required details.
  EmployeeDataSource({required List<Employee> employeeData}) {
    _employeeData = employeeData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'Date', value: e.Date),
              DataGridCell<String>(columnName: 'Remark', value: e.Remark),
              DataGridCell<String>(
                  columnName: 'Party type', value: e.Partytype),
              DataGridCell<String>(columnName: 'Category', value: e.Category),
              DataGridCell<String>(
                  columnName: 'Payment mode', value: e.Paymentmode),
              DataGridCell<String>(columnName: 'Credit', value: e.Credit),
              DataGridCell<String>(columnName: 'Debit', value: e.Debit),
            ]))
        .toList();
  }

  List<DataGridRow> _employeeData = [];

  @override
  List<DataGridRow> get rows => _employeeData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: Text(e.value.toString()),
      );
    }).toList());
  }
}
