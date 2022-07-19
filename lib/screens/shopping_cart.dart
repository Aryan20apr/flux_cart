import 'package:flutter/material.dart';
import 'package:flux_cart/cart/cart_items.dart';
class Cart extends StatefulWidget {
  static String id = 'shopping_cart';
  Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        //backgroundColor: Colors.cyanAccent,
        title: Text('Your Cart'),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            // color: Colors.white,
          ),
        ],
      ),

      body: CartItems(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.grey.shade200,borderRadius: BorderRadius.circular(20)),

        child: Row(
          children: <Widget>[
            Expanded(child: ListTile(
              title:Text('Total'),
              subtitle: Text('₹4000'),
            ),
            ),
            Expanded(child:  ElevatedButton(
              onPressed: () {},
              child: Text('CheckOut'),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    // side: BorderSide(color: Colors.red),
                  ),
                  primary: Colors.yellow.shade700,
                  elevation: 5,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            )
          ],
        ),
      ),
    );
  }
}
