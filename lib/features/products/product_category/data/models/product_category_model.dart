class ProductCategoryModel {
  final int? id;
  final String? name;
  final String? image;

  ProductCategoryModel({
    this.id,
    this.name,
    this.image,
  });

  factory ProductCategoryModel.fromJson(Map<String, dynamic> json) =>
      ProductCategoryModel(
        id: json["id"],
        name: json["name"],
        image: json["image"],
      );

  get cartItems => null;

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
      };
}
