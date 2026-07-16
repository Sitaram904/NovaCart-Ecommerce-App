# 🛒 NovaCart

A cross-platform e-commerce mobile application built with **Flutter** and **Firebase**, featuring Clean Architecture, BLoC state management, and eSewa payment integration.

---

## ✨ Features

- **Authentication** — Email/password & Google Sign-In with Firebase Auth
- **Product Catalog** — Browse, search, and filter products in real-time
- **Shopping Cart** — Add, update, remove items with persistent storage
- **Checkout** — Streamlined checkout with eSewa payment gateway
- **Admin Panel** — Product inventory management for administrators
- **Dark/Light Theme** — Toggle between themes with custom Poppins typography
- **Push Notifications** — Real-time order updates

---

## 🛠 Tech Stack

| Layer | Technology |
|-------|------------|
| Framework | Flutter |
| Language | Dart |
| State Management | BLoC (flutter_bloc) |
| Backend | Firebase (Auth, Firestore) |
| Payment | eSewa SDK |
| DI | get_it |
| Architecture | Clean Architecture |

---

## 📁 Project Structure

```
lib/
├── core/                  # Shared utilities, theme, DI
│   ├── common/
│   ├── constants/
│   ├── di/
│   ├── services/
│   ├── theme/
│   └── utilities/
├── features/
│   ├── auth/              # Authentication (data/domain/ui)
│   ├── admin/             # Admin panel
│   ├── onboarding/        # Welcome screens
│   ├── shop/              # Products, cart, checkout
│   └── user_view/         # Orders, settings
├── main_bloc/             # Global BLoC providers
├── app.dart
└── main.dart
```

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK ^3.10.1
- Firebase project setup
- eSewa merchant credentials

### Installation

```bash
# Clone the repo
git clone https://github.com/your-username/nova_cart.git

# Navigate to project
cd nova_cart

# Install dependencies
flutter pub get

# Run the app
flutter run
```

### Firebase Setup
1. Create a Firebase project
2. Add `google-services.json` (Android) / `GoogleService-Info.plist` (iOS)
3. Enable Authentication and Firestore in Firebase Console

---

## 📸 Screenshots

> Add screenshots here

```
Place screenshots in assets/screenshots/ and reference them:

![Home](assets/screenshots/home.png)
![Cart](assets/screenshots/cart.png)
![Checkout](assets/screenshots/checkout.png)
```

---

## 🏗 Architecture

This project follows **Clean Architecture** principles:

```
┌─────────────────────────────────────┐
│         Presentation Layer          │
│   (UI, BLoC, Widgets, Pages)       │
├─────────────────────────────────────┤
│           Domain Layer              │
│  (Entities, Use Cases, Repos)      │
├─────────────────────────────────────┤
│            Data Layer               │
│  (Data Sources, Models, Mappers)   │
└─────────────────────────────────────┘
```

- **Domain** — Business logic and entities (no external dependencies)
- **Data** — Firebase/Firestore implementations
- **Presentation** — Flutter UI with BLoC state management

---

## 📦 Dependencies

```yaml
dependencies:
  flutter_bloc: ^9.1.1
  firebase_core: ^4.5.0
  firebase_auth: ^6.2.0
  cloud_firestore: ^6.1.3
  google_sign_in: ^6.2.1
  get_it: ^9.2.1
  cached_network_image: ^3.4.1
  shared_preferences: ^2.5.5
  equatable: ^2.0.8
  esewa_flutter_sdk: (local)
```

---

## 📄 License

This project is for educational/internship purposes.

---

## 👤 Author

**Your Name** — [your-email@example.com](mailto:your-email@example.com)

GitHub: [@your-username](https://github.com/your-username)
