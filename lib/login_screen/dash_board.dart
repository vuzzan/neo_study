import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:neo_study/bloc/model/users.dart';
import 'package:http/http.dart' as http;
import 'package:neo_study/bloc/user_bloc.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);
  static const routeName = '/dashboard';

  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final _storage = const FlutterSecureStorage();

  String loginuserame = "";
  var users = <Users>[];
  final UsersBloc _UsersBloc = UsersBloc();
  @override
  void initState() {
    //print("init _DashBoardScreenState  ");
    super.initState();
    //_readAll();
    reloadData();
  }

  void reloadData() async {
    String? token = await _storage.read(key: "token");
    //print("In _DashBoardScreenState  " + token!);
    await _UsersBloc.loadAll(token!);
  }

  Future<void> _readAll() async {
    String? value = await _storage.read(key: "u_name");
    String? token = await _storage.read(key: "token");
    print("In _DashBoardScreenState  " + value!);
    setState(() {
      loginuserame = value;
    });
    final uri =
        Uri.parse('https://neonghia.xyz/npp/api/index.php/records/users');
    final headers = {
      'X-Authorization': 'Bearer ' + token!,
      "Accept": "application/json"
    };
    //Map<String, dynamic> body = {'username': username, 'password': password};
    final encoding = Encoding.getByName('utf-8');

    print("Begin call http");
    final response = await http.get(uri, headers: headers);
    print('response.statusCode=' + response.statusCode.toString());

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      //print(response.body);
      var user_list = json.decode(response.body);
      //print(user_list);
      print(user_list["records"]);
      users = List<Users>.from(
          user_list["records"].map((model) => Users.fromMap(model)));
      return;
      //return Users.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load users');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("list users"),
        ),
        body: buildPage(context));
  }

  @override
  void dispose() {
    _UsersBloc.dispose();
    super.dispose();
  }

  Widget build2(BuildContext context, ListUsers data) {
    return ListView.builder(
        padding: const EdgeInsets.all(3),
        itemCount: data.listdata.length,
        itemBuilder: (BuildContext context, int currentitem) {
          var listWidget = <Widget>[];
          for (Users user in data.listdata) {
            listWidget.add(Card(
                margin: const EdgeInsets.all(2),
                color: Colors.white,
                shadowColor: Colors.blueGrey,
                elevation: 10,
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.white)),
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.abc),
                    title: Text(user.userName!.toString()),
                    subtitle: Text(user.userFullname!.toString(),
                        style: const TextStyle(fontSize: 20)),
                  ),
                  Container(
                      margin: const EdgeInsets.only(
                          top: 0, left: 0, right: 0, bottom: 0),
                      padding: const EdgeInsets.only(
                          top: 3, left: 0, right: 0, bottom: 0),
                      height: 40,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                                flex: 5,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(user.userId!.toString(),
                                      style: const TextStyle(fontSize: 30)),
                                )),
                            Expanded(
                                flex: 5,
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(user.userName!,
                                      style: const TextStyle(fontSize: 30)),
                                )),
                            Expanded(
                                flex: 5,
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(user.userFullname!,
                                      style: const TextStyle(fontSize: 30)),
                                )),
                          ]))
                ])));
          }
          return Container(
              margin: const EdgeInsets.all(2),
              child: Column(children: <Widget>[
                GestureDetector(
                    onTap: () {},
                    child: Card(
                        margin: const EdgeInsets.all(2),
                        color: Colors.white,
                        shadowColor: Colors.blueGrey,
                        elevation: 60,
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.white)),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.all(16.0),
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: listWidget,
                                ),
                              )
                            ])))
              ]));
        });
  }

  buildPage(BuildContext context) {
    return StreamBuilder(
        stream: _UsersBloc.streamObservable,
        builder: (context, AsyncSnapshot<ListUsers> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return build2(context, snapshot.data!);
          }
        });
  }
}
//