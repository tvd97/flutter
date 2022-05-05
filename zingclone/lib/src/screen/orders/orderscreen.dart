import 'package:flutter/material.dart';
import 'package:zingclone/src/screen/orders/orders.dart';
import 'package:zingclone/src/screen/payment/paymentscreen.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const OrderScreenBody(),
    );
  }
}

class OrderScreenBody extends StatefulWidget {
  const OrderScreenBody({Key? key}) : super(key: key);

  @override
  State<OrderScreenBody> createState() => _OrderScreenBodyState();
}

class _OrderScreenBodyState extends State<OrderScreenBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _orderBody(),
    );
  }

  List<Orders> data = [
    Orders(src: 'assets/images/1.png', title: 'Balcony repair'),
    Orders(src: 'assets/images/2.png', title: 'Balcony repair'),
    Orders(src: 'assets/images/4.png', title: 'Balcony repair'),
    Orders(src: 'assets/images/3.png', title: 'Balcony repair'),
    Orders(src: 'assets/images/5.png', title: 'Balcony repair'),
    Orders(src: 'assets/images/6.png', title: 'Balcony repair'),
  ];
  Widget _orderBody() {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: Padding(
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
                        'Orders in progress',
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
              child: _gridView(),
            ),
            Container(
              height: 60.0,
              padding: const EdgeInsets.only(bottom: 20.0),
              child: _contButton(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _gridView() {
    return MasonryGridView.count(
      controller: ScrollController(keepScrollOffset: true),
      crossAxisCount: 2,
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 10.0),
          child: SizedBox(
              child: Center(
                  child: Column(
            children: [
              Image.asset(data[index].src),
              const SizedBox(
                height: 5.0,
              ),
              Text(data[index].title),
            ],
          ))),
        );
      },
    );
  }

  Widget _contButton(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 3.0,
                  color: const Color(
                    0xffE2E2E0,
                  ),
                ),
              ),
              child: const Center(child: Text("Skip")),
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 3.0,
                  color: const Color(
                    0xff20C3AF,
                  ),
                ),
              ),
              child: Center(
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PaymentScreen(),
                        ),
                      );
                    },
                    child: const Text("Done")),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
