import 'package:flutter/material.dart';
import 'package:flux_cart/screens/product_details.dart';
import 'package:flux_cart/products_list.dart';
class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: product_list.length,
        itemBuilder: (BuildContext context, int index) {
          return Single_product(index: index,
            name: product_list[index]['name'],
            picture: product_list[index]['picture'],
            oldPrice: product_list[index]['old_price'],
            price: product_list[index]['price'],
          );
        });
  }
}

class Single_product extends StatelessWidget {
  const Single_product(
      {Key? key, this.name, this.picture, this.oldPrice, this.price,required this.index})
      : super(key: key);
  final name;
  final picture;
  final oldPrice;
  final price;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Hero(
          tag: Text(name),
          child: Material(
            child: InkWell(
              onTap: ()=>
              Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>ProductDetails(index: index))),//Pass the index of current product
              child: GridTile(
                  child: Image.asset(
                    picture,
                    fit: BoxFit.cover,
                  ),
                  footer: Container(
                    color: Colors.white70,
                    child: ListTile(
                      leading: Text(
                        name,
                        style: TextStyle(color: Colors.black),
                      ),
                      title: Text(
                        '\$$price',
                        style: const TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        '\$$oldPrice',
                        style: const TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.lineThrough),
                      ),
                    ),
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
