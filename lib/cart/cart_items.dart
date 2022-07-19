import 'package:flutter/material.dart';
import 'package:flux_cart/cart/cart_list.dart';
import 'package:flux_cart/constants.dart';
class CartItems extends StatefulWidget {
  const CartItems({Key? key}) : super(key: key);

  @override
  State<CartItems> createState() => _CartItemsState();
}


class _CartItemsState extends State<CartItems> {

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(itemBuilder: (context,index)
      {
        return SingleCartItem(name: productsInCart[index]['name'],
        picture: productsInCart[index]['picture'],
            price: productsInCart[index]['price'],
            quantity: productsInCart[index]['quantity'],
          size: productsInCart[index]['size'],
          color: productsInCart[index]['color'],
        );
      },
    itemCount: productsInCart.length,);
  }
}
class SingleCartItem extends StatelessWidget {
  const SingleCartItem({Key? key, this.name, this.picture, this.price, this.quantity, this.size, this.color}) : super(key: key);
  final name;
  final picture;
  final price;
  final quantity;
  final size;
  final color;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(

        //*****************Leading Section*****************
        leading: Image.asset(picture,fit: BoxFit.cover,),
        //---------------Title Section---------------------
        title: Text(name,style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18)),
        //*************************  Subtitle  **************************************
        subtitle: Column(
          children: <Widget>[
               Row(
                 children: <Widget>[
                   Padding(//------------------Product size
                     padding: const EdgeInsets.all(0),
                     child: Text('Size',style:TextStyle(color: Colors.red,fontWeight: FontWeight.bold)),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(4),
                     child: Text(size,style:TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold),),
                   ),
                   Padding(//-----------------------------Product color
                     padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                     child: Text('Color',style:TextStyle(color: Colors.red,fontWeight: FontWeight.bold)),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(4.0),
                     child: Text(color,style:TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold)),
                   ),
                   /*Padding(//-----------------------------Product quantity------------
                     padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                     child: Text('Quantity',style:TextStyle(color: Colors.red,fontWeight: FontWeight.bold)),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(4.0),
                     child: Text(quantity,style:TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold)),
                   ),*/
                 ],
               ),
            //------------------------Product Price---------------------
            Container(
            alignment:Alignment.topLeft
                ,child: Text('$rs$price',style: TextStyle(fontSize: 20,color: Colors.indigo,fontWeight: FontWeight.w700),))
          ],
        ),
        trailing: Column(

          children: <Widget>[
            IconButton(onPressed: (){}, icon: Icon(Icons.arrow_drop_up_rounded),),
            Text(quantity),
            IconButton(onPressed: (){}, icon: Icon(Icons.arrow_drop_down_rounded),)
          ],
        ),
      ),
    );
  }
}

