class ProductModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final RatingModel ratingModel;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.ratingModel,
  });

  factory ProductModel.fromJson(Map<String, dynamic> data) {
    return ProductModel(
      id: data['id'],
      title: data['title'],
      price: (data['price'] as num).toDouble(),
      description: data['description'],
      category: data['category'],
      image: data['image'],
      ratingModel: RatingModel.fromJson(data['rating']),
    );
  }
}

class RatingModel {
  final double rate;
  final int count;

  RatingModel({required this.rate, required this.count});

  factory RatingModel.fromJson(Map<String, dynamic> data) {
    return RatingModel(
      rate: (data['rate'] as num).toDouble(), // Cast to double
      count: data['count'],
    );
  }
}
