class ActionItem {
  final String actionId;
  final String hiveId;
  final String actionDescription;

  ActionItem({
    required this.actionId,
    required this.hiveId,
    required this.actionDescription
  });

  String getActionId() => actionId;
  String getHiveId() => hiveId;
  String getActionDescription() => actionDescription;

}