# 📚 Bookia App

A Flutter application focused on providing a book-related mobile experience, with an authentication flow and reusable UI components.

## ✨ Features

- **User Login** — Email and password fields with input validation.
- **User Registration** — Username, email, password, and password confirmation.
- **Form Validation** — Validate user input before submitting authentication requests.
- **Password Visibility** — Toggle password visibility in password fields.
- **Authentication State Management** — Handle authentication states using Cubit and Bloc.
- **API Communication** — Send HTTP requests using Dio.
- **Named Navigation** — Navigate between screens using named routes.
- **Responsive UI** — Use Flutter ScreenUtil for screen-aware sizing.
- **Reusable Widgets** — Custom text fields and buttons.

## 🛠️ Technologies

- Flutter
- Dart
- flutter_bloc
- Dio
- flutter_screenutil

## 📂 Project Structure

```text
lib/
├── core/
│   ├── routes/
│   ├── theme/
│   ├── utils/
│   │   └── validator/
│   └── widgets/
└── feature/
    └── auth/
        └── presentation/
            └── cubit/
```

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

2. Navigate to the project directory:

   ```bash
   cd bookia_app
   ```

3. Install dependencies:

   ```bash
   flutter pub get
   ```

4. Configure the API endpoints in the authentication repository.

5. Run the application:

   ```bash
   flutter run
   ```

## 🔌 API Configuration

The authentication repository uses Dio to send login and registration requests.

Replace the placeholder API paths with your actual backend endpoints before testing authentication.

---

## 📱 App Screenshots

The following screenshots showcase the main authentication screens of Bookia App.

### 🏠 Welcome Screen

<p align="center">
  <img src="images/welcome.png" width="280" alt="Bookia Welcome Screen"/>
</p>

### 🔐 Login Screen

<p align="center">
  <img src="images/login.png" width="280" alt="Bookia Login Screen"/>
</p>

### 📝 Register Screen

<p align="center">
  <img src="images/register.png" width="280" alt="Bookia Registration Screen"/>
</p>

### 🔑 Forgot Password Screen

<p align="center">
  <img src="images/forget-password.png" width="280" alt="Bookia Forgot Password Screen"/>
</p>

### 🔒 New Password Screen

<p align="center">
  <img src="images/new-password.png" width="280" alt="Bookia New Password Screen"/>
</p>

---

## 👨‍💻 Developer

**Muhamed Salah Sultan**

Flutter Developer

- GitHub: [Muhamed-Sultan](https://github.com/Muhamed-Sultan)
- Repository: [Bookia App](https://github.com/Muhamed-Sultan/bookia_app)

---

**Built with Flutter 💙**
