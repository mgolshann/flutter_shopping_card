import 'dart:convert';
import 'package:flutter/material.dart';
import 'ShopBottomNavigator.dart';
import 'package:http/http.dart';
import 'product.dart';
import 'DescriptionPage.dart';
import 'BranchesPage.dart';
import 'package:flutter/services.dart';
import 'ShoppingBasket.dart';

void main() { runApp(mainMaterial()); }

class mainMaterial extends StatefulWidget {
  @override
  _mainMaterialState createState() => _mainMaterialState();
}

class _mainMaterialState extends State<mainMaterial> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Store(),
    );
  }
}

class Store extends StatefulWidget {
  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> {

  List<Product> _items = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.red[600],
      statusBarBrightness: Brightness.light
    ));
    fetchItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'فروشگاه کفش',
            style: TextStyle(color: Colors.black45),
          ),
          centerTitle: true,
          leading: Icon(
            Icons.arrow_back,
            color: Colors.black45,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              icon: Icon(
                Icons.map,
                color: Colors.black45,
              ),
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context)=> BrancesPage()
                ));
              },
            ),
            IconButton(
              icon: Icon(
                Icons.shopping_basket,
                color: Colors.black45,
              ),
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context)=> ShoppingBasket()
                ));
              },
            )
          ],
        ),
        body: GridView.count(
            crossAxisCount: 2,
            children: List.generate(_items.length, (int position) {
              return generateItem(_items[position], context);
            })),
        bottomNavigationBar: ShopBottomNavigator(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red[600],
          child: Icon(
            Icons.add,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void fetchItems() async{
    var url = "http://welearnacademy.ir/flutter/products_list.json";
    Response response = await get(url);
    setState(() {
      var productJson = json.decode(utf8.decode(response.bodyBytes));
      for (var i in productJson) {
        var productItem = Product(
          i['product_name'],
          i['id'],
          i['price'],
          i['image_url'],
          i['off'],
          i['description']
        );
        _items.add(productItem);
      }
    });
  }
}



Card generateItem(Product product, context) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(30))
    ),
    child: InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context)=> DescriptionPage(product)
        ));
      },
      child: Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 130,
              height: 130,
              child: Image.network(product.imageUrl),
            ),
            Text(
              product.price,
              style: TextStyle(
                  fontFamily: "Vazir", color: Colors.red[700], fontSize: 16.0),
            ),
            Text(
              product.productName,
              style: TextStyle(
                  fontFamily: "vazir", fontSize: 13.0, color: Colors.black),
            )
          ]
      ),
    ),
    )
  );
}
