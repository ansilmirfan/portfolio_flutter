# Flutter Portfolio Website

A clean and modern personal portfolio built using **Flutter Web**, showcasing animated sections, reusable custom widgets, and deployed with **Firebase Hosting**.

---

[🚀 Visit My Portfolio](https://portfolio-6d8b7.web.app/)

## ✨ Features

- 🎨 Responsive and elegant UI
- 🔁 Smooth animations and transitions
- 🧱 Custom reusable widgets for consistency and clean code
- 🚀 Firebase Hosting-ready structure
- 🖼️ Properly configured favicons and web manifest

---

### packages used

- font_awesome_flutter : for icons
- url_launcher : for opening outside urls

---

#### 🖼️ Preview

## ![portfolio preview](assets/images/portfolio%20preview.png)

---

## 📁 Folder Structure

```
├── assets/
│   ├── fonts/
│   └── images/
├── lib/
│   ├── main.dart
│   └── core/
│       ├── constants/
│       │   ├── animated_icons.dart
│       │   ├── links.dart
│       │   └── section_keys.dart
│       ├── utils/
│           ├── extension/
│           │   └── extension.dart
│           └── screen_utils.dart
│
│   ├── features/
│       ├── data/
│       │   ├── models/
│       │   │   └── project.dart
│       │   ├── services/
│       │   │   ├── scroll_service.dart
│       │   │   └── url_launcher_service.dart
│       │   └── data.dart
│
│       ├── presentation/
│           ├── screens/
│           │   ├── sections/
│           │   │   └── widgets/
│           │   ├── all_projects.dart
│           │   ├── home.dart
│           │   └── project_view.dart
│
│           ├── themes/
│           │   ├── color/
│           │   │   └── app_colors.dart
│           │   ├── app_text_theme.dart
│           │   └── app_theme.dart
│
│           ├── value_listenable/
│           │   └── selected_nav.dart
│
│           ├── widgets/
│               └── text/
```
