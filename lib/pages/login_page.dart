import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ujicoba_uas/dashboard.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _messangerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MyLogin(),
    );
  }
}

/////

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final snackBar = SnackBar(
    content: const Text(''),
    action: SnackBarAction(
      label: '',
      onPressed: () {},
    ),
  );

  bool visibilityPass = false;

  //  void toggle(){
  //   setState(() {
  //     visibilityPass = !visibilityPass;
  //   });
  // }

  final String user = 'jamjam';
  final String pass = '12345';

  TextEditingController cUser = TextEditingController();
  TextEditingController cPass = TextEditingController();

  showToast() {
    setState(() {
      Fluttertoast.showToast(
          msg: 'Kamu lupa passwordnya apa?',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: Scaffold(
    
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          
          image: DecorationImage(
            image: AssetImage('images/login_background.jpg'),
            fit: BoxFit.cover,
            
          ),
        ),
        child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
//Text 'Welcome,'
          Container(
            margin: const EdgeInsets.only(left: 15),
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Welcome,',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    fontFamily: 'ChakraPetch'),
              ),
            ),
          ),

// Text 'Sign in to continue!'
          Container(
            margin: const EdgeInsets.only(
              left: 15,
              bottom: 100,
            ),
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Sign in to continue!',
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 30,
                    fontFamily: 'ChakraPetch'),
              ),
            ),
          ),

//TextFiled Username
          Container(
            padding: const EdgeInsets.all(15),
            child: Column(children: [
              TextField(
                controller: cUser,
                decoration: const InputDecoration(
                  border:
                      OutlineInputBorder(borderSide: BorderSide(width: 1.5)),
                  labelText: 'Username',
                  hintText: 'Input Username Anda',
                  prefixIcon: Icon(Icons.person),
                ),
              ),

              const SizedBox(
                height: 15,
              ),
//TextFiled Password
              TextField(
                controller: cPass,
                obscureText: !visibilityPass,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(width: 1.5)),
                  labelText: 'Password',
                  hintText: 'Input Password Anda',
                  prefixIcon: const Icon(Icons.lock),
                  
//Icon Visibility (Mata)
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          visibilityPass = !visibilityPass;
                        });
                      },
                      icon: visibilityPass
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off)),
                ),
              ),
              const SizedBox(
                height: 0,
              ),

//Forget Password

              Builder(
                builder: (context) => Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    // TextButton(
                    //     onPressed: () {
                    //       Navigator.push(
                    //           context,
                    //           MaterialPageRoute(
                    //               builder: (context) => RegisterPage()));
                    //     },
                    //     child: const Text('Sign up',
                    //         style: TextStyle(fontWeight: FontWeight.bold,
                    //         fontSize: 20,
                    //         fontFamily: 'ChakraPetch', color: Color.fromARGB(255, 0, 38, 141)),
                    //         ),
                    //         ),
                    MaterialButton(
                      onPressed: () {
                        showToast();
                      },
                      padding: const EdgeInsets.only(left: 177),
                      child: const Text("Forget password",style: TextStyle(fontWeight: FontWeight.normal,
                            fontSize: 15,
                            fontFamily: 'ChakraPetch'),),
                    ),
                    
                  ],
                ),
              ),

              const SizedBox(
                height: 30,
              ),


//Button Login
              ElevatedButton(
                onPressed: () {
                  CekLogin(context);
                },
                style:
                    ElevatedButton.styleFrom(minimumSize: const Size(250, 50), backgroundColor: const Color.fromARGB(255, 0, 38, 141),),
                child: const Text(
                  'LOGIN',
                  style: TextStyle(fontSize: 25),
                ),
              ),

              const SizedBox(
                height: 5,
              ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    );
  }

  // ignore: non_constant_identifier_names
  void CekLogin(BuildContext context) {
    // final String user = 'jamjam';
    // final String pass = '12345';

    //&& kedua terpenuhi

    if (cUser.text == user && cPass.text == pass) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Dashboard()));
    }else if (cUser.text == user && cPass.text != pass) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password Salah'),
          backgroundColor: Colors.blue,
        ),
      );
    }else if (cUser.text != user && cPass.text == pass) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Username Salah'),
          backgroundColor: Colors.blue,
        ),
      );
    }else  if (cUser.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Username Harus Diisi'),
          backgroundColor: Colors.blue,
        ),
      );
    }else if (cPass.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password Harus Diisi'), 
          backgroundColor: Colors.blue, 
        ), 
      );

      // } else if (cUser.text.isEmpty && cPass.text.isEmpty) {
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     const SnackBar(
      //       content: Text('Username dan Password Harus Diisi'),
      //       backgroundColor: Colors.blue,
      //     ),
      //   );

    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('User dan Password Anda Salah'),
          backgroundColor: Colors.blue,
        ),
      );
    }
  }
}
