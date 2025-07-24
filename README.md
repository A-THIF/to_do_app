## 📌 To-Do App

A simple **To-Do List Flutter app** with **Firebase Authentication** and **Firestore Database**.
Users can **sign up** with email/password or Google, and store **tasks with title & description**, visible **per account**.

---

## ✨ Features

* 📧 Sign in & register with Email and Password
* 🔒 Sign in with Google
* ✅ Create, Read, Update, Delete tasks
* 🗂️ Tasks stored per user securely in **Firebase Firestore**
* 👀 Toggle password visibility
* 🚫 Safe sign-out with confirmation
* 📌 Friendly UI
* 🚩 Debug banner removed for production feel

---

## 🧩 Tech Used

* **Flutter 3.32.7**
* **Dart 3.8.1**
* **Firebase Auth** (email/password, Google)
* **Cloud Firestore** (user-specific tasks)

---

## 📂 Project Structure

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
 ├── android/
 │   ├── app/
 │   │   ├── google-services.json   # (NOT in repo) Android Firebase config
 ├── .gitignore                      # Ensures google-services.json not pushed
 ├── pubspec.yaml                    # Flutter dependencies
 ├── README.md                       # This file!
```

---

## ⚙️ How I Connected Firebase (Android only)

1️⃣ **Create Firebase Project**

* Go to [Firebase Console](https://console.firebase.google.com/).
* Click **Add Project**, name it (e.g. `to_do_app`).

2️⃣ **Add Android App**

* Click **Add App** → Android icon.
* Provide your Android package name (from `AndroidManifest.xml`).

3️⃣ \*\*Download \*\***`google-services.json`**

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

* `firebase_core`
* `firebase_auth`
* `cloud_firestore`

In `pubspec.yaml`:

```yaml
dependencies:
  firebase_core: ^x.x.x
  firebase_auth: ^x.x.x
  cloud_firestore: ^x.x.x
```

6️⃣ \*\*Initialize in \*\***`main.dart`**

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
```

7️⃣ **Handle Auth & Firestore**

* Auth logic in `sign_in_screen.dart` & `register_screen.dart`
* Tasks stored under:

  ```
  tasks/{userId}/userTasks/{taskId}
  ```

✅ **Only Android configured**

---

## 🔐 `.gitignore` Important

My `.gitignore` includes:

```plaintext
# Flutter
.dart_tool/
.packages
.pub/
build/

# Firebase keys
android/app/google-services.json
```

**Result:** No private keys pushed!

---

## ✅ Tested With

* **Flutter:** 3.32.7
* **Dart:** 3.8.1
* **DevTools:** 2.45.1

---

## 🚀 Improvements Possible

* Add **iOS support** (`GoogleService-Info.plist`)
* Upload **images** for tasks (Firebase Storage)
* Add push notifications
* Add user avatars
* Better state management (Provider, Bloc, Riverpod)
* Use `.env` for API keys

---

## ✅ Advantages of Forking

* Learn **Firebase Auth**
* Learn **Firestore CRUD**
* Get a **starter app** for personal to-do apps
* Expand to your own features!

## ⚠️ Disadvantages of Forking

* You **must** create your **own Firebase project**.
  This repo **does not** include backend keys (`google-services.json`).
* Without your own Firebase, **auth and DB will not work**.

## 👋 Feel free to fork, improve & star ⭐

Happy building! 🚀✨
