import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const routeName = '/auth';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Set controller for username
  final myControllerUsername = TextEditingController();
  // Set controller for password
  final myControllerPassword = TextEditingController();
  //End of declare
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("Login Screen - Neo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                margin: const EdgeInsets.all(10),
                child: TextField(
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                  ),

                  controller:
                      myControllerUsername, // 2.Set controller to textfield
                  // upload to github ...
                )),
            Container(
                margin: const EdgeInsets.all(10),
                child: TextField(
                  controller: myControllerPassword, // set controller password
                  obscureText: false,

                  //style: const TextStyle(fontSize: 30.0, color: Colors.blue),
                  decoration: InputDecoration(
                    // focusedBorder: OutlineInputBorder(
                    //   borderSide: const BorderSide(color: Colors.white),
                    //   borderRadius: BorderRadius.circular(25.7),
                    // ),
                    // enabledBorder: UnderlineInputBorder(
                    //   borderSide: const BorderSide(color: Colors.white),
                    //   borderRadius: BorderRadius.circular(25.7),
                    // ),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "input your password",
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.red,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    labelText: 'Password',
                    hintStyle: const TextStyle(
                      color: Colors.red,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                )),
            Container(
                margin: const EdgeInsets.all(10),
                child: ElevatedButton(
                  //
                  // ElevatedButton example in google.
                  //
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blueAccent, // background
                      onPrimary: Colors.white, // foreground
                      textStyle: const TextStyle(fontSize: 30)),
                  onPressed: () {
                    print("Try to get username and password");
                    //String username = myControllerUsername.text;
                    print("Username =" + myControllerUsername.text);
                    print("Password =[" + myControllerPassword.text + "]");
                    // check username + password.
                    // your hand: Press Control + S ( Save )
                    // hot reload: r
                  },
                  child: Text('LOGIN 2'),
                ))
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
