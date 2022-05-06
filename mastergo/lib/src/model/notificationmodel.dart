class Notifications {
  int id;
  String src;
  String name;
  String company;
  String content;
  Notifications(
      {required this.id,
      required this.src,
      required this.name,
      required this.company,
      required this.content});

  get icon => null;
}
