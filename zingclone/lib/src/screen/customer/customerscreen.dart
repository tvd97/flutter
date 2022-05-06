import 'package:flutter/material.dart';

class CustomerScreen extends StatelessWidget {
  const CustomerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CustomerScreenBody(),
    );
  }
}

class CustomerScreenBody extends StatefulWidget {
  const CustomerScreenBody({Key? key}) : super(key: key);

  @override
  State<CustomerScreenBody> createState() => _CustomerScreenBodyState();
}

class _CustomerScreenBodyState extends State<CustomerScreenBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _customerbody(context),
    );
  }

  Widget _customerbody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 5.0),
            height: 60,
            child: Row(children: const [
              IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: null,
              ),
              Expanded(
                child: SizedBox(
                  child: Center(
                    child: Text(
                      'Сustomer info',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.menu),
                onPressed: null,
              ),
            ]),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                const Expanded(
                  child: SizedBox(),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Portfolio',
                      style: TextStyle(
                          fontSize: 24.0,
                          fontFamily: 'Ubuntu',
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
                const Expanded(
                  child: SizedBox(),
                ),
                const Expanded(
                  child: Text(
                    'The last completed works of the contractor are shown below.',
                    style: TextStyle(
                      height: 2.0,
                      fontSize: 14.0,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.8,
                    ),
                  ),
                ),
                const Expanded(
                  child: SizedBox(),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              children: [
                Expanded(
                  flex: 4,
                  child: _imageBox(),
                ),
                Expanded(
                  child: _rateBox(),
                  flex: 1,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: _infoBox(),
          ),
        ],
      ),
    );
  }

  Widget _rateBox() {
    return Container(
      alignment: Alignment.centerLeft,
      child: Row(
        children: const [
          Icon(
            Icons.star_rate_rounded,
            color: Color(0xffFFB19D),
          ),
          Icon(
            Icons.star_rate_rounded,
            color: Color(0xffFFB19D),
          ),
          Icon(
            Icons.star_rate_rounded,
            color: Color(0xffFFB19D),
          ),
          Icon(
            Icons.star_rate_rounded,
            color: Color(0xffFFB19D),
          ),
          Icon(
            Icons.star_rate_rounded,
            color: Color(0xffE2E2EF),
          ),
          Expanded(
            child: SizedBox(),
          ),
        ],
      ),
    );
  }

  Widget _infoBox() {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: const Text(
            'Details',
            style: TextStyle(
                fontSize: 24.0,
                fontFamily: 'Ubuntu',
                fontWeight: FontWeight.w900),
          ),
        ),
        const Expanded(
          child: Text(
            'I have been working in this position for over 10 years! I have created many design solutions and I think my main best quality is creativity. If you liked my work, please contact me and see the professionalism and quality of my services.',
            style: TextStyle(
                height: 2.0,
                fontSize: 14.0,
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w500,
                letterSpacing: 0.8),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(
            vertical: 10.0,
          ),
          alignment: Alignment.centerLeft,
          child: TextButton(
              onPressed: () {},
              child: const Text(
                'Read more',
                style: TextStyle(
                    color: Color(0xffFFB19D),
                    fontSize: 16.0,
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w500),
              )),
        ),
      ],
    );
  }

  Widget _imageBox() {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            child: Image.asset('assets/images/ctm.png'),
          ),
          flex: 4,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Image.asset('assets/images/ctmit.png'),
              ),
              Expanded(
                child: Image.asset('assets/images/ctmit.png'),
              ),
              Expanded(
                child: Image.asset('assets/images/ctmit.png'),
              ),
              Expanded(
                child: Image.asset('assets/images/ctmit.png'),
              ),
            ],
          ),
          flex: 1,
        ),
      ],
    );
  }
}
