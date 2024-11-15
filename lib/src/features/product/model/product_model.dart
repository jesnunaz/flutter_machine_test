class ProductModel {
  int? id;
  String? title;
  String? price;
  String? category;
  String? description;
  String? image;

  ProductModel(
      {this.id,
      this.title,
      this.price,
      this.category,
      this.description,
      this.image});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    category = json['category'];
    description = json['description'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['category'] = this.category;
    data['description'] = this.description;
    data['image'] = this.image;
    return data;
  }
}
