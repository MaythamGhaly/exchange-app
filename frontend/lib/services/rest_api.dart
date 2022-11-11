import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/screens/models/product.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../screens/home.dart';
import '../screens/models/user.dart';

class ApiService {
  // static Future<String> getStringValuesSF() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   //Return String
  //   var stringValue = prefs.getString('ReservationApi');

  //   return stringValue;
  // }

  static showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
          content: Text(message),
          duration: const Duration(seconds: 3),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          )),
    );
  }

  static Future<bool> signin(User user, BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var jsonData;
    var headers = {
      'Content-Type': 'application/json',
      'authorization': 'Basic c3R1ZHlkb3RlOnN0dWR5ZG90ZTEyMw=='
    };
    final msg = jsonEncode({
      "email": user.email,
      "password": user.password,
    });
    try {
      var response = await http.post(
          Uri.parse("http://192.168.0.101:3000/auth/login"),
          headers: headers,
          body: msg);
      jsonData = json.decode(response.body);

      if (response.statusCode == 200) {
        if (jsonData['success'] == "false") {
          showSnackBar(context, jsonData['message']);
          return false;
        }
        showSnackBar(context, "Login Success");
        sharedPreferences.setString("token", jsonData['token']);
        return true;
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => HomeController()),
        // );
      } else {
        showSnackBar(context, "Login Failed");
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<List<Product>> getProduct() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");
    var response = await http
        .get(Uri.parse('http://192.168.0.101:3000/get-all-products'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    Iterable l = json.decode(response.body);
    List<Product> data =
        List<Product>.from(l.map((model) => Product.fromJson(model)));
    // List<Product> data = json.decode(response.body) as List<Product>;
    print(data);
    return data;
  }
  // static Future<List<NotAvailableDate>> GetException() async {
  //   String finalUrl;
  //   await getStringValuesSF().then((value) {
  //     finalUrl = value;
  //   });

  //   final response = await http.get('$finalUrl/reservations/GetExceptionDate');

  //   var responseData = jsonDecode(response.body);

  //   List<NotAvailableDate> dates = [];
  //   for (var notavailble in responseData) {
  //     DateTime date = DateTime.parse(notavailble);

  //     dates.add(NotAvailableDate(DateTime(date.year, date.month, date.day)));
  //   }
  //   return dates;
  // }

  // static Future<List<DateTime>> notAvailableDay() async {
  //   String finalUrl;
  //   await getStringValuesSF().then((value) {
  //     finalUrl = value;
  //   });

  //   final response = await http.get('$finalUrl/reservations/GetDatesCount');

  //   var responseData = jsonDecode(response.body);

  //   List<DateTime> dates = [];
  //   for (var notavailble in responseData) {
  //     dates.add(DateTime.parse(notavailble));
  //   }
  //   return dates;
  // }

  // static Future<int> DeleteExceptionDate(DateTime date) async {
  //   String finalUrl;
  //   await getStringValuesSF().then((value) {
  //     finalUrl = value;
  //   });
  //   int result;
  //   final response =
  //       await http.delete('$finalUrl/reservations/DeleteExceptionDate/$date');

  //   var responseData = jsonDecode(response.body);

  //   result = responseData;

  //   return result;
  // }

  // static Future<List<AllInput>> SearchByDate(
  //     DateTime date, BuildContext context) async {
  //   String finalUrl;
  //   List<AllInput> reservationsList = [];
  //   await getStringValuesSF().then((value) {
  //     finalUrl = value;
  //   });

  //   final response =
  //       await http.get('$finalUrl/reservations/SearchByDate/$date');

  //   if (response.statusCode == 200) {
  //     var responseData = jsonDecode(response.body);

  //     for (var r in responseData) {
  //       reservationsList.add(AllInput.fromJson(r));
  //     }

  //     return reservationsList;
  //   } else {
  //     showSnackBar(context, "Reservation Not found");
  //     throw Exception("Reservation Not found");
  //   }
  // }

  // static Future<List<AllInput>> SearchByPhoneNumber(
  //     int phone, BuildContext context) async {
  //   String finalUrl;
  //   List<AllInput> reservationsList = [];
  //   await getStringValuesSF().then((value) {
  //     finalUrl = value;
  //   });

  //   final response =
  //       await http.get('$finalUrl/reservations/SearchByPhoneNumber/$phone');

  //   if (response.statusCode == 200) {
  //     var responseData = jsonDecode(response.body);

  //     for (var r in responseData) {
  //       reservationsList.add(AllInput.fromJson(r));
  //     }

  //     return reservationsList;
  //   } else {
  //     showSnackBar(context, "Reservation Not found");
  //     throw Exception("Reservation Not found");
  //   }
  // }

  // static Future<bool> AddDate(String notAvailableDate) async {
  //   String finalUrl;
  //   await getStringValuesSF().then((value) {
  //     finalUrl = value;
  //   });
  //   String encoded = jsonEncode(notAvailableDate);

  //   final response = await http.post('$finalUrl/Reservations/PostDate',
  //       body: encoded, headers: {"Content-Type": "application/json"});

  //   if (response.statusCode == 200) {
  //     return true;
  //   }
  //   return false;
  // }
}
