import 'package:flutter/material.dart';
import 'package:untitled/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RegisterScreenState();
  }
}

class _RegisterScreenState extends State<RegisterScreen> {
  var tabIndex = 0;
  String name = '';
  String number = '';
  String password = '';
  String rePassword = '';
  bool isHiddenPassword = true;

  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 100,
                ),
                GestureDetector(
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
                  },
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: Text(
                    "Register",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            tabIndex = 1;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: tabIndex == 1
                              ? Colors.indigoAccent
                              : Colors.white, // background
                          onPrimary: tabIndex == 1
                              ? Colors.white
                              : Colors.black, // foreground
                        ),
                        child: const Text(
                          'Teacher',
                        ),
                      ),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            tabIndex = 2;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: tabIndex == 2
                              ? Colors.indigoAccent
                              : Colors.white, // background
                          onPrimary: tabIndex == 2
                              ? Colors.white
                              : Colors.black, // foreground
                        ),
                        child: const Text('Students'),
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                      labelText: "Full Name",
                      labelStyle: TextStyle(
                        color: Color(0xff888888),
                        fontSize: 15,
                      )),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter Full Name";
                    }

                    if (!RegExp(
                            r"^([a-zA-Z]{2,}\s[a-zA-z]{1,}'?-?[a-zA-Z]{2,}\s?([a-zA-Z]{1,})?)")
                        .hasMatch(value)) {
                      return "Please enter valid full name";
                    }
                    return null;
                  },
                  onChanged: (value) => setState(() => name = value),
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: "Number phone",
                      labelStyle: TextStyle(
                        color: Color(0xff888888),
                        fontSize: 15,
                      )),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter number";
                    }

                    if (value.length < 10) {
                      return "Please enter valid phone";
                    }

                    return null;
                  },
                  onChanged: (value) => setState(() => number = value),
                ),
                TextFormField(
                  controller: _password,
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
                TextFormField(
                  controller: _confirmPassword,
                  obscureText: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      labelText: "Confirm Password",
                      labelStyle: const TextStyle(
                        color: Color(0xff888888),
                        fontSize: 15,
                      ),
                      suffixIcon: InkWell(
                        onTap: _togglePasswordView,
                        child: const Icon(Icons.visibility),
                      )),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter re-password";
                    }
                    if (_password.text != _confirmPassword.text) {
                      return "Password do not match";
                    }
                    return null;
                  },
                  onChanged: (value) => setState(() => rePassword = value),
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.indigoAccent, // background
                      onPrimary: Colors.white, // foreground
                      padding: const EdgeInsets.symmetric(
                          horizontal: 120, vertical: 15),
                    ),
                    child:
                        const Text('REGISTER', style: TextStyle(fontSize: 12))),
                const SizedBox(
                  height: 30,
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
                            primary: Colors.blueAccent, // background
                            onPrimary: Colors.white, // foreground
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 8),
                          ),
                          child: Image.asset(
                            "images/facebook-logo.jpg",
                            height: 20,
                            width: 20,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white, // background
                            onPrimary: Colors.black, // foreground
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 8),
                          ),
                          child: Image.asset(
                            "images/Google__logo.png",
                            height: 17,
                            width: 17,
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }
}
