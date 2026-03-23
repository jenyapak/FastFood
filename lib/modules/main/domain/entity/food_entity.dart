class FoodEntity {
  final String id;
  final String name;
  final List<String> cuisines;
  final double rating;
  final int price;
  final int calories;
  final String description;
  final bool isRescued;
  final int discount;
  final int cookingDuration;
  final String image;

  FoodEntity({
    required this.id,
    required this.name,
    required this.cuisines,
    required this.rating,
    required this.price,
    required this.calories,
    required this.description,
    required this.isRescued,
    required this.discount,
    required this.cookingDuration,
    required this.image,
  });
}
