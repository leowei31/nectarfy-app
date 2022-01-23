class Hive {

  final String id;
  final String name;
  final String ownerId;
  final double humidity;
  final double temperature;
  final double weight;
  final DateTime lastFed;
  final bool hasActions;

  Hive({
    required this.id,
    required this.name, 
    required this.ownerId, 
    required this.humidity, 
    required this.temperature, 
    required this.weight,
    required this.lastFed,
    required this.hasActions,
  });

  String getId() {
    return id;
  }
  
  String getName() {
    return name;
  }

  String getOwnerId() {
    return ownerId;
  }

  double getHumidity() {
    return humidity;
  }

  double getTemperature() {
    return temperature;
  }

  double getWeight() {
    return weight;
  }

  DateTime getLastFed() {
    return lastFed;
  }

  bool getHasActions() {
    return hasActions;
  }
}