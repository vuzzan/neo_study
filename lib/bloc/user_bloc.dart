import 'dart:async';
import 'dart:convert';

import 'package:rxdart/rxdart.dart';

import 'model/users.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;

class UsersBloc {
  late BehaviorSubject<ListUsers> _subject;

  late ListUsers listuser;

  UsersBloc() {
    listuser = ListUsers();
    _subject = BehaviorSubject<ListUsers>.seeded(listuser);
  }

  Stream<ListUsers> get streamObservable => _subject.stream;

  void dispose() {
    _subject.close();
  }

  Future<void> loadAll(String token) async {
    //String? token = await _storage.read(key: "token");
    final uri =
        Uri.parse('https://neonghia.xyz/npp/api/index.php/records/users');
    final headers = {
      'X-Authorization': 'Bearer ' + token,
      "Accept": "application/json"
    };
    final response = await http.get(uri, headers: headers);

    print('Load users: ' + response.statusCode.toString());
    if (response.statusCode == 200) {
      var listData = json.decode(response.body);
      listuser.listdata = List<Users>.from(
          listData["records"].map((model) => Users.fromMap(model))).toList();

      print('Load users count: ' + listuser.listdata.length.toString());
      _subject.sink.add(listuser);
    } else {
      print('Failed to load users');
      //throw Exception('Failed to load users');
    }
  }
}
