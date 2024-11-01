class Order {
  final int createdAt;
  final int quantity;
  final int price;
  final String status;
  final String? comment;
  final String? courierId;
  final String userId;

  Order({
    required this.createdAt,
    required this.quantity,
    required this.price,
    required this.status,
    this.comment,
    this.courierId,
    required this.userId,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      createdAt: (json['created_at'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
      price: (json['price'] as num).toInt(),
      status: json['status'] ?? '',
      comment: json['comment'],
      courierId: json['courier_id'],
      userId: json['user_id'] ?? '',
    );
  }
}