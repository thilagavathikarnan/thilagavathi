import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:habittrackergad/constant/constant.dart';
import 'package:habittrackergad/model/cashlist_moodel.dart';
import 'package:habittrackergad/model/income&expenses_model.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/accountCategory_model.dart';

class AccountController extends GetxController
{
  void onInit()
  {
    getCategory();
    getCashIn();
    getCashOut();
    getIncomeAndExpenses();
    getAccountsCounts();
    getAccountHistory();
    dataClear();
    super.onInit();
  }
 final accCategory = <AcoountCategoryModel>[].obs;
 final incomeAndExpen = <ResponseModel>[].obs;
  Rx<DateTime> incomeExpenseDate = DateTime.now().obs;
  Rx<DateTime> accountHistoryDate = DateTime.now().obs;
  Rx<DateTime> accountChartDate = DateTime.now().obs;
  ResponseModel incomeExpenseData = ResponseModel(income: "", expenses: "");
  TextEditingController amountController = TextEditingController();
  TextEditingController remarkController = TextEditingController();
  TextEditingController selectCatController = TextEditingController();
  TextEditingController newtCatController = TextEditingController();
  TextEditingController cashCategoryName = TextEditingController();
  TextEditingController selectContactName = TextEditingController();
  final selectDate = "".obs;
  final selectCate = "".obs;
  final selectCateName = "".obs;
  final selectPayment = false.obs;
  final cashType = "".obs;
  var cashInList = <DataModel>[].obs;
  var cashOutList = <DataModel>[].obs;
  var accountHistoryList = <DataModel>[].obs;
  final cashInLoader = false.obs;
  final cashOutLoader = false.obs;
  var date = DateTime.now();
  var calendarControllerToday;
  final formatDate =  DateFormat('yyyy-MM-dd');
  var selectDateForCash;
  Rx<double> incomeValue = 0.0.obs;
  Rx<double> expensesValue = 0.0.obs;

  Rx<double> incomeChart = 0.0.obs;
  Rx<double> expensesChart = 0.0.obs;
  Rx<double> onlineChart = 0.0.obs;
  Rx<double> offlineChart = 0.0.obs;


  void dataClear()
  async{
    amountController.clear();
    remarkController.clear();
    selectCatController.clear();
    selectPayment.value = false;
    selectCate.value = "";
    selectDate.value = "";

    amountController.clear();
    remarkController.clear();
    amountController.clear();
    accountHistoryList.clear();
    newtCatController.clear();
    selectCate.value = "";
    selectDate.value = '';
    cashType.value = '';
    incomeValue.value = 0.0;
    expensesValue.value = 0.0;

  }

