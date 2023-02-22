class ProductModel {
    ProductModel({
        this.id,
        this.name,
        this.categoryId,
        this.isActive,
        this.price,
    });

    int? id;
    String? name;
    String? categoryId;
    String? isActive;
    String? price;

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        name: json["name"],
        categoryId: json["categoryId"],
        isActive: json["isActive"],
        price: json["price"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "categoryId": categoryId,
        "isActive": isActive,
        "price": price,
    };
}