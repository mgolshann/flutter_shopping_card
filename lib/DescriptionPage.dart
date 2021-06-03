import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/ShoppingBasketData.dart';
import 'product.dart';

class DescriptionPage extends StatelessWidget {
  Product _product;

  DescriptionPage(this._product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'فروشگاه',
            style: TextStyle(color: Colors.black45),
          ),
          leading: Icon(
            Icons.arrow_back,
            color: Colors.black45,
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Align(
                child: Text(
                  'Shoes',
                  style: TextStyle(
                    color: Colors.red[600],
                    fontSize: 30,
                  ),
                ),
                alignment: Alignment.topLeft,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Image.network(
                _product.imageUrl,
                width: 300,
                height: 300,
                fit: BoxFit.contain,
              ),
            ),
            Text(
              _product.price,
              style: TextStyle(
                color: Colors.red[700],
                fontSize: 20,
              ),
            ),
            Text(
              _product.productName,
              style: TextStyle(color: Colors.black54, fontSize: 18),
            ),
            Padding(
              padding: EdgeInsets.only(left: 45, right: 45),
              child: Text(
                _product.description,
                style: TextStyle(color: Colors.grey[500], fontSize: 16),
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Align(
                    child: GestureDetector(
                      onTap: (){
                        ShoppingBasketData.getInstance().basketItems.add(_product);
                      },
                      child: Container(
                        child: Center(
                          child: Text(
                            "اضافه رکدن به سبد خرید",
                            style: TextStyle(
                              color: Colors.white
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.red[600],
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                          height: 50,
                          width: MediaQuery.of(context).size.width - 50,
                        ),
                    ),
                      alignment: Alignment.bottomCenter,
                ),
              )
            ),
          ],
        ));
  }
}
