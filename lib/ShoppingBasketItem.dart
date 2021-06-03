import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/product.dart';

typedef OnRemovePressed(int index);

class ShoppingBasketItem extends StatefulWidget {
  Product _product;
  int _count = 0;
  int _index;
  OnRemovePressed _onRemovePressed;

  ShoppingBasketItem(this._product, this._onRemovePressed, this._index);

  @override
  _ShoppingBasketItemState createState() => _ShoppingBasketItemState();
}

class _ShoppingBasketItemState extends State<ShoppingBasketItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        height: 150,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.only(left: 10, right: 20),
                child: Image.network(
                  widget._product.imageUrl,
                  width: 100,
                  height: 100,
                )),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 40, right: 20),
                  child: Text(
                    widget._product.productName,
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 25),
                  child: Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      GestureDetector(
                        child: Icon(
                          Icons.chevron_right,
                          size: 35,
                        ),
                        onTap: () {
                          Increment();
                        },
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(widget._count.toString()),
                      SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          Decrement();
                        },
                        child: Icon(
                          Icons.chevron_left,
                          size: 35,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 15, top: 20, bottom: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                          onTap: () {
                            widget._onRemovePressed(widget._index);
                          },
                          child: Icon(Icons.delete)),
                      Text(
                        widget._product.price,
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget bodyUI() {
    if (widget._product == null) {
      return Card(
        elevation: 5,
        child: Container(
          height: 100,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Text(
                      "سبد خرید شما خالی میباشد",
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }
  }

  void Increment() {
    setState(() {
      widget._count++;
    });
  }

  void Decrement() {
    setState(() {
      if (widget._count == 0) return;
      widget._count--;
    });
  }
}
