class WelcomeModel {
  String title;
  String subTitle;
  String image;
  String description;

  WelcomeModel({
    required this.title, required this.subTitle, required this.image, required this.description
  });
  factory WelcomeModel.fromJson(Map<String, dynamic> json) {
    return WelcomeModel(title: json["title"], subTitle: json["subTitle"], image: json["image"], description: json["description"]);
  }
}