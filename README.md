<p align="center">
  <img src="./docs/images/pawcare-cute-banner.svg" alt="PawCare Cute Banner" width="100%" />
</p>

<h1 align="center">🐾 PawCare</h1>

<p align="center">
  <strong>A cute pastel pet-care app built with Flutter.</strong><br>
  Soft, friendly, and designed to make daily pet care feel easier.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-3.x-FF9FBC?style=flat-square&logo=flutter&logoColor=white" alt="Flutter">
  <img src="https://img.shields.io/badge/Dart-%3E%3D3.0-B59BFF?style=flat-square&logo=dart&logoColor=white" alt="Dart">
  <img src="https://img.shields.io/badge/VI%20%7C%20EN-Bilingual-9AD8C1?style=flat-square" alt="Language">
  <img src="https://img.shields.io/badge/Version-1.0.0-F6B27A?style=flat-square" alt="Version">
</p>

<p align="center">
  <a href="#-about">About</a> •
  <a href="#-features">Features</a> •
  <a href="#-tech-stack">Tech Stack</a> •
  <a href="#-getting-started">Getting Started</a> •
  <a href="#-project-structure">Project Structure</a> •
  <a href="#-team">Team</a>
</p>

🌸 About

PawCare là ứng dụng Flutter hỗ trợ người dùng quản lý thú cưng theo cách nhẹ nhàng, trực quan và thân thiện.

Thay vì ghi chú rời rạc hoặc phải nhớ nhiều công việc chăm sóc mỗi ngày, PawCare giúp gom mọi thứ vào một nơi: hồ sơ thú cưng, lịch chăm sóc, lịch khám thú y và hỗ trợ SOS.Dự án được xây dựng với định hướng tạo ra một trải nghiệm mềm mại, dễ dùng và phù hợp với những người yêu thú cưng.

Academic project for Mobile Application Development — Class N01, Group 04.

✨ Features

<table>
  <tr>
    <td width="50%" valign="top">

🐶 Pet Profile

Thêm, sửa và xóa hồ sơ thú cưng

Theo dõi thức ăn, nước uống và dị ứng

Chọn thú cưng để quản lý chăm sóc

📅 Care Planner

Tạo công việc theo ngày và giờ

Chỉnh sửa hoặc xóa công việc

Gán công việc cho từng thú cưng

🏥 Veterinary Services

Tìm kiếm phòng khám thú y

Lọc và xem danh sách phù hợp

Đặt, sửa hoặc hủy lịch hẹn

Kích hoạt luồng SOS khẩn cấp

🔐 Account & Profile

Đăng nhập và đăng ký

Quên mật khẩu

Kiểm tra dữ liệu biểu mẫu

</table>

💗 Highlights

Hỗ trợ Tiếng Việt / English

Giao diện pastel nhẹ nhàng, đúng chất pet-care app

Kiến trúc đơn giản, phù hợp phạm vi đồ án

Tập trung vào trải nghiệm chăm sóc thú cưng hằng ngày

🧁 Tech Stack

Flutter

Dart

Material Design

ChangeNotifier + AnimatedBuilder

table_calendar

intl

google_fonts

dependencies:
  cupertino_icons: ^1.0.6
  table_calendar: ^3.1.2
  intl: ^0.19.0
  google_fonts: ^6.2.1

🚀 Getting Started

1. Clone repository

git clone https://github.com/duyphamdevx/2025_2026_3_2_LTTBDD_N01_Nhom_04.git
cd 2025_2026_3_2_LTTBDD_N01_Nhom_04

2. Create Flutter platform folders

Repository hiện tập trung vào mã nguồn trong lib/, vì vậy hãy tạo các thư mục nền tảng còn thiếu bằng:

flutter create .

3. Install dependencies

flutter pub get

4. Run the app

flutter run

Chạy trên Chrome:

flutter run -d chrome

Kiểm tra môi trường:

flutter doctor

🗂 Project Structure

lib/
├── main.dart
├── l10n/
│   └── app_strings.dart
├── models/
│   ├── appointment.dart
│   ├── clinic.dart
│   ├── pet.dart
│   └── task.dart
├── screens/
│   ├── calendar_screen.dart
│   ├── forgot_password_screen.dart
│   ├── home_screen.dart
│   ├── login_screen.dart
│   ├── pet_profile_screen.dart
│   ├── profile_screen.dart
│   ├── register_screen.dart
│   ├── services_screen.dart
│   └── team_info_screen.dart
├── state/
│   └── app_state.dart
├── theme/
│   └── app_theme.dart
└── widgets/
    ├── app_bottom_sheet.dart
    ├── bottom_nav.dart
    └── language_badge.dart

🌼 Current Scope

PawCare hiện là prototype học tập, nên vẫn còn một số giới hạn:

Xác thực và quên mật khẩu đang ở mức mô phỏng

Dữ liệu được lưu trong bộ nhớ tạm

Danh sách phòng khám là dữ liệu mẫu

SOS chưa gọi điện thực tế

Chưa tích hợp Maps, GPS, notification hoặc backend

🌱 Roadmap

Kết nối Firebase Authentication

Lưu dữ liệu với Firestore hoặc REST API

Lưu phiên đăng nhập cục bộ

Tích hợp bản đồ và định vị

Thêm nhắc lịch chăm sóc

Hỗ trợ ảnh thật của thú cưng

Bổ sung dark mode và test tự động

👩‍💻 Team

Thành viên

MSSV

Phụ trách

Phạm Thế Duy

24100583

Kiến trúc, state, theme, localization, lịch và dịch vụ thú y

Phạm Thảo Hiền Vy

24100439

Trang chủ và hồ sơ thú cưng

Nguyễn Hoàng Nam

24100136

Đăng nhập, quên mật khẩu và hồ sơ cá nhân

Giảng viên hướng dẫn: ThS. Nguyễn Xuân QuếMôn học: Lập trình thiết bị di độngLớp: N01Nhóm: 04

<p align="center">
  <strong>Made with 💖 for pet lovers</strong><br>
  PawCare — soft routines, happier pets.
</p>
