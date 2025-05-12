class Project {
  final String title;
  final String slogan;
  //for languages that is used in the project
  final String languages;

  final String? liveLink;
  final String gitHubLink;
  final String description;
  final String? logoImage;
  final String? image;

  final Status status;

  Project({
    required this.title,
    required this.slogan,
    required this.languages,
    required this.description,
    required this.gitHubLink,

    this.liveLink,

    this.image,
    this.logoImage,
    this.status = Status.completed,
  });
}

class Features {
  final String title;
  final String description;

  Features({required this.title, required this.description});
}

enum Status { completed, ongoing }
