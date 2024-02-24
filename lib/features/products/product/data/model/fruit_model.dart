class AllProductModel {
  final int? id;
  final String? title;
  final String? description;
  final int? category;
  final String? image;
  final int? quantity;
  final String? price;

  AllProductModel({
    this.id,
    this.title,
    this.description,
    this.category,
    this.image,
    this.quantity,
    this.price,
  });

  factory AllProductModel.fromJson(Map<String, dynamic> json) =>
      AllProductModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        category: json["category"],
        image: json["image"],
        quantity: json["quantity"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "category": category,
        "image": image,
        "quantity": quantity,
        "price": price,
      };

  removeItemFromCart(int index) {}
}
