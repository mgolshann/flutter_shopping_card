import 'package:flutter/material.dart';
import 'package:flutter_app/ShoppingBasketData.dart';
import 'package:flutter_app/ShoppingBasketItem.dart';

class ShoppingBasket extends StatefulWidget {
  @override
  _ShoppingBasketState createState() => _ShoppingBasketState();
}

class _ShoppingBasketState extends State<ShoppingBasket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "سبد خرید شما",
          style: TextStyle(color: Colors.blueGrey),
        ),
        centerTitle: true,
        leading: Icon(
            Icons.arrow_back
        ),
        elevation: 1,
      ),
      body: BasketUI(),
    );
  }

  Widget BasketUI() {
    if (ShoppingBasketData
        .getInstance()
        .basketItems
        .length == 0) {
      return Card(
        elevation: 5,
        child: Container(
          height: 100,
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.only(top: 35),
            child: Text(
              "شبد خرید شما خالی میباشد",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16
              ),
            ),
          ),
        ),
      );
    }
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 85),
          child: ListView.builder(
            itemCount: ShoppingBasketData
                .getInstance()
                .basketItems
                .length,
            itemBuilder: (context, position) {
              return GestureDetector(
                child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: ShoppingBasketItem(ShoppingBasketData
                      .getInstance()
                      .basketItems[position], removeItem, position),
                ),
              );
            },
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Material(
            color: Colors.red,
            child: InkWell(
              onTap: () {

              },
              child: Container(
                height: 80,
                child: Center(
                  child: Text("پرداخت", style: TextStyle(color: Colors.white, fontSize: 20),),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  void removeItem(int index) {
    setState(() {
      ShoppingBasketData
          .getInstance()
          .basketItems
          .removeAt(index);
    });
  }
}
