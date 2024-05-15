import 'package:simple_store_app/helper/api.dart';
import 'package:simple_store_app/models/product_model.dart';

class CategoriesServices {
  Future<List<ProductModel>> getAllCategories(
      {required String categoryName}) async {
    List<dynamic> data = await Api().get(
        url: "https://fakestoreapi.com/products/category/$categoryName",
        token: null);

    List<ProductModel> listproducts = [];
    for (int i = 0; i < data.length; i++) {
      listproducts.add(
        ProductModel.fromJson(data[i]),
      );
    }
    return listproducts;
  }
}
