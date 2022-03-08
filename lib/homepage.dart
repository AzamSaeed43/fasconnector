import 'register.dart';
import 'sizebox.dart';
import 'package:flutter/material.dart';
import 'login.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static String id = 'HomePage';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('FAS Connector'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
              children: [
                CustomeSizedBox(height: 60),
                Image.asset(
                    'assets/images/NTU.png',
                    fit: BoxFit.cover,
                    scale: 9
                ),
                const Text('Welcome to NTU FAS Connector',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                CustomeSizedBox(height: 50),
                SizedBox(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(onPressed: (){
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                      child: const Text('Login', textScaleFactor: 1.5,)
                  ),
                ),

              ]
          ),
        ),
      ),
    );
  }
}
