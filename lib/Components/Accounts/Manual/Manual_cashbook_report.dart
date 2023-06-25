import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:flutter/material.dart';
import 'package:habittrackergad/Utils/Constants.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class Manual_cashbook_report extends StatefulWidget {
  const Manual_cashbook_report({super.key});

  @override
  State<Manual_cashbook_report> createState() => _Manual_cashbook_reportState();
}

class _Manual_cashbook_reportState extends State<Manual_cashbook_report> {
  DateTime? startDate;
  DateTime? endDate;
  List<Employee> employees = <Employee>[];
  late EmployeeDataSource employeeDataSource;

  @override
  void initState() {
    super.initState();
    employees = getEmployeeData();
    employeeDataSource = EmployeeDataSource(employeeData: employees);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 40,
                  ),
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: CircleAvatar(
                        backgroundColor: Colors.grey,
                        foregroundColor: Colors.white,
                        child: Icon(Icons.arrow_back_ios_new_outlined)),
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            const Text(
              'Manual cashbook report',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                  color: Colors.black),
            ),
            const SizedBox(height: 30),
            Center(
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(12)),
                width: MediaQuery.of(context).size.width - 30,
                height: 60,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 20),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ))),
                          onPressed: () {
                            showCustomDateRangePicker(
                              context,
                              dismissible: true,
                              minimumDate: new DateTime.now()
                                  .subtract(new Duration(days: 2000)),
                              maximumDate:
                                  DateTime.now().add(const Duration(days: 0)),
                              endDate: endDate,
                              startDate: startDate,
                              onApplyClick: (start, end) {
                                setState(() {
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
                          child: Text("Duration")),
                    ),
                    Text(
                      '${startDate != null ? DateFormat("dd-MMM-yy").format(startDate!) : '-'} - ${endDate != null ? DateFormat("dd-MMM-yy").format(endDate!) : '-'}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            // give the tab bar a height [can change hheight to preferred height]

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2.4,
                  height: 100,
                  decoration: const BoxDecoration(
                    // image: DecorationImage(
                    //   image: AssetImage("images/"),
                    //   fit: BoxFit.fitWidth,
                    //   alignment: Alignment.topCenter,
                    // ),
                    color: INCOMECARDCOLOR,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Cash in ',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: INCOMEEXPENSESCARDTEXTCOLOR),
                          ),
                          Icon(
                            Icons.arrow_downward,
                            color: BUTTONTEXTCOLOR,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        '₹ 2,50,000',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: INCOMECARDTEXTCOLOR),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2.4,
                  height: 100,
                  decoration: const BoxDecoration(
                    color: EXPENSESCARDCOLOR,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Cash out ',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: INCOMEEXPENSESCARDTEXTCOLOR),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: BUTTONTEXTCOLOR,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        '₹ 1,50,000',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: EXPENSECARDTEXTCOLOR),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Card(
                elevation: 2,
                child: Center(
                  child: Container(
                    height: 210,
                    child: SfDataGrid(
                      source: employeeDataSource,
                      frozenColumnsCount: 1,
                      columns: <GridColumn>[
                        GridTextColumn(
                            columnName: 'Date',
                            label: Container(
                                padding: EdgeInsets.all(0),
                                alignment: Alignment.center,
                                child: Text(
                                  'Date',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 77, 218, 201)),
                                ))),
                        GridTextColumn(
                            columnName: 'Remark',
                            label: Container(
                                padding: EdgeInsets.all(0),
                                alignment: Alignment.center,
                                child: Text(
                                  'Remark',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 77, 218, 201)),
                                ))),
                        GridTextColumn(
                            columnName: 'Party \ntype',
                            label: Padding(
                              padding:
                                  EdgeInsets.only(top: 0, left: 0, right: 0),
                              child: Container(
                                  padding: EdgeInsets.only(
                                      top: 15, left: 20, right: 0),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Party \ntype',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 77, 218, 201)),
                                  )),
                            )),
                        GridTextColumn(
                            columnName: 'Category',
                            label: Container(
                                padding: EdgeInsets.all(0),
                                alignment: Alignment.center,
                                child: Text(
                                  'Category',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 77, 218, 201)),
                                ))),
                        GridTextColumn(
                            columnName: 'Payment mode',
                            label: Container(
                                padding: EdgeInsets.all(0),
                                alignment: Alignment.center,
                                child: Text(
                                  'Payment \nmode',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 77, 218, 201)),
                                ))),
                        GridTextColumn(
                            columnName: 'Payment mode',
                            label: Container(
                                padding: EdgeInsets.all(0),
                                alignment: Alignment.center,
                                child: Text(
                                  'Payment \nmode',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 77, 218, 201)),
                                ))),
                        GridTextColumn(
                            columnName: 'Payment mode',
                            label: Container(
                                padding: EdgeInsets.all(0),
                                alignment: Alignment.center,
                                child: Text(
                                  'Payment \nmode',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 77, 218, 201)),
                                ))),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color(0xff223faf)),
                  width: 350,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/icons/download.icon.png",
                        width: 25,
                        height: 25,
                        color: BUTTONTEXTCOLOR,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "Downlod report",
                          style:
                              TextStyle(fontSize: 18, color: BUTTONTEXTCOLOR),
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
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
        padding: EdgeInsets.all(8.0),
        child: Text(e.value.toString()),
      );
    }).toList());
  }
}
