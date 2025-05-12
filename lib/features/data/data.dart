import 'package:portfolio/features/data/models/project.dart';

class Data {
  static List<Project> mainProjects = [
    //fork and fusion
    Project(
      title: 'Fork and Fusion',
      slogan: 'Scan. Select. Satisfy',
      languages: 'Flutter',
      logoImage: 'assets/images/fork_and_fusion.png',
      image: "assets/images/fork-and-fusion-group.png",
      gitHubLink: "https://github.com/ansilmirfan/fork_and_fusion",
      liveLink: "https://www.amazon.com/dp/B0DLWZYFTZ/ref=apps_sf_sta",

      description:
          "Fork and Fusion is a restaurant application designed to enhance"
          " the dining experience by allowing customers to scan QR codes"
          " from their tables, browse the restaurant menu, and order"
          " directly from their devices. The app streamlines ordering"
          " and minimizes wait times, providing a seamless e-commerce-like"
          " experience within the restaurant.",
    ),
    //daily track
    Project(
      title: "Daily track",
      slogan: "Stay on Track, Every Day.",
      languages: "Flutter",
      gitHubLink: "https://github.com/ansilmirfan/daily_track",
      liveLink: "https://www.amazon.com/dp/B0CW1CXTP6/ref=apps_sf_sta",
      image: "assets/images/daily-track-group.png",
      logoImage: "assets/images/daily-track.png",
      description:
          "Daily Trac is a Flutter application designed to help users track "
          "their daily activities and tasks efficiently. With intuitive features "
          "and a user-friendly interface, Daily Trac aims to simplify task"
          " management and improve productivity. Whether it's tracking daily"
          " routines, setting reminders, or managing to-do lists, Daily Trac "
          "is your go-to companion for staying organized and on top of your daily tasks.",
    ),
    //netflix clone
    Project(
      title: "Netflix Clone",
      slogan: "Watch. Binge. Repeat",
      languages: "Flutter",
      logoImage: "assets/images/netflix_icon.png",
      image: "assets/images/netflix.png",
      description:
          "A Flutter-based Netflix Clone app that uses the BLoC architecture"
          " for state management and provides streaming features like video"
          " trailers, web view integration, and animations. This app is built "
          "using the MovieDB API to simulate Netflix-like functionality.",
      gitHubLink: "https://github.com/ansilmirfan/netflix_clone_bloc",
    ),
    //portfolio
    Project(
      title: "Portfolio",
      slogan: "Built with Passion. Designed to Impress",
      languages: "Flutter",
      image: "assets/images/portfolio.png",
      logoImage: "assets/images/am_extended.png",
      description:
          "A responsive Flutter web application that showcases my"
          " projects with smooth animations and a visually appealing UI."
          " Designed to highlight  skills in Flutter development, clean architecture, and interactive design.",
      gitHubLink: "https://github.com/ansilmirfan/portfolio_flutter",
    ),
  ];
  static List<Project> smallProjects = [
    //Dairy track
    Project(
      title: "Dairy Track",
      slogan: "From Farm to Store, Smarter",
      languages: "Flutter",
      description:
          "The Dairy Track mobile app is designed to assist a dairy operation unit"
          " in managing the production, distribution, and delivery of dairy products."
          " The app helps manage the supply chain from milk tankers receiving supplies"
          " to retail store deliveries. It enables drivers (salesmen) to efficiently"
          " navigate assigned routes and manage store visits.",
      gitHubLink: "https://github.com/ansilmirfan/dairy_track",
    ),
    //Gyropic
    Project(
      title: "Gyropic",
      slogan: "Animate with Motion",
      languages: "Flutter",
      description:
          "Gyropic is a Flutter application that utilizes gyroscope sensors to create interactive animations.",
      gitHubLink: "https://github.com/ansilmirfan/gyropic",
    ),
    //hbo clone
    Project(
      title: "HBO clone",
      slogan: "Entertainment at Your Fingertips",
      languages: "HTML,CSS",
      image: "assets/images/hbo.png",
      description:
          "A static clone of the HBO website created with HTML and CSS,"
          " featuring a clean design and user-friendly layout to showcase content in style",
      gitHubLink: "https://github.com/ansilmirfan/hbo",
    ),
    //DC clone
    Project(
      title: "DC clone",
      slogan: "Unleash the Heroes, Experience the Action.",
      image: "assets/images/dc.png",
      languages: "HTML,CSS",
      description:
          "A static clone of the DC website created with HTML and CSS,"
          " featuring a clean design and user-friendly layout to showcase content in style",
      gitHubLink: "https://github.com/ansilmirfan/dc",
    ),
  ];
}
