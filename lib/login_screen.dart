import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  String name = "";
  var remember = true;
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
              children:  [
                const SizedBox(height: 100,),
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
                        labelText: "Email / Student Code",
                        labelStyle: TextStyle(
                          color: Color(0xff888888),
                          fontSize: 15,
                        )),
                    validator: (value){
                      if (value!.isEmpty){
                        return "Please enter Email";
                      } else{
                        if (RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}').hasMatch(value)) {
                          return 'Enter correct Email';
                        } else {
                          return null;
                        }
                      }
                    },
                  ),
                  ),
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: TextFormField(
                    obscureText: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(
                          color: Color(0xff888888),
                          fontSize: 15,
                        )),
                    validator: (value){
                      if (value!.isEmpty){
                        return "Please enter password";
                      } else{
                        if (RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$').hasMatch(value)) {
                          return 'Enter correct password';
                        } else {
                          return null;
                        }
                      }
                    },
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
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, // background
                onPrimary: Colors.white, // foreground
                padding: const EdgeInsets.symmetric(horizontal: 130, vertical: 12),
              ),
               child: const Text('LOGIN', style: TextStyle(fontSize: 16))
              ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  ' or ',
                  style: TextStyle( color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 20, ),
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
                            onPressed: (){},
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue, // background
                              onPrimary: Colors.white, // foreground
                              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 8),
                            ),
                            child: Image.asset("images/facebook-logo.jpg", height: 20, width: 20,),
                        ),
                          Expanded(child: Container(),),
                          ElevatedButton(
                              onPressed: (){},
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white, // background
                                onPrimary: Colors.black, // foreground
                                padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 8),
                              ),
                            child: Image.asset("images/Google__logo.png", height: 17, width: 17,),
                          ),
                        ],
                      )
                    ),
                  ],
                ),
          ),
        )
          ),
        );
  }
}