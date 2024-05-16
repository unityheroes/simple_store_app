import 'package:simple_store_app/helper/api.dart';
import 'package:simple_store_app/models/product_model.dart';

class GetAllProductsServices {
  Future<List<ProductModel>> getAllProducts() async {
    List<dynamic> data =
        await Api().get(url: "https://fakestoreapi.com/products", token: null);

    List<ProductModel> listproducts = [];

    for (int i = 0; i < data.length; i++) {
      listproducts.add(
        ProductModel.fromJson(data[i]),
      );
    }

    return listproducts;
  }
}
