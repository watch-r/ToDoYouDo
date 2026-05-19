# TodoYouDo 📝

A simple and elegant To-Do list application built with Flutter. Keep track of your daily tasks with ease and a clean user interface.

## ✨ Features

- **Add Tasks**: Quickly create new tasks to stay organized.
- **Mark as Complete**: Toggle task completion status with a simple checkbox.
- **Delete Tasks**: Remove completed or unnecessary tasks from your list.
- **Persistent Storage**: Your tasks are saved locally using Hive, so you never lose your data.
- **Modern UI**: Beautiful typography powered by Google Fonts and smooth animations.

## 🛠️ Tech Stack

- **Framework**: [Flutter](https://flutter.dev)
- **Local Database**: [Hive](https://pub.dev/packages/hive) (NoSQL)
- **Typography**: [Google Fonts](https://pub.dev/packages/google_fonts)
- **UI Components**: `flutter_slidable` for intuitive task management.

## 🚀 Getting Started

### Prerequisites

- Flutter SDK installed on your machine.
- A code editor (VS Code atau Android Studio recommended).

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/todoyoudo.git
   ```
2. Navigate to the project directory:
   ```bash
   cd todoyoudo
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Run the application:
   ```bash
   flutter run
   ```

## 📁 Project Structure

```
lib/
├── data/
│   └── database.dart      # Hive database logic for storing tasks
├── pages/
│   └── homepage.dart      # Main screen and task management logic
├── utils/
│   ├── dialogue_box.dart  # Custom dialog for adding new tasks
│   ├── mbutton.dart       # Custom reusable button widget
│   └── todo_tile.dart     # Individual task item widget
└── main.dart              # Application entry point and theme configuration
```

## 📝 License

This project is for educational purposes. Feel free to use and modify it!

