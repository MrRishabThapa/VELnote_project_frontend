// ignore_for_file: file_names, prefer_const_constructors, unused_element

import 'package:flutter/material.dart';

class MyLogIn extends StatefulWidget {
  const MyLogIn({super.key});

  @override
  State<MyLogIn> createState() => _MyLogInState();
}

class _MyLogInState extends State<MyLogIn> {
  late Color myColor;
  late Size mediaSize;
  TextEditingController emailCotroller = TextEditingController();
  TextEditingController passwordCotroller = TextEditingController();
  bool rememberUser = false;

  get children => null;
  @override
  Widget build(BuildContext context) {
    myColor = Theme.of(context).primaryColor;
    mediaSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: myColor,
        image: DecorationImage(
            image: const AssetImage('assets/login.jpg'),
            fit: BoxFit.fill,
            colorFilter:
                ColorFilter.mode(myColor.withOpacity(0.7), BlendMode.dstATop)),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Positioned(top: 80, child: _buildTop()),
            Positioned(bottom: 0, child: _bulidButtom()),
          ],
        ),
      ),
    );
  }

  Widget _buildTop() {
    return SizedBox(
      width: mediaSize.width,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.book_online,
            size: 1,
            color: Colors.deepPurple,
          )
        ],
      ),
    );
  }

  Widget _bulidButtom() {
    return SizedBox(
      width: mediaSize.width,
      child: Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          )),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: _bulidForm(),
          )),
    );
  }

  Widget _bulidForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ' Hello! \n Ready to dive back in',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w600,
            color: myColor,
          ),
        ),
        const SizedBox(height: 45),
        _makeGreyText('E-mail Address'),
        _buildInputFeild(emailCotroller),
        const SizedBox(height: 15),
        _makeGreyText('Password'),
        _buildInputFeild(passwordCotroller, isPassword: true),
        const SizedBox(height: 15),
        _buildRememberForget(),
        const SizedBox(height: 15),
        _buildLogInButton(),
        const SizedBox(height: 15),
        _buildOtherLogin()
      ],
    );
  }

  Widget _makeGreyText(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(164, 132, 19, 197),
      ),
    );
  }

  Widget _makeLIghtText(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(128, 41, 39, 39),
      ),
    );
  }

  Widget _buildInputFeild(TextEditingController controller,

// create a texteditingcontroller where text can be written in a box
      {isPassword = false}) {
    return TextField(
        controller: controller,
        obscureText: isPassword,
        // make hint text in box grey and lighter shade
        style: TextStyle(
            color: const Color.fromARGB(255, 14, 13, 14),
            fontWeight: FontWeight.w700),
        decoration: InputDecoration(
          hintText: isPassword ? 'Enter Password' : 'Enter E-mail Address',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: Colors.grey)),
        ));
  }

  Widget _buildRememberForget() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(
        children: [
          Checkbox(
              value: rememberUser,
              // make checkbox grey

              onChanged: (value) {
                setState(() {
                  rememberUser = value!;
                });
              }),
          _makeLIghtText('Remember Me'),
        ],
      ),
      Row(children: [
        Icon(
          // make icon grey
          color: Colors.grey,
          size: 25,
          Icons.lock,
        ),
        TextButton(
          onPressed: () {
            debugPrint('Forgot Password');
          },
          child: _makeLIghtText('Forgot Password?'),
        )
      ])
    ]);
  }

  Widget _buildLogInButton() {
    return TextButton(
      onPressed: () {
        debugPrint('Email : ${emailCotroller.text}');
        debugPrint('Password : ${passwordCotroller.text}');
      },
      style: TextButton.styleFrom(
        shape: const StadiumBorder(),
        padding: EdgeInsets.all(10),
        backgroundColor: Colors.deepPurple,
        shadowColor: myColor,
        minimumSize: const Size.fromHeight(60),
      ),
      child: const Text(
        'LOGIN',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildOtherLogin() {
    return Center(
        child: Column(
      children: [
        _makeGreyText('or Login With'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Tab(icon: Image.asset("assets/fb.png")),
            Tab(icon: Image.asset('assets/github.png')),
            Tab(icon: Image.asset('assets/google.png'))
          ],
        )
      ],
    ));
  }
}
