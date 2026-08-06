

<h1 align="center">🐾 PawCare</h1>

<p align="center">
  <strong>Cute pastel pet-care app built with Flutter.</strong><br>
  Mềm mại, dễ thương và được sắp xếp gọn gàng để quản lý thú cưng dễ hơn mỗi ngày.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-3.x-FF9FBC?style=flat-square&logo=flutter&logoColor=white" alt="Flutter">
  <img src="https://img.shields.io/badge/Dart-%3E%3D3.0-B59BFF?style=flat-square&logo=dart&logoColor=white" alt="Dart">
  <img src="https://img.shields.io/badge/VI%20%7C%20EN-Bilingual-9AD8C1?style=flat-square" alt="Language">
  <img src="https://img.shields.io/badge/Version-1.0.0-F6B27A?style=flat-square" alt="Version">
</p>

<table>
<tr>
<td width="50%" valign="top">

🌸 Giới thiệu

PawCare là ứng dụng Flutter giúp người dùng quản lý thú cưng theo cách trực quan và nhẹ nhàng.

Ứng dụng gom các nhu cầu quan trọng vào một nơi:

Hồ sơ thú cưng

Lịch chăm sóc hằng ngày

Lịch khám thú y

Hỗ trợ SOS khẩn cấp

PawCare được xây dựng để giảm cảm giác rối khi phải ghi nhớ nhiều việc nhỏ mỗi ngày trong quá trình chăm sóc thú cưng.

</td>
<td width="50%" valign="top">

💡 Thông tin nhanh

<table>
<tr><td>📚 <b>Môn học</b></td><td>Lập trình thiết bị di động</td></tr>
<tr><td>🏫 <b>Lớp</b></td><td>N01</td></tr>
<tr><td>👥 <b>Nhóm</b></td><td>04</td></tr>
<tr><td>👨‍🏫 <b>Giảng viên</b></td><td>ThS. Nguyễn Xuân Quế</td></tr>
<tr><td>🌐 <b>Ngôn ngữ</b></td><td>Tiếng Việt / English</td></tr>
<tr><td>📱 <b>Nền tảng</b></td><td>Flutter</td></tr>
</table>

</td>
</tr>
</table>

✨ Tính năng nổi bật

<table>
<tr>
<td width="50%" valign="top">

🐶 Hồ sơ thú cưng

Thêm, sửa và xóa thú cưng

Theo dõi thức ăn, nước uống và dị ứng

Chọn thú cưng để quản lý chăm sóc

</td>
<td width="50%" valign="top">

📅 Lịch chăm sóc

Tạo công việc theo ngày và giờ

Chỉnh sửa hoặc xóa công việc

Gán công việc cho từng thú cưng

Đánh dấu công việc hoàn thành

</td>
</tr>
<tr>
<td width="50%" valign="top">

🏥 Dịch vụ thú y

Tìm kiếm phòng khám

Lọc danh sách theo nhu cầu

Đặt, sửa hoặc hủy lịch hẹn

Luồng SOS khẩn cấp

</td>
<td width="50%" valign="top">

🔐 Tài khoản & cá nhân

Đăng nhập và đăng ký

Quên mật khẩu

Kiểm tra dữ liệu biểu mẫu

Xem và cập nhật hồ sơ cá nhân

</td>
</tr>
</table>

💗 Vì sao PawCare dễ dùng?

<table>
<tr>
<td width="33%" valign="top" align="center">

Gọn gàng

Mọi thông tin quan trọng được gom về một chỗ, giúp giảm rối mắt và dễ theo dõi.

</td>
<td width="33%" valign="top" align="center">

Thân thiện

Tông màu pastel và bố cục nhẹ nhàng tạo cảm giác gần gũi với người dùng.

</td>
<td width="33%" valign="top" align="center">

Hữu ích

Tập trung vào các thói quen chăm sóc thật sự cần thiết trong cuộc sống hằng ngày.

</td>
</tr>
</table>

🧁 Công nghệ sử dụng

<table>
<tr>
<td width="50%" valign="top">

Core

Flutter

Dart

Material Design

</td>
<td width="50%" valign="top">

Packages

table_calendar

intl

google_fonts

cupertino_icons

</td>
</tr>
</table>

dependencies:
  cupertino_icons: ^1.0.6
  table_calendar: ^3.1.2
  intl: ^0.19.0
  google_fonts: ^6.2.1

🚀 Cài đặt và chạy dự án

<table>
<tr>
<td width="50%" valign="top">

1. Clone repository

git clone https://github.com/duyphamdevx/2025_2026_3_2_LTTBDD_N01_Nhom_04.git
cd 2025_2026_3_2_LTTBDD_N01_Nhom_04

2. Tạo cấu trúc Flutter

flutter create .

</td>
<td width="50%" valign="top">

3. Cài dependencies

flutter pub get

4. Chạy ứng dụng

flutter run

5. Kiểm tra môi trường

flutter doctor

</td>
</tr>
</table>

🗂 Cấu trúc dự án


<pre>
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
</pre>

<table>
<tr>
<td width="33%" valign="top"><b>models/</b><br>Dữ liệu của thú cưng, công việc, lịch hẹn và phòng khám.</td>
<td width="33%" valign="top"><b>screens/</b><br>Các màn hình chính của ứng dụng.</td>
<td width="33%" valign="top"><b>state/</b><br>Quản lý trạng thái dùng chung.</td>
</tr>
<tr>
<td width="33%" valign="top"><b>l10n/</b><br>Chuỗi giao diện tiếng Việt và tiếng Anh.</td>
<td width="33%" valign="top"><b>theme/</b><br>Màu sắc, font và style dùng chung.</td>
<td width="33%" valign="top"><b>widgets/</b><br>Các thành phần giao diện tái sử dụng.</td>
</tr>
</table>

🌼 Giới hạn hiện tại

<table>
<tr>
<td>

Xác thực và quên mật khẩu đang ở mức mô phỏng

Dữ liệu đang lưu trong bộ nhớ tạm

Danh sách phòng khám là dữ liệu mẫu

SOS chưa thực hiện cuộc gọi thật

Chưa tích hợp Maps, GPS, notification hoặc backend

</td>
</tr>
</table>

🌱 Hướng phát triển

<table>
<tr>
<td width="50%" valign="top">

Kết nối Firebase Authentication

Lưu dữ liệu với Firestore hoặc REST API

Lưu phiên đăng nhập cục bộ

Tích hợp bản đồ và định vị

</td>
<td width="50%" valign="top">

Thêm nhắc lịch chăm sóc

Hỗ trợ ảnh thật của thú cưng

Bổ sung dark mode

Viết test tự động

</td>
</tr>
</table>

👩‍💻 Nhóm thực hiện

<table>
<tr>
<td><b>Phạm Thế Duy</b><br><code>24100583</code><br></td>
<td><b>Phạm Thảo Hiền Vy</b><br><code>24100439</code><br></td>
<td><b>Nguyễn Hoàng Nam</b><br><code>24100136</code><br></td>
</tr>
</table>

<p align="center">
  <strong>Made with 💖 for pet lovers</strong><br>
  PawCare — soft routines, happier pets.
</p>
