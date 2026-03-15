class FoodEntity {
  final String name;
  final List<String> cuisines;
  final double rating;
  final double price;
  final int calories;
  final String discription;
  final bool isRescued;
  final double discount;
  final int cookingDuration;

  FoodEntity({
    required this.name,
    required this.cuisines,
    required this.rating,
    required this.price,
    required this.calories,
    required this.discription,
    required this.isRescued,
    required this.discount,
    required this.cookingDuration,
  });
}
