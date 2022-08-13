<h1 align="center">
  <img alt="Timer" title="Timer" src="assets\images\logo.png" height="180"/>
</h1>

<p align="center">A Flutter app built with Bloc, Modular, Isar and Firebase. Its main feature is the time management in a project.</p>
<p align="center">The user can create projects with a time estimate. In each project it's possible to add the completed tasks.</p>

<p align="center">
 <a href="#-firebase">Firebase</a> •
 <a href="#-running-the-app">Running the app</a> •
 <a href="#-technologies">Technologies</a> •
 <a href="#-license">License</a>
</p>

---
<br>
<h1 align="center">
  <img alt="JobTimer" title="JobTimer" src="./github/jobtimer.gif" height="500" />
</h1>

## 🔥 Firebase

```bash
# Configure the Firebase CLI and FlutterFire CLI
https://firebase.google.com/docs/flutter/setup?hl=pt-br&platform=android

# Create a Firebase project (you can use the Firebase console or de CLI)
# Execute the following command in your project folder to create a new Firebase project or to select an existing one
$ flutterfire configure

# Add the e-mail/password and the Google login options in the Firebase console

# Make sure you add your SHA1 to the Firebase project
# The following command will show your SHA1
$ keytool -list -v -keystore C:\Users\William\.android\debug.keystore -alias androiddebugkey -storepass android -keypass android
```

---

## 💻 Running the app

```bash
# Packages download
$ flutter pub get

# Generate .g files
$ flutter pub run build_runner build --delete-conflicting-outputs

# To update .g files automatically
$ flutter pub run build_runner watch --delete-conflicting-outputs

# To clean the outdated .g files
$ flutter pub run build_runner clean
```

---

## 🚀 Technologies
- [Dart](https://dart.dev/)
- [Flutter](https://flutter.dev/)
- [Bloc](https://pub.dev/packages/flutter_bloc)
- [Firebase](https://console.firebase.google.com/)
- [Modular](https://pub.dev/packages/flutter_modular)
- [Isar](https://pub.dev/packages/isar)
- [Asuka](https://pub.dev/packages/asuka)
- [FL Chart](https://pub.dev/packages/fl_chart)
- [Validatorless](https://pub.dev/packages/validatorless)
- [Equatable](https://pub.dev/packages/equatable)
- [Build Runner](https://pub.dev/packages/build_runner)

---

## 📝 License
Project under MIT license, for more details go to the following file: [LICENSE](LICENSE.md).

---

<div align="center">

[![LinkedIn Badge](https://img.shields.io/badge/William_Barreiro-0077B5?style=flat-square&logo=linkedin&logoColor=white&link=https://www.linkedin.com/in/williambarreiro/)](https://www.linkedin.com/in/williambarreiro/)

</div>

