import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/screens/adminPage.dart';
import 'package:frontend/screens/login.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../screens/basePage.dart';
import '../screens/home.dart';

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

  static Future signin(email, password, BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var jsonData;
    var headers = {
      'Content-Type': 'application/json',
      'authorization': 'Basic c3R1ZHlkb3RlOnN0dWR5ZG90ZTEyMw=='
    };
    final msg = jsonEncode({
      "email": email,
      "password": password,
    });
    try {
      var response = await http.post(
          Uri.parse("http://192.168.137.1:3000/auth/login"),
          headers: headers,
          body: msg);
      jsonData = json.decode(response.body);

      if (response.statusCode == 200) {
        // ignore: use_build_context_synchronously
        showSnackBar(context, "Login Success");
        sharedPreferences.setString("token", jsonData['token']);
        sharedPreferences.setString("user_id", jsonData['user']['_id']);
        if (jsonData['user']['type'] == 'User') {
          // ignore: use_build_context_synchronously
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MyStatefulWidget()),
          );
        }
        if (jsonData['user']['type'] == 'Admin') {
          // ignore: use_build_context_synchronously
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const adminPage()),
          );
        }
      } else {
        showSnackBar(context, "Login Failed");
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future signUp(first_name, last_name, email, password, confirm_pass,
      BuildContext context) async {
    var headers = {
      'Content-Type': 'application/json',
      'authorization': 'Basic c3R1ZHlkb3RlOnN0dWR5ZG90ZTEyMw=='
    };
    final msg = jsonEncode({
      "first_name": first_name,
      "last_name": last_name,
      "email": email,
      "password": password,
      "confirm_pass": confirm_pass
    });
    try {
      var response = await http.post(
          Uri.parse("http://192.168.137.1:3000/auth/signup"),
          headers: headers,
          body: msg);
      print(response.body);
      if (response.statusCode == 200) {
        // ignore: use_build_context_synchronously
        showSnackBar(context, "Register Success");
        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Login()),
        );
      } else {
        showSnackBar(context, "register Failed");
      }
    } catch (e) {
      print(e);
    }
  }

  static getUserr() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");
    var response = await http
        .get(Uri.parse('http://192.168.137.1:3000/get-user'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    var data = json.decode(response.body);
    return data;
  }

  static getProductByCategory(category) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");
    var response = await http.get(
        Uri.parse(
            'http://192.168.137.1:3000/get-products-by-category/${category}'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    var data = json.decode(response.body);
    return data;
  }

  static Future editProfile(first_name, last_name, password, confirm_password,
      image, BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");
    final msg = jsonEncode({
      "first_name": first_name,
      "last_name": last_name,
      "password": password,
      "confirm_password": confirm_password,
      "profilePicture": image
    });
    try {
      var response =
          await http.post(Uri.parse('http://192.168.137.1:3000/edit-Profile'),
              headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json',
                'Authorization': 'Bearer $token',
              },
              body: msg);
      var jsonData = json.decode(response.body);
      if (response.statusCode == 200) {
        showSnackBar(context, "Edit Success");
      } else {
        showSnackBar(context, "Edit Failed");
      }
    } catch (e) {
      print(e);
      showSnackBar(context, "Edit Failed");
    }
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
