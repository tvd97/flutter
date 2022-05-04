import 'package:flutter/material.dart';
import 'package:zingclone/src/screen/customer/customerscreen.dart';
import 'package:zingclone/src/screen/payment/model/payment.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PaymentScreenBody(),
    );
  }
}

class PaymentScreenBody extends StatefulWidget {
  const PaymentScreenBody({Key? key}) : super(key: key);

  @override
  State<PaymentScreenBody> createState() => _PaymentScreenBodyState();
}

class _PaymentScreenBodyState extends State<PaymentScreenBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _constructionbody(context),
    );
  }

  List<Payment> payments = [
    Payment(id: 1, src: 'assets/images/p1.png', text: 'Welding works', price: 40),
    Payment(id: 2, src: 'assets/images/p2.png', text: 'Foundation works', price: 55),
    Payment(id: 3, src: 'assets/images/p3.png', text: 'Waterproofing', price: 20),
  ];
  int _total() {
    int total = 0;
    for (Payment item in payments) {
      total += item.price;
    }
    return total;
  }

  Widget _constructionbody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
                      'Payment for services',
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
            child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0),
                child: Center(child: _listView())),
          ),
          SizedBox(
            height: 60.0,
            child: Row(
              children: [
                const Text("Total",style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w500),),
                const Expanded(
                  child: SizedBox(),
                ),
                Text('\$${_total().toString()}',style: const TextStyle(
                        fontSize: 24.0,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w500),),
              ],
            ),
          ),
          const Expanded(
            child: SizedBox(),
          ),
          InkWell(
            child: Container(
              height: 60.0,
              color: const Color(0xFF20C3AF),
              child: Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CustomerScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "Check out",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 60.0,
            margin: const EdgeInsets.only(top: 20.0),
            padding: const EdgeInsets.only(bottom: 40.0),
            child: const TextButton(
              onPressed: null,
              child: Text(
                'Continue Shopping',
                style: TextStyle(
                  color: Color(0xffFFB19D),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _listView() {
    return ListView.builder(
      itemCount: payments.length,
      itemBuilder: (_, int index) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 5.0),        
          height: 60,
          child: Row(
            children: [
              SizedBox(
                width: 60,
                child: Center(child: Image.asset(payments[index].src)),
              ),            
              Container(
                padding: const EdgeInsets.only(left: 20.0),
                child: FittedBox(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    payments[index].text,
                    style: const TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: 60,
                child: Center(
                  child: Text(
                    '\$${payments[index].price}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 24.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
