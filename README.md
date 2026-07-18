#  Muslim Companion App

A modern Islamic mobile application built with Flutter to help Muslims manage daily religious activities with useful features like prayer times, Quran, Hadith, Islamic reminders, and more.

##  Features

-  Prayer Times
  - Daily prayer schedule
  - Location-based prayer timing

   -  Quran
  - Read Quran verses
  - Easy navigation

-  Hadith
  - Collection of authentic Hadith
  - Search and read Hadith

-  Notifications
  - Prayer reminders
  - Islamic daily notifications

- Jamaat Information
  - Mosque and Jamaat schedule
  - Community prayer updates

-  Islamic UI Design
  - Clean and modern interface
  - Dark mode support

---

---

#  Project Architecture

```
lib/
│
├── main.dart
│   ├── Initialize Flutter
│   ├── Initialize Hive
│   ├── Register Hive Adapter
│   ├── Open Hive Boxes
│   ├── MultiProvider Setup
│   └── MaterialApp Configuration
│
├── data/
│
│   ├── datasource/
│   │
│   │   └── remote/
│   │       ├── prayer_api_service.dart
│   │       │   └── Fetch Prayer Time API
│   │       │
│   │       ├── quran_api_service.dart
│   │       │   └── Fetch Quran API
│   │       │
│   │       └── mosque_api_service.dart
│   │           └── Fetch Nearby Mosques (Overpass API)
│   │
│   ├── models/
│   │
│   │   ├── prayer_model.dart
│   │   │   └── Prayer JSON Model
│   │   │
│   │   ├── quran_model.dart
│   │   │   └── Quran Verse Model
│   │   │
│   │   ├── surah_model.dart
│   │   │   └── Surah Model
│   │   │
│   │   ├── mosque_model.dart
│   │   │   └── Nearby Mosque Model
│   │   │
│   │   └── mosque_jamaat_model.dart
│   │       └── Hive Offline Model
│   │
│   └── repository/
│       │
│       ├── prayer_repository.dart
│       │   └── Prayer Repository
│       │
│       ├── quran_repository.dart
│       │   └── Quran Repository
│       │
│       └── mosque_repository.dart
│           └── Mosque Repository
│
├── providers/
│
│   ├── prayer_provider.dart
│   │   └── Prayer State Management
│   │
│   ├── quran_provider.dart
│   │   └── Quran State Management
│   │
│   ├── surah_provider.dart
│   │   └── Surah State Management
│   │
│   ├── mosque_provider.dart
│   │   └── Nearby Mosque State
│   │
│   ├── jamaat_provider.dart
│   │   └── Mosque Jamaat CRUD
│   │
│   ├── favorite_provider.dart
│   │   └── Favorite Management
│   │
│   └── theme_provider.dart
│       └── Dark / Light Theme
│
├── services/
│   │
│   └── location_service.dart
│       └── User Location Service
│
├── presentation/
│   │
│   └── screens/
│       │
│       ├── splash/
│       │   └── Splash Screen
│       │
│       ├── home/
│       │   └── Home Screen
│       │
│       ├── prayer/
│       │   └── Prayer Time Screen
│       │
│       ├── quran/
│       │   ├── Quran Screen
│       │   └── Surah Details
│       │
│       ├── qibla/
│       │   └── Qibla Compass
│       │
│       ├── mosque/
│       │   ├── Nearby Mosque Screen
│       │   └── Jamaat CRUD Screen
│       │
│       ├── favorite/
│       │   └── Favorite Screen
│       │
│       └── settings/
│           └── Settings Screen
│
└── assets/
    ├── images/
    └── icons/
```

---

#  Clean Architecture Flow

```
User
   │
   ▼
Screen (UI)
   │
   ▼
Provider
   │
   ▼
Repository
   │
   ▼
API Service
   │
   ▼
REST API
   │
JSON Response
   │
   ▼
Model (fromJson)
   │
   ▼
Provider
   │
notifyListeners()
   │
   ▼
UI Update
```

---

#  Offline Storage Flow

```
User
   │
   ▼
Jamaat Screen
   │
   ▼
Jamaat Provider
   │
   ▼
Hive Database
   │
   ▼
CRUD Operation
   │
notifyListeners()
   │
   ▼
Updated UI
```

---

#  REST API Integration

### Prayer Time API

```
Location
      │
      ▼
Prayer API
      │
      ▼
JSON
      │
      ▼
PrayerModel
      │
      ▼
PrayerProvider
      │
      ▼
Prayer Screen
```

---

### Quran API

```
Quran API
     │
     ▼
JSON
     │
     ▼
QuranModel
     │
     ▼
QuranProvider
     │
     ▼
Quran Screen
```

---

### Nearby Mosque API

```
Current Location
        │
        ▼
Overpass API
        │
        ▼
JSON
        │
        ▼
MosqueModel
        │
        ▼
MosqueProvider
        │
        ▼
Nearby Mosque Screen
```

---

#  Local Database (Hive)

```
Hive

├── favorites
│      └── Favorite Quran
│
├── settings
│      └── Theme Preference
│
└── jamaatBox
       └── Mosque Jamaat Times
```

---



---

#  Technologies Used

- Flutter
- Dart
- Provider
- Dio
- Hive
- REST API
- Geolocator
- Flutter Qiblah
- Material 3
- OpenStreetMap Overpass API

---



---

#  Developed By

Faisal Mahmud

