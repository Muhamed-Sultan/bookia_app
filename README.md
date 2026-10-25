from pathlib import Path

readme = """# 📚 Bookia App

Bookia is a Flutter mobile application for browsing books and exploring a book-focused shopping experience. The project uses reusable UI components and a feature-based structure to keep the code organized and maintainable.

## ✨ Features

- **Authentication UI** — Login and registration screens with form validation.
- **Password Visibility** — Toggle password visibility in password fields.
- **Book Browsing** — Home screen with a best-sellers section powered by API data.
- **API Integration** — HTTP requests handled with Dio.
- **State Management** — Cubit/Bloc for managing asynchronous UI states.
- **Profile Screen** — Profile page with navigation options for:
  - My Orders
  - Edit Profile
  - Reset Password
  - FAQ
  - Contact Us
  - Privacy & Terms
- **Logout Entry Point** — Logout icon displayed in the profile header.
- **Named Navigation** — Navigate between app screens using named routes.
- **Responsive Layout** — Flutter ScreenUtil for screen-aware sizing.
- **Reusable Widgets** — Shared UI components such as text fields, buttons, book items, and profile cards.

## 🛠️ Tech Stack

- [Flutter](https://flutter.dev/)
- Dart
- [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- [Dio](https://pub.dev/packages/dio)
- [flutter_screenutil](https://pub.dev/packages/flutter_screenutil)
- [easy_localization](https://pub.dev/packages/easy_localization)

## 📂 Project Structure

The project follows a feature-oriented structure. The exact files may evolve as the app develops.

```text
lib/
├── core/
│   ├── networking/
│   ├── routes/
│   ├── theme/
│   ├── utils/
│   └── widgets/
└── feature/
    ├── auth/
    │   └── presentation/
    │       └── cubit/
    ├── home/
    │   ├── data/
    │   │   ├── models/
    │   │   └── repo/
    │   └── presentation/
    │       ├── cubit/
    │       ├── screens/
    │       └── widgets/
    └── profile/
        └── presentation/
            ├── screens/
            └── widgets/
```

> Folder names can differ depending on the current local project structure.

## 🚀 Getting Started

### Prerequisites

- Flutter SDK
- Dart SDK
- Android Studio or Visual Studio Code

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/Muhamed-Sultan/bookia_app.git
   ```

2. Open the project directory:

   ```bash
   cd bookia_app
   ```

3. Install dependencies:

   ```bash
   flutter pub get
   ```

4. Configure the API base URL and endpoints to match your backend setup.

5. Run the application:

   ```bash
   flutter run
   ```

## 🔌 API & State Management

Book data is requested through Dio, while Cubit/Bloc manages the related UI states. Configure the API endpoints in the project's networking layer before running the app against your backend.

## 📱 Screenshots

Add current screenshots from your app to a folder such as `screenshots/`, then update the paths below.

| Screen | Preview |
| --- | --- |
| Welcome | `screenshots/welcome.png` |
| Login | `screenshots/login.png` |
| Register | `screenshots/register.png` |
| Home / Best Sellers | `screenshots/home.png` |
| Profile | `screenshots/profile.png` |

## 👨‍💻 Developer

**Muhamed Salah Sultan**  
Flutter Developer

- GitHub: [Muhamed-Sultan](https://github.com/Muhamed-Sultan)
- Repository: [Bookia App](https://github.com/Muhamed-Sultan/bookia_app)

---

**Built with Flutter 💙**
"""

path = Path("/mnt/data/README.md")
path.write_text(readme, encoding="utf-8")
print(f"Created: {path}")
