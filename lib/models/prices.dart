
class BagPrices {
  final double oneBagCost;
  final double twoBagsCost;
  final double threeBagsCost;
  final double fourBagsCost;
  final double additionalBagCost;

  Map<String, dynamic> toJson() {
    return {
      'one_bag_cost': oneBagCost,
      'two_bags_cost': twoBagsCost,
      'three_bags_cost': threeBagsCost,
      'four_bags_cost': fourBagsCost,
      'additional_bag_cost': additionalBagCost,
    };
  }

  BagPrices({
    required this.oneBagCost,
    required this.twoBagsCost,
    required this.threeBagsCost,
    required this.fourBagsCost,
    required this.additionalBagCost,
  });

  factory BagPrices.fromJson(Map<String, dynamic> json) {
    return BagPrices(
      oneBagCost: (json['one_bag_cost'] ?? 0).toDouble(),
      twoBagsCost: (json['two_bags_cost'] ?? 0).toDouble(),
      threeBagsCost: (json['three_bags_cost'] ?? 0).toDouble(),
      fourBagsCost: (json['four_bags_cost'] ?? 0).toDouble(),
      additionalBagCost: (json['additional_bag_cost'] ?? 0).toDouble(),
    );
  }
}