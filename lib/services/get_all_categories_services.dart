import 'package:simple_store_app/helper/api.dart';

class GetAllCategoriesServices {
  Future<List<dynamic>> getAllCategories() async {
    List<dynamic> data = await Api()
        .get(url: "https://fakestoreapi.com/products/categories", token: null);

    return data;
  }
}
