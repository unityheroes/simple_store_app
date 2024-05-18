import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_store_app/widgets/custom_card.dart';
import 'package:simple_store_app/models/product_model.dart';
import 'package:simple_store_app/services/get_all_products_services.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});
  static String id = "HomePageScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(FontAwesomeIcons.cartPlus),
          )
        ],
        backgroundColor: Colors.white,
        title: const Text("Simple Store"),
        centerTitle: true,
      ),
      body: Container(
          color: Colors.white,
          child: FutureBuilder<List<ProductModel>>(
            future: GetAllProductsServices().getAllProducts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("Error: ${snapshot.error}"),
                );
              } else if (snapshot.hasData) {
                List<ProductModel> products = snapshot.data!.toList();
                return Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  child: GridView.builder(
                      itemCount: products.length,
                      clipBehavior: Clip.none,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1.2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 32),
                      itemBuilder: (context, index) {
                        return CustomCard(
                          product: products[index],
                        );
                      }),
                );
              } else {
                return const Center(child: Text("No data available"));
              }
            },
          )),
    );
  }
}
