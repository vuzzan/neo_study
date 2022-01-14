import 'package:flutter/material.dart';
import 'package:neo_study/login_screen/dash_board.dart';

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

  String resultLogin = "Result text..Neo";
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
            Text(resultLogin),
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
                  onPressed: pressLoginButton,
                  child: const Text('LOGIN'),
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

  // Move login function to outside
  void pressLoginButton() {
    //===> Begin press login
    print("1 Try to get username and password");
    //String username = myControllerUsername.text;
    print("2Username =" + myControllerUsername.text);
    print("3Password =[" + myControllerPassword.text + "]");
    // check username + password.
    // your hand: Press Control + S ( Save )
    // hot reload: r
    // check business logic ( admin/abc123)
    // https://www.tutorialspoint.com/dart_programming/dart_programming_operators.htm
    // and: &&
    // or: ||
    // Check:
    // 1. check username not empty, at least 5 characters
    if (myControllerUsername.text.length == 0) {
      // condition => true => go to this block
      print("4Usename must not empty & >5 chars");
      setState(() {
        resultLogin = "Usename must not empty & >5 chars";
      });
      // function end here
      print("7 END FUNCTION.");
      return;
      // end block
    } else {
      // Continue to step 2
    }
    // 2. Check password not empty, at least 5 characters
    if (myControllerPassword.text.length == 0 ||
        myControllerPassword.text.length < 5) {
      setState(() {
        resultLogin = "Password must not empty, and > 5 chars";
      });
      return;
    }

    // Step 2:
    if (myControllerUsername.text == "admin" &&
        myControllerPassword.text == "abc123") {
      print("5Login succesful");
      setState(() {
        resultLogin = "Login succesful";
      });
      // Navigator to DashBoard screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const DashBoardScreen()),
      );

      /// END
    } else {
      // debug
      print("6Wrong username or password");
      setState(() {
        resultLogin = "Wrong username or password";
      });
    }

    //==> End of login
  }
}
