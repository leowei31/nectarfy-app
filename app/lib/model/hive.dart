class Hive {

  final String id;
  final String name;
  final String ownerId;
  final double humidity;
  final double temperature;
  final double weight;
  final DateTime lastFed;
  final bool hasActions;
  final String profilePicPath;

  Hive({
    required this.id,
    required this.name, 
    required this.ownerId, 
    required this.humidity, 
    required this.temperature, 
    required this.weight,
    required this.lastFed,
    required this.hasActions,
    required this.profilePicPath,
  });

  String getId() => id;
  String getName() => name;
  String getOwnerId() => ownerId;
  double getHumidity() => humidity;
  double getTemperature() => temperature;
  double getWeight() => weight;
  DateTime getLastFed() => lastFed;
  String getProfilePicPath() => profilePicPath;
}