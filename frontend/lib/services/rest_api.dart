// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:frontend/screens/adminScreen/adminPage.dart';
import 'package:frontend/screens/userScreen/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../screens/userScreen/basePage.dart';
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';

class ApiService {
  // SnackBar to use it in the fetching functions
  static showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
          content: Text(message),
          duration: const Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          )),
    );
  }

  // Auth functions
  // Signin function
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
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const MyStatefulWidget()),
            (Route<dynamic> route) => false,
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

  // Signup function
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

// User functions
// Get user info
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

// fetch api to get product by category name
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

// fetch api to get the chats rooms
  static findOrAddRoom(receiver) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");
    var data = jsonEncode({
      "receiver": receiver,
      "sender": sharedPreferences.getString("user_id"),
    });
    var response =
        await http.post(Uri.parse('http://192.168.137.1:3000/find-create-room'),
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization': 'Bearer $token',
            },
            body: data);
    var res = json.decode(response.body);
    return res;
  }

// api to save the message to db
  static sendMessage(receiver, message) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");
    var data = jsonEncode({
      "receiver": receiver,
      "sender": sharedPreferences.getString("user_id"),
      "message": message
    });
    var response =
        await http.post(Uri.parse('http://192.168.137.1:3000/add-chat'),
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization': 'Bearer $token',
            },
            body: data);
    var res = json.decode(response.body);
    return res;
  }

  static getRooms() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");
    var response = await http
        .get(Uri.parse('http://192.168.137.1:3000/get-rooms'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    var data = json.decode(response.body);
    return data;
  }

//  api to search by product name
  static search(product_name) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");
    var response = await http.get(
        Uri.parse('http://192.168.137.1:3000/search/${product_name}'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    var data = json.decode(response.body);
    return data;
  }

//  api to add product to favorite
  static addFavorites(context, productId) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");
    var response = await http.get(
        Uri.parse('http://192.168.137.1:3000/add-to-Favorite/${productId}'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    var data = json.decode(response.body);
    if (data['message'] == "already exist") {
      showSnackBar(context, "Already exist in your favorites");
    }
    if (data['message'] == "success") {
      showSnackBar(context, "Added to your favorites");
    }
  }

// api to get the favorite products
  static getFavorites() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");
    var response = await http
        .get(Uri.parse('http://192.168.137.1:3000/get-favorites'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    var data = json.decode(response.body);
    return data;
  }

// api to remove product from favorite
  static deleteFavorite(context, productId) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");
    var response = await http.get(
        Uri.parse(
            'http://192.168.137.1:3000/delete-from-Favorite/${productId}'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });

    var data = json.decode(response.body);
    if (data['status'] == "success") {
      showSnackBar(context, "product deleted from your favorites");
    } else {
      showSnackBar(context, "something went wrong");
    }
  }

  // api to edit profile
  static Future editProfile(em, File? imageFile, BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");
    var request = http.MultipartRequest(
        'POST', Uri.parse('http://192.168.137.1:3000/edit-Profile'));
    var employee = jsonDecode(em);
    var mimeType = lookupMimeType(imageFile!.path);
    mimeType ??= 'text/plain; charset=UTF-8';
    var ImageList;

    await imageFile.readAsBytes().then((value) => {
          ImageList = value,
        });

    request.headers['Content-Type'] = 'multipart/form-data';
    request.headers['Accept'] = 'application/json';
    request.headers['Authorization'] = 'Bearer $token';
    request.fields.addAll({
      'firstName': employee['firstName'],
      'lastName': employee['lastName'],
      'previousPass': employee['previousPass'],
      'password': employee['password'],
      'confirm_pass': employee['confirm_pass'],
      'imageName': imageFile.path.split('/').last,
    });
    request.files.add(http.MultipartFile.fromBytes('imageFile', ImageList,
        filename: imageFile.path.split('/').last,
        contentType: MediaType.parse(mimeType)));

    var response;
    try {
      response = await request.send();
    } on Exception catch (exception) {
      print('exception1');
      showSnackBar(context, exception.toString());
    } catch (error) {
      showSnackBar(context, error.toString());
    }
    if (response.statusCode == 200) {
      showSnackBar(context, "Profile updated");
      // ignore: use_build_context_synchronously
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => Profile()),
      // );
    } else {
      showSnackBar(context, "Update failed");
    }
  }

//  api to add post
  static Future uploadPost(em, File? imageFile, BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");
    var request = http.MultipartRequest(
        'POST', Uri.parse('http://192.168.137.1:3000/add-Product'));
    var employee = jsonDecode(em);
    var mimeType = lookupMimeType(imageFile!.path);
    mimeType ??= 'text/plain; charset=UTF-8';

    var ImageList;
    await imageFile.readAsBytes().then((value) => {
          ImageList = value,
        });

    request.headers['Content-Type'] = 'multipart/form-data';
    request.headers['Accept'] = 'application/json';
    request.headers['Authorization'] = 'Bearer $token';
    request.fields.addAll({
      'product_name': employee['product_name'],
      'expiry_date': employee['expiry_date'],
      'category': employee['category'],
      'description': employee['description'],
      'productPicture': imageFile.path.split('/').last,
    });
    request.files.add(http.MultipartFile.fromBytes('imageFile', ImageList,
        filename: imageFile.path.split('/').last,
        contentType: MediaType.parse(mimeType)));

    var response;
    try {
      response = await request.send();
    } on Exception catch (exception) {
      print('exception1');
      showSnackBar(context, exception.toString());
    } catch (error) {
      showSnackBar(context, error.toString());
    }
    if (response.statusCode == 200) {
      showSnackBar(context, "post uploaded");
      // ignore: use_build_context_synchronously
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => Profile()),
      // );
    } else {
      showSnackBar(context, "upload failed");
    }
  }

//  Admin apis
//  api to get users
  static getusers() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");
    var response = await http
        .get(Uri.parse('http://192.168.137.1:3000/get-all-users'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    var data = json.decode(response.body);
    return data;
  }

//  api to get users banned
  static getUsersBanned() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");
    var response = await http
        .get(Uri.parse('http://192.168.137.1:3000/get-banned-users'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    var data = json.decode(response.body);
    return data;
  }

//  api to ban user
  static banUser(context, userId) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");
    var response = await http.get(
        Uri.parse('http://192.168.137.1:3000/ban-user/${userId}'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    showSnackBar(context, "User banned");
    return false;
  }

// api to unban user
  static removeBan(context, userId) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");
    var response = await http.get(
        Uri.parse('http://192.168.137.1:3000/remove-ban/${userId}'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    if (response.statusCode == 200) {
      showSnackBar(context, "Ban removed");
      return true;
    }
    showSnackBar(context, "Remove ban failed");
    return false;
  }

//  api to get all posts
  static getPosts() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");
    var response = await http
        .get(Uri.parse('http://192.168.137.1:3000/get-posts'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    var data = json.decode(response.body);
    print(data);
    return data;
  }

//  api to approve post
  static approvePost(context, productId) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");
    var response = await http.get(
        Uri.parse('http://192.168.137.1:3000/approved/${productId}'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    if (response.statusCode == 200) {
      showSnackBar(context, "post are approved");
      return true;
    }
    showSnackBar(context, "post approved failed");
    return false;
  }

//  api to delete post
  static deletePost(context, productId) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");
    var response = await http.get(
        Uri.parse('http://192.168.137.1:3000/delete-post/${productId}'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    if (response.statusCode == 200) {
      showSnackBar(context, "post are deleted");
      return true;
    }
    showSnackBar(context, "post deleted failed");
    return false;
  }
}
