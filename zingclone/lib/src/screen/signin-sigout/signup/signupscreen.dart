import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zingclone/src/screen/signin-sigout/signin/signin.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      //darkTheme: ThemeData.dark(),
      home: const SignupScreenBody(), debugShowCheckedModeBanner: false,
    );
  }
}

class SignupScreenBody extends StatefulWidget {
  const SignupScreenBody({Key? key}) : super(key: key);

  @override
  State<SignupScreenBody> createState() => _SignupScreenBodyState();
}

class _SignupScreenBodyState extends State<SignupScreenBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   foregroundColor: Colors.black,
      //   elevation: 0,
      //   title: const Center(child: Text("Sign Up")),
      //   leading: IconButton(
      //     icon: const Icon(Icons.arrow_back_ios),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //   ),
      //   actions: <Widget>[
      //     IconButton(
      //       onPressed: () {
      //         Drawer(
      //           elevation: 100.0,
      //           child: Container(
      //             width: 100.0,
      //             child: Padding(
      //               padding: const EdgeInsets.symmetric(vertical: 50.0),
      //               child: Column(
      //                 children: [
      //                   Expanded(
      //                     child: Column(
      //                       children: [
      //                         FloatingActionButton(
      //                           onPressed: () {},
      //                           child: const Icon(Icons.home),
      //                         ),
      //                         const Text('Messages'),
      //                       ],
      //                     ),
      //                   ),
      //                   Expanded(
      //                     child: Column(
      //                       children: [
      //                         FloatingActionButton(
      //                           onPressed: () {},
      //                           child: const Icon(Icons.account_circle),
      //                         ),
      //                         const Text('Messages'),
      //                       ],
      //                     ),
      //                   ),
      //                   Expanded(
      //                     child: Column(
      //                       children: [
      //                         FloatingActionButton(
      //                           onPressed: () {},
      //                           child: const Icon(
      //                             Icons.settings,
      //                           ),
      //                         ),
      //                         const Text('Messages'),
      //                       ],
      //                     ),
      //                   ),
      //                   Expanded(
      //                     child: Column(
      //                       children: [
      //                         FloatingActionButton(
      //                           onPressed: () {},
      //                           child: const Icon(Icons.mail),
      //                         ),
      //                         const Text('Messages'),
      //                       ],
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ),
      //         )
      //       },
      //       icon: const Icon(Icons.menu),
      //     ),
      //   ],
      // ),
      body: _signupBody(context),
      drawer: _drawer(),
      resizeToAvoidBottomInset: false,
    );
  }

  Drawer _drawer() {
    return Drawer(
      elevation: 100.0,
      child: SizedBox(
        width: 100.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50.0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    FloatingActionButton(
                      onPressed: () {},
                      child: const Icon(Icons.home),
                    ),
                    const Text('Messages'),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    FloatingActionButton(
                      onPressed: () {},
                      child: const Icon(Icons.account_circle),
                    ),
                    const Text('Messages'),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    FloatingActionButton(
                      onPressed: () {},
                      child: const Icon(
                        Icons.settings,
                      ),
                    ),
                    const Text('Messages'),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    FloatingActionButton(
                      onPressed: () {},
                      child: const Icon(Icons.mail),
                    ),
                    const Text('Messages'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signupBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Image.asset("assets/images/src5.png"),
            ),
            flex: 4,
          ),
          Expanded(
            flex: 4,
            child: _cols(),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                _inkWellCont(),
                const Expanded(
                  child: SizedBox(
                    child: Center(
                      child: Text(
                        "or",
                        style: TextStyle(
                          color: Color(0xff838391),
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  child: _contRow(),
                ),
              ],
            ),
          ),
          const Expanded(child: SizedBox()),
          Center(
            child: Container(
              margin: const EdgeInsets.only(bottom: 40.0),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: Row(
                  children: [
                    const Text("Already have an account? "),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SigninScreen()),
                        );
                      },
                      child: const Text(
                        'Sign In',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _cols() {
    return Column(
      children: [
        Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            color: const Color(0xffF7F7F7),
            child: const Center(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Username ',
                  border: InputBorder.none,
                ),
              ),
            ),
            height: 60.0,
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            color: const Color(0xffF7F7F7),
            child: const Center(
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password ',
                  border: InputBorder.none,
                ),
              ),
            ),
            height: 60.0,
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            color: const Color(0xffF7F7F7),
            child: const Center(
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Confirm password ',
                  border: InputBorder.none,
                ),
              ),
            ),
            height: 60.0,
          ),
        ),
      ],
    );
  }

  Widget _inkWellCont() {
    return InkWell(
      child: Container(
        height: 60.0,
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        color: const Color(0xFF20C3AF),
        child: Center(
          child: TextButton(
            onPressed: () {},
            child: const Text(
              "Sign Up",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 16.0,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _contRow() {
    return Container(
      height: 60.0,
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.0,
                    color: const Color(
                      0xffE2E2E0,
                    ),
                  ),
                ),
                child:
                    Center(child: SvgPicture.asset('assets/svgs/f_icon.svg')),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.0,
                    color: const Color(
                      0xffE2E2E0,
                    ),
                  ),
                ),
                child:
                    Center(child: SvgPicture.asset('assets/svgs/t_icon.svg')),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.0,
                  color: const Color(
                    0xffE2E2E0,
                  ),
                ),
              ),
              child: InkWell(
                child:
                    Center(child: SvgPicture.asset('assets/svgs/in_icon.svg')),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
