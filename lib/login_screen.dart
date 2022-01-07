import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  var remember = true;
  bool isHiddenPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Center(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              const FlutterLogo(
                size: 100,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      labelText: "Email",
                      labelStyle: TextStyle(
                        color: Color(0xff888888),
                        fontSize: 15,
                      )),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter Email";
                    }

                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                        .hasMatch(value)) {
                      return "Email is wrong format";
                    }

                    return null;
                  },
                  onChanged: (value) => setState(() => email = value),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: TextFormField(
                  obscureText: isHiddenPassword,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: const TextStyle(
                        color: Color(0xff888888),
                        fontSize: 15,
                      ),
                      suffixIcon: InkWell(
                        onTap: _togglePasswordView,
                        child: const Icon(Icons.visibility),
                      )),
                  validator: (value) {
                    if (value!.length < 7) {
                      return "Password must be at least 8 characters long.";
                    }
                    if (!RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                        .hasMatch(value)) {
                      return "Password should contain at least one upper case, one lower case, one digit, one Special character.";
                    }
                    return null;
                  },
                  onChanged: (value) => setState(() => password = value),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: remember,
                          shape: const CircleBorder(),
                          onChanged: (newValue) {
                            setState(() {
                              remember = newValue!;
                            });
                          },
                        ),
                        const Text("Remember"),
                      ],
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text("Forgot password?"),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.indigo, // background
                    onPrimary: Colors.white, // foreground
                    padding: const EdgeInsets.symmetric(
                        horizontal: 130, vertical: 12),
                  ),
                  child: const Text('LOGIN', style: TextStyle(fontSize: 16))),
              const SizedBox(
                height: 20,
              ),
              const Text(
                ' or ',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue, // background
                          onPrimary: Colors.white, // foreground
                          padding: const EdgeInsets.symmetric(
                              horizontal: 60, vertical: 8),
                        ),
                        child: Image.asset(
                          "images/facebook-logo.jpg",
                          height: 20,
                          width: 20,
                        ),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white, // background
                          onPrimary: Colors.black, // foreground
                          padding: const EdgeInsets.symmetric(
                              horizontal: 60, vertical: 8),
                        ),
                        child: Image.asset(
                          "images/Google__logo.png",
                          height: 17,
                          width: 17,
                        ),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 100,
              ),
              Center(
                child: GestureDetector(
                  child: RichText(
                      text: const TextSpan(children: [
                    TextSpan(
                        text: "Don't have an account ?",
                        style: TextStyle(color: Colors.black)),
                    TextSpan(
                      text: "Register Now",
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ])),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const RegisterScreen()));
                  },
                ),
              )
            ],
          ),
        ),
      )),
    );
  }

  void _togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }
}
