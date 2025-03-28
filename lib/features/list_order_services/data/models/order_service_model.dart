class OrderServiceModel {
  final String title;
  final String description;
  final String checklistOption;
  final String photoPath;

  OrderServiceModel({
    required this.title,
    required this.description,
    required this.checklistOption,
    required this.photoPath,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'checklistOption': checklistOption,
      'photoPath': photoPath,
    };
  }

  factory OrderServiceModel.fromJson(Map<String, dynamic> json) {
    return OrderServiceModel(
      title: json['title'] as String,
      description: json['description'] as String,
      checklistOption: json['checklistOption'] as String,
      photoPath: json['photoPath'] as String,
    );
  }
}