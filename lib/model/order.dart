class Order {
  int? id;
  int? coffeId;
  int? coffeSize;
  int? coffeCount;

  Order({
    this.id,
    this.coffeId,
    this.coffeSize,
    this.coffeCount,
  });

  factory Order.fromJson(Map<dynamic, dynamic> json) => Order(
        id: json["id"],
        coffeId: json["coffeId"],
        coffeSize: json["coffeSize"],
        coffeCount: json["coffeCount"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "coffeId": coffeId,
        "coffeSize": coffeSize,
        "coffeCount": coffeCount,
      };
}
