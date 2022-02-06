import 'package:flutter/material.dart';

import 'dice.dart';

class LogInApp extends StatelessWidget {
  const LogInApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dice game',
      home: LogIn(),
    );
  }
}

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController idController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log in'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: Builder(builder: (context) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const Padding(padding: EdgeInsets.only(top: 50)),
                const Center(
                  child: Image(
                    image: AssetImage('assets/start5/chef.gif'),
                    width: 170.0,
                    height: 190.0,
                  ),
                ),
                Form(
                  child: Theme(
                    data: ThemeData(
                      primaryColor: Colors.teal,
                      inputDecorationTheme: const InputDecorationTheme(
                        labelStyle: TextStyle(
                          color: Colors.teal,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(40.0),
                      child: Column(
                        children: <Widget>[
                          // Keyboard up: [CMD + Shift + K]
                          TextField(
                            controller: idController,
                            decoration: const InputDecoration(
                              labelText: 'Enter "dice"',
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          TextField(
                            controller: passController,
                            decoration: const InputDecoration(
                              labelText: 'Enter Password',
                            ),
                            keyboardType: TextInputType.text,
                            obscureText: true,
                          ),
                          ButtonTheme(
                            minWidth: 100.0,
                            height: 50.0,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.orangeAccent),
                              ),
                              child: const Icon(
                                Icons.arrow_forward,
                              ),
                              onPressed: () {
                                if (idController.text == 'dice' &&
                                    passController.text == '1234') {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              const Dice()));
                                  return;
                                }
                                if (idController.text != 'dice') {
                                  showSnackBar(context, '아이디를 확인하세요.');
                                  return;
                                }
                                if (idController.text != '1234') {
                                  showSnackBar(context, '패스워드를 확인하세요.');
                                  return;
                                }
                                showSnackBar(context, '로그인 정보를 확인하세요.');
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        textAlign: TextAlign.center,
      ),
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.blue,
    ),
  );
}
