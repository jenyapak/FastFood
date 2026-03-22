class RestaurantEntity {
  final String id;
  final String name;
  final String description;
  final num rating;
  final String address;
  final String image;
  final DateTime createdAt;

  RestaurantEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.rating,
    required this.address,
    required this.image,
    required this.createdAt,
  });
}
