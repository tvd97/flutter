import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zingclone/src/screen/signin-sigout/signup/signupscreen.dart';
import '../../categories/categoriesscreen.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SigninScreenBody(),
    );
  }
}

class SigninScreenBody extends StatefulWidget {
  const SigninScreenBody({Key? key}) : super(key: key);

  @override
  State<SigninScreenBody> createState() => _SigninScreenBodyState();
}

class _SigninScreenBodyState extends State<SigninScreenBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _signinBody(context),
      resizeToAvoidBottomInset: false,
    );
  }

  Widget _signinBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: Center(
              child: Image.asset("assets/images/src5.png"),
            ),
          ),
          Expanded(
            flex: 2,
            child: _cols(),
          ),
          Expanded(
            child: _fogot(),
            flex: 1,
          ),
          _inkWellCont(),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: const Center(
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
          _contRow(),
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
                const Text("Don’t have an account?"),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignupScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Color(0xffFFB19D),
                    ),
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
      ],
    );
  }

  Container _fogot() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        children: [
          const Expanded(child: SizedBox()),
          TextButton(
            onPressed: () {},
            child: const Text(
              "Forgot your password?",
              style: TextStyle(
                color: Color(0xffFFB19D),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _inkWellCont() {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CategoriesScreen(),
          ),
        );
      },
      child: Container(
        height: 60.0,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        color: const Color(0xFF20C3AF),
        child: const Center(
          child: Text(
            "Login",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }

  Widget _contRow() {
    return Container(
      height: 60.0,
      margin: const EdgeInsets.symmetric(horizontal: 20),
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
          const SizedBox(width: 5.0),
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
          const SizedBox(width: 5.0),
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
