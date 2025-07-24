## 📌 **To Do App**

A simple **To-Do List Flutter app** named ***To Do*** with a custom **app icon**, **Firebase Authentication**, and **Firestore Database**.
Users can **sign up** with email/password or Google and store **tasks with title & description**, visible **per account**.

---

## ✨ **Features**

✅ Custom **app icon**


✅ Clean app name: **To Do**


📧 Sign in & register with Email and Password


🔒 Sign in with Google


📝 Create, Read, Update, Delete tasks


🗂️ Tasks stored securely per user in **Firebase Firestore**


👁️ Toggle password visibility


🚪 Safe sign-out with confirmation


📌 Friendly UI


🚫 Debug banner removed for production feel



---

## 🧩 **Tech Stack**

* **Flutter:** 3.32.7
* **Dart:** 3.8.1
* **Firebase Auth:** (email/password, Google)
* **Cloud Firestore:** (user-specific tasks)
* **flutter\_launcher\_icons:** for custom app icon

---

## 📂 **Project Structure**

```plaintext
to_do_app/
 ├── lib/
 │   ├── main.dart               # Entry point: Firebase init & routes
 │   ├── screens/
 │   │   ├── sign_in_screen.dart   # Login UI
 │   │   ├── register_screen.dart  # Register UI
 │   │   ├── home_screen.dart      # List tasks, sign out
 │   │   ├── add_task_screen.dart  # Add/Edit tasks with title & description
 │   ├── services/
 │   │   ├── firestore_service.dart  # Firestore CRUD per user
 ├── assets/
 │   ├── icon/
 │   │   ├── app_icon.png         # Custom app icon
 ├── android/
 │   ├── app/
 │   │   ├── google-services.json   # (NOT in repo) Android Firebase config
 ├── .gitignore                      # Ensures google-services.json not pushed
 ├── pubspec.yaml                    # Flutter dependencies & launcher icons config
 ├── README.md                       # This file!
```

---

## ⚙️ **How I Connected Firebase (Android)**

1️⃣ **Create Firebase Project**

* Go to [Firebase Console](https://console.firebase.google.com/).
* Click **Add Project**, name it (e.g. `to_do_app`).

2️⃣ **Add Android App**

* Click **Add App** → Android icon.
* Provide your Android package name (from `AndroidManifest.xml`).

3️⃣ **Download `google-services.json`**

* Place it in `android/app/`.
* ✅ **Important:** This file must be **ignored** with `.gitignore`.

4️⃣ **Update Android Gradle**

* In `android/build.gradle`:

  ```gradle
  dependencies {
    classpath 'com.google.gms:google-services:4.4.0'
  }
  ```
* In `android/app/build.gradle`:

  ```gradle
  apply plugin: 'com.google.gms.google-services'
  ```
* Ensure `minSdkVersion` is **21 or higher**.

5️⃣ **Add Firebase packages**

```yaml
dependencies:
  firebase_core: ^2.30.0
  firebase_auth: ^4.19.0
  cloud_firestore: ^4.14.0
```

6️⃣ **Initialize in `main.dart`**

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
```

7️⃣ **Auth & Firestore logic**

* Auth in `sign_in_screen.dart` & `register_screen.dart`
* Tasks stored under:

  ```
  tasks/{userId}/userTasks/{taskId}
  ```

✅ **Currently only Android is configured.**

---

## 🗂️ **Custom App Icon & Display Name**

* Created with [`flutter_launcher_icons`](https://pub.dev/packages/flutter_launcher_icons).
* Updated:

  * `pubspec.yaml` with:

    ```yaml
    dev_dependencies:
      flutter_launcher_icons: ^0.13.1

    flutter_launcher_icons:
      android: true
      ios: true
      image_path: assets/icon/app_icon.png
    ```
  * Ran:

    ```bash
    dart run flutter_launcher_icons
    ```
* Updated app name:

  * `android/app/src/main/AndroidManifest.xml`: `android:label="To Do"`
  * `ios/Runner/Info.plist`: `CFBundleDisplayName` → `To Do`

---

## 🔐 **`.gitignore` Important**

```plaintext
# Flutter
.dart_tool/
.packages
.pub/
build/

# Firebase keys
android/app/google-services.json
```

✅ **No private keys are pushed!**

---

## ✅ **Tested With**

* **Flutter:** 3.32.7
* **Dart:** 3.8.1
* **DevTools:** 2.45.1

---

## 🚀 **Improvements Possible**

* Add **iOS support** (`GoogleService-Info.plist`)
* Add push notifications
* Add user avatars
* Upload images for tasks (Firebase Storage)
* Better state management (Provider, Bloc, Riverpod)
* Use `.env` for secrets

---

## 💡 **Why Fork This**

✔️ Learn **Firebase Auth & Firestore CRUD**


✔️ Practice custom **Flutter launcher icons**


✔️ Clean starter template for your own To-Do or notes app


✔️ Expand with your own features!



---

## ⚠️ **Heads Up**

You **must** create your **own Firebase project** — this repo **does not** include backend keys (`google-services.json`).
Without your own Firebase setup, **auth and DB won’t work**.

---

## 👋 **Feel free to fork, improve & star ⭐**

Happy building! 🚀✨
