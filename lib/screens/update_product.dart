import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:simple_store_app/helper/show_snack_bar.dart';
import 'package:simple_store_app/models/product_model.dart';
import 'package:simple_store_app/services/update_product_services.dart';
import 'package:simple_store_app/widgets/custom_button.dart';
import 'package:simple_store_app/widgets/custom_form_text_field.dart';

class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({super.key});
  static String id = 'UpdateProductScreen';

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  String? productName, description, image, price;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Update Product"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 124,
                ),
                CustomTextField(
                  textHint: "ProductName",
                  onChange: (data) {
                    productName = data;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextField(
                  textHint: "description",
                  onChange: (data) {
                    description = data;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextField(
                  textHint: "image",
                  onChange: (data) {
                    image = data;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextField(
                  textHint: "price",
                  textInputType: TextInputType.number,
                  onChange: (data) {
                    price = data;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButton(
                    onTap: () async {
                      setState(() {
                        isLoading = true;
                      });
                      await updateProduct(product);
                      setState(() {
                        isLoading = false;
                      });
                    },
                    textButton: "Update"),
                const SizedBox(
                  height: 124,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    try {
      await UpdateProductService().updateProduct(
          title: productName == null ? product.title : productName!,
          price: price == null ? product.price.toString() : price!,
          description: description == null ? product.description : description!,
          image: image == null ? product.image : image!,
          category: product.category,
          id: product.id.toString());

      if (mounted) {
        showSnackBar(context, "UPDATED");
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
