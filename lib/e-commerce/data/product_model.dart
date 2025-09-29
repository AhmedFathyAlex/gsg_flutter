class ProductModel {
  final int id;
  final String title;
  final String description;
  final String category;
  final String image;
  final double rating;
  final int ratingCount;
  final double price;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
    required this.ratingCount,
    required this.price,
  });

  factory ProductModel.fromJson(Map json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rating: json['rating']['rate'] * 1.0,
      ratingCount: json['rating']['count'],
      price: json['price'] * 1.0,
    );
  }

}


/**
 *    { "id": 1,
    "title": "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
    "price": 109.95,
    "description": "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
    "category": "men's clothing",
    "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_t.png",
    "rating": {
      "rate": 3.9,
      "count": 120
    }
  },
 */