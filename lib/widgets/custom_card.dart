import 'package:flutter/material.dart';
import 'package:simple_store_app/models/product_model.dart';
import 'package:simple_store_app/screens/update_product.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdateProductScreen.id,
            arguments: product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.red.withAlpha(10),
                  blurRadius: 10,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Card(
              color: Colors.white,
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      product.title.substring(0, 17),
                      style: const TextStyle(
                          color: Colors.greenAccent, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${product.price.toString()} " r'$',
                          style: const TextStyle(
                              color: Colors.black, fontSize: 14),
                        ),
                        const Icon(Icons.favorite),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 16,
            top: -32,
            child: Image.network(
              product.image,
              height: 100,
              width: 100,
            ),
          ),
        ],
      ),
    );
  }
}
