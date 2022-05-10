// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorState();
}

class _CalculatorState extends State<CalculatorScreen> {
  final diem1 = TextEditingController(text: "0");
  final diem2 = TextEditingController(text: "0");
  final diem3 = TextEditingController(text: "0");
  final KetQua = TextEditingController();

  get label => null;

  //var controller;
  @override
  Widget build(BuildContext context) {
    //var
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text("APP TINH DIEM"),
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
              Container(
                margin: const EdgeInsets.all(5),
                child: TextField(
                    controller: diem1,
                    obscureText: false,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Điểm kiểm tra thường xuyên',
                    )),
              ),
              Container(
                margin: const EdgeInsets.all(5),
                child: TextField(
                  controller: diem2,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Diem TB"),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(5),
                child: TextField(
                  controller: diem2,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "TB Mon"),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: ElevatedButton(
                  onPressed: calculator,
                  child: Text("+"),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(5),
                child: TextField(
                  controller: KetQua,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Ket Qua"),
                ),
              ),
            ])));
  }

  void cal() {
    print("cal");
  }

  void calculator() {
    print("Calcualator");
    KetQua.text = "1234";
  }
}