  void addCashInAccount()
  async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var usId = await prefs.getString('userId');
    var body = {
      "user_id":usId,
      "amount":amountController.text.toString(),
      "remark":remarkController.text.toString(),
      "date":selectDate.toString(),
      "category":selectCate.toString(),
      "category_name":selectCatController.text.toString(),
      "contact":selectContactName.text.toString(),
      "payment_mode":selectPayment.value == true?"1":0,
      "cash_type":"cash_in"
    };
    print("SELECTCATE");
    print(body);
    var dataJs = json.encode(body);
    try {
      cashInLoader.value = true;
      print("POSTAPI");
      var url = Uri.parse(mainUrl+accountUrl);
      print(url);
      print(body);

      http.Response response = await http.post(url,
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: dataJs);
      print(response.statusCode);
      var resp = json.decode(response.body);
      if (resp['status'] == 200 || resp['status'] == 201)
      {

        dataClear();
        getCashIn();
        getCashOut();
        getIncomeAndExpenses();
        getAccountsCounts();
        getAccountHistory();
        Get.back();

        Get.snackbar("Success", "Account add successfully",
            backgroundColor: Colors.green.withOpacity(0.8),
            colorText: Colors.white,
            icon: Icon(
              Icons.check,
              color: Colors.white,
            ),
            snackPosition: SnackPosition.BOTTOM);
      }
      else
      {
        Get.snackbar("Alert", "${resp['message']}",
            backgroundColor: Colors.black.withOpacity(0.7),
            colorText: Colors.white,
            icon: Icon(
              Icons.warning,
              color: Colors.white,
            ),
            snackPosition: SnackPosition.BOTTOM);
      }
      print(resp);

      return resp;
    } catch (e) {
      print("errror");
      print("----------${e}");
    } finally {
      cashInLoader.value = false;
    }
  }

  void addCashOutAccount()
  async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var usId = await prefs.getString('userId');

    var body = {
      "user_id":usId,
      "amount":amountController.text.toString(),
      "remark":remarkController.text.toString(),
      "date":selectDate.toString(),
      "category":selectCate.toString(),
      "category_name":selectCatController.text.toString(),
      "contact":selectContactName.text.toString(),
      "payment_mode":selectPayment.value == true?"1":0,
      "cash_type":"cash_out"
    };
    print("SELECTCATE");
    print(body);
    var dataJs = json.encode(body);
    try {
      cashOutLoader.value = true;
      print("POSTAPI");
      var url = Uri.parse(mainUrl+accountUrl);
      print(url);
      print(body);

      http.Response response = await http.post(url,
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: dataJs);
      print(response.statusCode);
      var resp = json.decode(response.body);
      if (resp['status'] == 200 || resp['status'] == 201)
      {
        dataClear();
        getCashIn();
        getCashOut();
        getIncomeAndExpenses();
        getAccountsCounts();
        getAccountHistory();
        Get.back();
        Get.snackbar("Success", "Account add successfully",
            backgroundColor: Colors.green.withOpacity(0.8),
            colorText: Colors.white,
            icon: Icon(
              Icons.check,
              color: Colors.white,
            ),
            snackPosition: SnackPosition.BOTTOM);
      }
      else
      {
        Get.snackbar("Alert", "${resp['message']}",
            backgroundColor: Colors.black.withOpacity(0.7),
            colorText: Colors.white,
            icon: Icon(
              Icons.warning,
              color: Colors.white,
            ),
            snackPosition: SnackPosition.BOTTOM);
      }
      print(resp);

      return resp;
    } catch (e) {
      print("errror");
      print("----------${e}");
    } finally
    {
      cashOutLoader.value = false;
    }
  }

  void getCategory()
  async
  {
    try
        {
          Uri url = Uri.parse(mainUrl+accountCategoryUrl);
          print("ACCCATEGORY");
          print(url);
          http.Response response = await http.get(url);
          var parsedResponse = jsonDecode(response.body);
          List<dynamic> data = parsedResponse['data'];

          List<AcoountCategoryModel> tasks = data.map((json) => AcoountCategoryModel.fromJson(json)).toList();
          print("SLECTCATEJWDKJSK");
          print(tasks);
          print("SLECTCATEJWDKJSK-----------------");
          accCategory.clear();
          accCategory.assignAll(tasks);
          print("SLECTCATEJWDKJSK");
          print(accCategory.value[0].name.toString());
        }
        catch(e)
    {
       
    }
    finally
        {
          
        }
  }

  void getCashIn()
  async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var usId = await prefs.getString('userId');
    try
        {
          print("GETVALUSESDATES");
          print(incomeExpenseDate.value.toString());
          Uri url =

          // calendarControllerToday == null?
          // Uri.parse(mainUrl+cashInGetUrl+"/"+usId!+"?cash_type=cash_in&date=${formatDate.format(date)}"):
          Uri.parse(mainUrl+cashInGetUrl+"/"+usId!+"?cash_type=cash_in&date=${formatDate.format(incomeExpenseDate.value)}");
          print("CASHINGET");
          print(url);
          http.Response response = await http.get(url);
          var parsedResponse = jsonDecode(response.body);
          final List<dynamic> rawDataList = parsedResponse['data'];
          cashInList.clear();
          cashInList.value = rawDataList.map((data) => DataModel.fromJson(data)).toList();
          print("CASH_IN_ACCC");
          print(cashInList.value);;

        }
        catch(e)
    {

    }
    finally
        {

        }
  }

  void getCashOut()
  async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var usId = await prefs.getString('userId');
    try
        {
          Uri url =
          // calendarControllerToday == null? Uri.parse(mainUrl+cashInGetUrl+"/"+usId!+"?cash_type=cash_out&date=${formatDate.format(date)}"):
          Uri.parse(mainUrl+cashInGetUrl+"/"+usId!+"?cash_type=cash_out&date=${formatDate.format(incomeExpenseDate.value)}");

          print("CASHOUTGET");
          print(url);
          http.Response response = await http.get(url);
          var parsedResponse = jsonDecode(response.body);
          final List<dynamic> rawDataList = parsedResponse['data'];
          cashOutList.clear();
          cashOutList.value = rawDataList.map((data) => DataModel.fromJson(data)).toList();
          print("CASH_OUT_ACCC");
          print(cashOutList.value);

        }
        catch(e)
    {

    }
    finally
        {

        }
  }

  void getAccountHistory()
  async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var usId = await prefs.getString('userId');
    try
        {
          Uri url =
          // calendarControllerToday == null? Uri.parse(mainUrl+cashInGetUrl+"/"+usId!+"?cash_type=cash_out&date=${formatDate.format(date)}"):
          Uri.parse(mainUrl+accountAllHistoryGetUrl+"?date=${formatDate.format(accountHistoryDate.value)}&user_id=${usId}");

          print("CASHACCOUNHISTORYGETURL");
          print(url);
          http.Response response = await http.get(url);
          var parsedResponse = jsonDecode(response.body);
          final List<dynamic> rawDataList = parsedResponse['data'];
          accountHistoryList.clear();
          accountHistoryList.value = rawDataList.map((data) => DataModel.fromJson(data)).toList();
          print("CASHACCOUNHISTORY");
          print(accountHistoryList.value);

        }
        catch(e)
    {

    }
    finally
        {

        }
  }

  void addCategory()
  async
  {
    var body = {

      "name":newtCatController.text.toString()
    };
    print("SELECTCATE");
    print(body);
    var dataJs = json.encode(body);
    try {
      print("POSTAPI");
      var url = Uri.parse(mainUrl+addCategoryUrl);
      print(url);
      print(body);

      http.Response response = await http.post(url,
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: dataJs);
      print(response.statusCode);
      print(response.body);
      var resp = json.decode(response.body);
      getCategory();
      if (resp['message'] == "success")
      {



        newtCatController.clear();
        Get.snackbar("Success", "Category add successfully",
            backgroundColor: Colors.green.withOpacity(0.8),
            colorText: Colors.white,
            icon: Icon(
              Icons.check,
              color: Colors.white,
            ),
            snackPosition: SnackPosition.BOTTOM);
      }
      else
      {
        Get.snackbar("Alert", "${resp['message']}",
            backgroundColor: Colors.black.withOpacity(0.7),
            colorText: Colors.white,
            icon: Icon(
              Icons.warning,
              color: Colors.white,
            ),
            snackPosition: SnackPosition.BOTTOM);
      }
      print(resp);

      return resp;
    } catch (e) {
      print("errror");
      print("----------${e}");
    } finally {
    }
  }

  void getIncomeAndExpenses()
  async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var usId = await prefs.getString('userId');

    try
    {
      Uri url = Uri.parse("$mainUrl$incomeExpenses?date=${formatDate.format(incomeExpenseDate.value)}&user_id=${usId}");
      print("IncomeExpenses");
      print(url);
      http.Response response = await http.get(url);
      var parsedResponse = json.decode(response.body);
      print("incomeValue.value");
      print(parsedResponse['data'][0]['income']);
      print(parsedResponse['data'][0]['expenses']);
      incomeValue.value = 0.0;
      expensesValue.value = 0.0;
      incomeValue.value = double.parse(parsedResponse['data'][0]['income']);
      expensesValue.value = double.parse(parsedResponse['data'][0]['expenses']);
      print(incomeValue.value.toString());
      print(expensesValue.value.toString());

    }
    catch(e)
    {

    }
    finally
    {

    }
  }

  void getAccountsCounts()
  async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var usId = await prefs.getString('userId');

    try
    {
      Uri url = Uri.parse("$mainUrl$accountCountGetUrl?date=${formatDate.format(accountChartDate.value)}&user_id=${usId}");
      print("Account Chart");
      print(url);
      http.Response response = await http.get(url);
      var parsedResponse = json.decode(response.body);
      print("----------"+response.body);
      print("----------"+parsedResponse['data']['income'].toString());
      print("----------"+parsedResponse['data']['expenses'].toString());
      print("----------"+parsedResponse['data']['offline'].toString());

      incomeChart.value = 0.0;
      expensesChart.value = 0.0;
      offlineChart.value = 0.0;
      onlineChart.value = 0.0;
      incomeChart.value = double.parse(parsedResponse['data']['income'].toString());
      expensesChart.value = double.parse(parsedResponse['data']['expenses'].toString());
      offlineChart.value = double.parse(parsedResponse['data']['offline'].toString());
      onlineChart.value = double.parse(parsedResponse['data']['online'].toString());
      print("incomeChart.value.toString()");
      print(incomeChart.value.toString());
      print(expensesChart.value.toString());
      print(offlineChart.value.toString());
      print("++++++++++++++++++++++"+onlineChart.value.toString());


    }
    catch(e)
    {

    }
    finally
    {

    }
  }
}
