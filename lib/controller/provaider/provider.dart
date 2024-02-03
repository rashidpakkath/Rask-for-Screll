import 'package:flutter/material.dart';
import 'package:flutter_project_test/model/freezed_model_class.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_project_test/controller/services/services.dart';

/// using riverpod

final getUserProviders = FutureProvider((ref) => UserApiServices.getUsers());

// using provider

class UserProvider extends ChangeNotifier {
  List<UserModel>? _users;

  List<UserModel>? get users => _users;

  Future<void> fetchUsers() async {
    try {
      _users = await UserApiServices.getUsers();
      notifyListeners();
    } catch (e) {
      // Handle errors
      print("Error fetching users: $e");
    }
  }
}
