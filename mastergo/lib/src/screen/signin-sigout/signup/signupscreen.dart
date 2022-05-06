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
      body: _signupBody(context),
      resizeToAvoidBottomInset: false,
    );
  }

  Widget _signupBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Image.asset("assets/images/src6.png"),
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
          Container(
            margin: const EdgeInsets.only(
              bottom: 20.0,
            ),
            child: Row(
              children: [
                const Expanded(
                  child: SizedBox(),
                ),
                const Text("Already have an account?"),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SigninScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Color(0xffFFB19D),
                        decoration: TextDecoration.underline),
                  ),
                ),
                const Expanded(
                  child: SizedBox(),
                ),
              ],
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
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      height: 60.0,
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
          const SizedBox(
            width: 8.0,
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
          const SizedBox(
            width: 8.0,
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
