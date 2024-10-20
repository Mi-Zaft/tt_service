
class BagPrices {
  final double oneBagCost;
  final double twoBagCost;
  final double threeBagCost;
  final double fourBagCost;
  final double additionalBagCost;

  Map<String, dynamic> toJson() {
    return {
      'one_bag_cost': oneBagCost,
      'two_bag_cost': twoBagCost,
      'three_bag_cost': threeBagCost,
      'four_bag_cost': fourBagCost,
      'additional_bag_cost': additionalBagCost,
    };
  }

  BagPrices({
    required this.oneBagCost,
    required this.twoBagCost,
    required this.threeBagCost,
    required this.fourBagCost,
    required this.additionalBagCost,
  });

  factory BagPrices.fromJson(Map<String, dynamic> json) {
    return BagPrices(
      oneBagCost: (json['one_bag_cost'] ?? 0).toDouble(),
      twoBagCost: (json['two_bag_cost'] ?? 0).toDouble(),
      threeBagCost: (json['three_bag_cost'] ?? 0).toDouble(),
      fourBagCost: (json['four_bag_cost'] ?? 0).toDouble(),
      additionalBagCost: (json['additional_bag_cost'] ?? 0).toDouble(),
    );
  }
}