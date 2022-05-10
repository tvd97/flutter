class DatePlaying {
  String maximum;
  String minimum;
  DatePlaying({required this.maximum, required this.minimum});
  factory DatePlaying.fromJson(Map<String, dynamic> json) {
    return DatePlaying(maximum: json['maximum'], minimum: json['minimum']);
  }
}
