
# BuySimply - Flutter Test App 🛍️

**BuySimply** is a clean and responsive Flutter test project built to match a given Figma design. It showcases best practices in layout, asynchronous data loading with `FutureBuilder`, asset management, and custom theming using Proxima Nova font.

---

## 📁 Project Structure

```

buysimply/
├── lib/
│   ├── main.dart                   # App entry point
│   └──homescreen.dart # Core UI with FutureBuilder
├── assets/
│   ├── images/                     # UI assets: icons, avatars, background
│   └── fonts/                      # Custom fonts (Proxima Nova)
├── pubspec.yaml                    # Assets & dependency configuration
├── README.md                       # Project documentation

````

---

## 🧰 Requirements

- Flutter SDK 3.0 or higher
- Dart 2.17 or higher
- IDE (VS Code, Android Studio, or any Flutter-supported editor)
- Git (for version control)

---

## 🚀 Getting Started

1. **Clone the repository**:
```bash
[git clone https://github.com/YOUR_USERNAME/buysimply.git](https://github.com/Emmyu/buysimply--aderemi-emmanuel.git)
cd buysimply
````

2. **Install dependencies**:

```bash
flutter pub get
```

3. **Run the app**:

```bash
flutter run
```

> Ensure you have a connected device or emulator running.



## 🔄 Simulated API with FutureBuilder

To simulate fetching data from an API, `FutureBuilder` is used in `stroll_bonfire_screen.dart`:

```dart
Future<UserData> fetchUserData() async {
  await Future.delayed(Duration(seconds: 2));
  return UserData(
    name: 'Angelina',
    age: 28,
    question: 'What is your favorite time\nof the day?',
    quote: '“Mine is definitely the peace in the morning.”',
    avatarPath: 'assets/images/joey.jpg',
  );
}
```

This provides a dynamic, realistic user experience and prepares the app for real backend integration.

---

## ✨ Key Features

* 🎯 Pixel-perfect Figma layout replication
* 🌄 Full-screen background with gradient blend
* 🧠 Dynamic data rendering via `FutureBuilder`
* 🎚️ Modular answer card components
* 🧭 Bottom navigation with badges and spacing
* 💬 Custom typography using Proxima Nova

---

## 📌 Notes for Reviewers

* Core logic is in `lib/stroll_bonfire_screen.dart`
* No external APIs used — fully self-contained
* Easy to maintain and extend

---

## 👨‍💻 Author

**Emmanuel Aderemi**

📧 Email: [emmyunng@gmail.com](mailto:emmyunng@gmail.com)
📱 Phone: +234 916 153 5770
GitHub: [https://github.com/Emmyu](https://github.com/Emmyu)

---

## 📃 License

This project was created as part of a technical test and is owned by the author. All rights reserved.

```

---

```
#
