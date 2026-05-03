# Corks 🎓

A 100% offline, private iOS application designed for tutors to manage their students, schedule lessons, and track finances.

## 🏗️ Architecture
The project follows a strict **MVVM (Model-View-ViewModel)** architecture. All user data is securely stored locally on the device using SwiftData, ensuring maximum privacy.

## 📱 App Features & Views

The application is divided into three main sections:

### 1. Students ✅
The core of the application where you can manage your tutoring base.
* Add, edit, and delete students.
* Track individual student details such as hourly rate and subject.
* Add specific lessons to students, including start/end times and descriptions.
* Auto-calculate suggested lesson prices based on the student's base hourly rate and lesson duration.
* Mark lessons as paid or unpaid to easily track debts.

### 2. Statistics 🚧 *In Progress*
A dedicated dashboard to visualize your tutoring business.
* *Planned:* Track monthly and yearly income.
* *Planned:* View unpaid lessons summary.
* *Planned:* Analyze time spent teaching per subject.

### 3. Settings 🚧 *In Progress*
App configuration and data management.
* *Planned:* **"Export to CSV"** A feature allowing you to export all your financial and lesson data into a spreadsheet for tax preparation and personal record-keeping.

## 🛠️ Tech Stack
* **iOS 17+**
* **SwiftUI** for building the declarative user interface.
* **SwiftData** for local database management.
