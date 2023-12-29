import 'package:flutter/material.dart';
import 'package:login_page/login.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leadingWidth: 100,
        leading: GestureDetector( child: Padding(
          padding: const EdgeInsets.only(left: 15,),//vertical: 20//
          child: Row(
            children: [
              const Icon(Icons.arrow_back_ios, color: Colors.black87),
              Text('Back', style: TextStyle(color: Colors.black)),
            ],
          ),
        ),
        ),
        // title: const Text('Sign Up'),
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back),
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
      ),
      body: Form(
        key: _formKey,
        child:  Container(
          padding: const EdgeInsets.fromLTRB(20, 90, 20, 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: 5),
                Container( //color: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: const Column(
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Create your account",
                        style: TextStyle(fontSize: 15,),
                      )
                    ],
                  ),
                ),
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                      labelText: 'Name',
                      // suffixIcon: const Icon(Icons.person)
                    //border: OutlineInputBorder(gapPadding: BorderSide.strokeAlignCenter),
                       suffixIcon: const Icon(Icons.person)
                ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      labelText: 'Email',
                    //border: OutlineInputBorder(gapPadding: BorderSide.strokeAlignCenter),
                      suffixIcon: const Icon(Icons.email)
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
                const SizedBox(
                    height: 16
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      labelText: 'Password',
                    //border: OutlineInputBorder(gapPadding: BorderSide.strokeAlignCenter),
                    suffixIcon: const Icon(Icons.password),
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
                const SizedBox(height: 16.0),
                TextFormField(
                  textAlign: TextAlign.left,
                  controller: confirmPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      labelText: 'Confirm Password',
                    //border: OutlineInputBorder(gapPadding: BorderSide.strokeAlignCenter),
                    suffixIcon: const Icon(Icons.password),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    } else if (value != passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 138,
                    ),
                    backgroundColor: Colors.redAccent//alphaBlend(Colors.transparent, Colors.blueAccent),
                  ),
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      // Form is valid, perform sign-up or other actions
                      String name = nameController.text;
                      String email = emailController.text;
                      String password = passwordController.text;

                      // Do something with the data
                      print('Name: $name, Email: $email, Password: $password');

                      // Navigate back to the login page
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Sign Up'),
                ),
                Container(
                  height: 10,
                ),
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: Text('Already have an account?'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MyLogin(),
  ));
}

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leadingWidth: 100,
        leading: GestureDetector(
          child: Padding(
            padding: const EdgeInsets.only(left: 15,),
            child: Row(
              children: [
                const Icon(Icons.arrow_back_ios, color: Colors.black87),
                Text('Back', style: TextStyle(color: Colors.black)),
              ],
            ),
          ),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 150,
            ),
            backgroundColor: Color.alphaBlend(Colors.red, Colors.redAccent),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Mylogin()),
            );
          },
          child: const Text('Sign Up Page'),
        ),
      ),
    );
  }
}