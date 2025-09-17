class CategoryResponseDto {
  CategoryResponseDto({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  num? id;
  String? title;
  num? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  CategoryResponseDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] as String;
    price = json['price'];
    description = json['description'] as String;
    category = json['category'] as String;
    image = json['image'] as String;
    rating = json['rating'] != null ? Rating.fromJson(json['rating']) : null;
  }
}

class Rating {
  Rating({this.rate, this.count});
  num? rate;
  num? count;

  Rating.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    count = json['count'];
  }
}
