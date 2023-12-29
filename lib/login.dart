import 'package:flutter/material.dart';
import 'package:login_page/generated/sign_up.dart';

class Mylogin extends StatefulWidget {
  const Mylogin({super.key});

  @override
  _MyloginState createState() => _MyloginState();
}

class _MyloginState extends State<Mylogin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leadingWidth: 100,
        leading: GestureDetector(
          child: Padding(
            padding: const EdgeInsets.only(left: 15,),//vertical: 20//
            child: Row(
              children: [
                const Icon(Icons.arrow_back_ios, color: Colors.black87),
                Text('Back', style: TextStyle(color: Colors.black)),
              ],
            ),
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 180, 20, 5),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50),//
                Container( //color: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 40),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Procced with your',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    TextFormField(
                      //validator: ,
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      // maxLength: 30,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        //hintText: 'Enter the Email',
                        suffixIcon: Icon(Icons.email_rounded),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 0,
                  width: 12,
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    // hintText: 'enter password',
                    suffixIcon: Icon(Icons.key, color: Colors.grey,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    } else if (!RegExp(r'^(?=.*[@])(?=.*[a-zA-Z0-9]).{8,}$').hasMatch(value)) {
                      return 'Password must be at least 8 characters long and contain @ symbol';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 145,
                    ),
                    backgroundColor: Color.alphaBlend(Colors.red, Colors.redAccent),
                  ),
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      String Email = emailController.text;
                      String Password = passwordController.text;
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                      print("Email: $Email, Pass:$Password");
                    }
                  },
                  child: const Text('login'),
                ),
                Container(
                  height: 10,
                ),
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: Text('Forgot Password?'),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: () {
                      // Navigate to the new page for user registration
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          ' Sign Up',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

