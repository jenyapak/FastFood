class FoodEntity {
  final int id;
  final String name;
  final List<String> cuisines;
  final double rating;
  final int price;
  final int calories;
  final String discription;
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
    required this.discription,
    required this.isRescued,
    required this.discount,
    required this.cookingDuration,
    required this.image,
  });
}
