class Event {
  final String image;
  final String startDate;
  final String? endDate;
  final String name;
  final String location;
  final String cost;
  final String? discountCost;

  const Event({
    required this.image,
    required this.startDate,
    required this.endDate,
    required this.name,
    required this.location,
    required this.cost,
    required this.discountCost,
  });
}
