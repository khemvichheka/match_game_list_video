class MatchModel {
  final String title;
  final String time;
  final String status;
  late final String videoUrl;
  final String remainingTime;
  final String iconsUrl;
  final String headerTitle;

  MatchModel({
    required this.title,
    required this.time,
    required this.status,
    required this.videoUrl,
    required this.remainingTime,
    required this.iconsUrl,
    required this.headerTitle
  });
}
