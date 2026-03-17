# Flutter Reels App 🎥

A professional, high-performance Flutter application that mimics the Instagram/TikTok Reels feature. This project is built using **Clean Architecture** and **BLoC** state management, ensuring scalability, maintainability, and production-level code quality.

## 🚀 Key Features

- **Vertical Infinite Feed**: Smooth vertical scrolling using `PageView.builder`.
- **Firebase Firestore Integration**: Real-time video data fetching (URL, username, caption, likes).
- **Smart Video Playback**:
  - **Auto-play/Pause**: Videos play/pause automatically based on visibility.
  - **Manual Toggle**: Tap anywhere on the video to play or pause.
  - **Preloading**: Automatically pre-downloads the next 3 videos for zero-latency swiping.
  - **Offline Caching**: Uses `flutter_cache_manager` to prevent redundant data usage.
- **Modern UI/UX**:
  - Glassmorphic overlays with interactive like buttons.
  - Profile and action icons (Comment, Share, More).
  - Smooth loading indicators and error handling.
- **Clean Architecture**: Decoupled layers (Data, Domain, Presentation) for easy testing and updates.

## 🛠️ Tech Stack

- **Framework**: [Flutter](https://flutter.dev)
- **State Management**: [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- **Database**: [Firebase Cloud Firestore](https://firebase.google.com/docs/firestore)
- **Video Player**: [video_player](https://pub.dev/packages/video_player)
- **Dependency Injection**: [get_it](https://pub.dev/packages/get_it)
- **Caching**: [flutter_cache_manager](https://pub.dev/packages/flutter_cache_manager)

## 📂 Project Structure

```text
lib/
├── core/                    # App-wide utilities (Caching, Theme)
├── features/
│   └── reels/               # Main feature module
│       ├── data/            # Models, Repositories, Data Sources
│       ├── domain/          # Entities, Use Cases, Interfaces
│       └── presentation/    # BLoC, Screens, Widgets
├── injection_container.dart # Dependency Injection setup
└── main.dart                # App entry point & Initialization
```

## ⚙️ How to Run

1.  **Install Dependencies**:
    ```bash
    flutter pub get
    ```

2.  **Launch**:
    ```bash
    flutter run
    ```

**Required Flutter Version**: ^3.38.5

## 👨‍💻 Developed By
**Amit Chaurasia** - Software Engineer
