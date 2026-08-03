<p align="center">
  <img src="./docs/images/pawcare-banner.svg" alt="PawCare Banner" width="100%" />
</p>

<div align="center">



Một nơi để lưu hồ sơ, sắp xếp lịch chăm sóc và đồng hành cùng thú cưng mỗi ngày.

Khám phá tính năng · Cài đặt · Cấu trúc · Nhóm thực hiện

</div>

🌷 PawCare là gì?

PawCare là ứng dụng Flutter giúp người nuôi thú cưng quản lý thông tin, lịch chăm sóc và lịch khám thú y trong một trải nghiệm đơn giản, thân thiện và song ngữ.

<table>
<tr>
<td width="33%" align="center">
<h3>🐾 Quản lý tập trung</h3>
<p>Thông tin thú cưng, công việc và lịch hẹn nằm trong cùng một ứng dụng.</p>
</td>
<td width="33%" align="center">
<h3>⏰ Chăm sóc đúng lúc</h3>
<p>Lên lịch, theo dõi và đánh dấu các công việc chăm sóc hằng ngày.</p>
</td>
<td width="33%" align="center">
<h3>💗 Dễ dùng mỗi ngày</h3>
<p>Giao diện mềm mại, thao tác rõ ràng và hỗ trợ tiếng Việt lẫn tiếng Anh.</p>
</td>
</tr>
</table>

✨ PawCare có gì?

<table>
<tr>
<td width="50%" valign="top">

🐶 Hồ sơ thú cưng

Thêm, sửa và xóa thú cưng

Theo dõi thức ăn, nước uống và dị ứng

Chọn nhanh thú cưng đang cần chăm sóc

</td>
<td width="50%" valign="top">

📆 Lịch chăm sóc

Tạo công việc theo ngày và giờ

Gán công việc cho từng thú cưng

Đánh dấu hoàn thành và chỉnh sửa linh hoạt

</td>
</tr>
<tr>
<td width="50%" valign="top">

🏥 Dịch vụ thú y

Tìm kiếm và lọc phòng khám

Đặt, chỉnh sửa hoặc hủy lịch khám

Hỗ trợ luồng gọi SOS khẩn cấp

</td>
<td width="50%" valign="top">

🔐 Tài khoản & cá nhân

Đăng nhập, đăng ký, quên mật khẩu

Kiểm tra dữ liệu biểu mẫu

Quản lý thông tin cá nhân và xem thông tin nhóm

</td>
</tr>
</table>

<div align="center">

Pet Profile · Daily Planner · Vet Booking · SOS · Vietnamese / English

</div>

🧭 Luồng trải nghiệm

flowchart LR
    A[Thông tin nhóm] --> B[Đăng nhập]
    B --> C[Trang chủ]
    C --> D[Hồ sơ thú cưng]
    C --> E[Lịch chăm sóc]
    C --> F[Dịch vụ thú y]
    C --> G[Cá nhân]
    F --> H[SOS]

    classDef primary fill:#FFF0E6,stroke:#F47745,color:#3E3330,stroke-width:2px;
    classDef purple fill:#F3EEFF,stroke:#8768E8,color:#3E3748,stroke-width:2px;
    classDef green fill:#EBF8F4,stroke:#2FAE8C,color:#31433E,stroke-width:2px;
    class A,B,C primary;
    class D,E,G purple;
    class F,H green;

🧰 Công nghệ

<div align="center">



</div>

Thành phần

Vai trò

ChangeNotifier + AnimatedBuilder

Quản lý và đồng bộ trạng thái giao diện

table_calendar

Hiển thị lịch và công việc theo ngày

intl

Định dạng ngày tháng và locale

google_fonts

Đồng bộ font chữ cho giao diện

Material Design

Thành phần và phong cách UI chính

🚀 Chạy dự án

1. Clone repository

git clone https://github.com/duyphamdevx/2025_2026_3_2_LTTBDD_N01_Nhom_04.git
cd 2025_2026_3_2_LTTBDD_N01_Nhom_04

2. Khởi tạo cấu trúc Flutter

Repository tập trung vào mã nguồn trong lib/. Tạo các thư mục nền tảng còn thiếu bằng lệnh:

flutter create .

3. Cài dependencies và chạy

flutter pub get
flutter run

<details>
<summary><b>Một số lệnh hữu ích</b></summary>

# Kiểm tra môi trường
flutter doctor

# Xem danh sách thiết bị
flutter devices

# Chạy trên trình duyệt Chrome
flutter run -d chrome

</details>

🗂 Cấu trúc dự án

<details open>
<summary><b>Xem cây thư mục chính</b></summary>

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

</details>

flowchart TD
    UI[Screens & Widgets] --> STATE[AppState]
    STATE --> PET[Pet]
    STATE --> TASK[Task]
    STATE --> APPOINTMENT[Appointment]
    STATE --> CLINIC[Clinic]
    UI --> L10N[VI / EN Strings]
    UI --> THEME[App Theme]

    classDef ui fill:#FFF0E6,stroke:#F47745,color:#3E3330;
    classDef state fill:#F3EEFF,stroke:#8768E8,color:#3E3748;
    classDef model fill:#EBF8F4,stroke:#2FAE8C,color:#31433E;
    class UI,L10N,THEME ui;
    class STATE state;
    class PET,TASK,APPOINTMENT,CLINIC model;

🌏 Hỗ trợ song ngữ

PawCare cho phép chuyển đổi tức thì giữa Tiếng Việt và English. Các chuỗi giao diện được quản lý tập trung tại:

lib/l10n/app_strings.dart

👩‍💻 Nhóm thực hiện

<div align="center">

Nhóm 04 · Lớp N01

Môn Lập trình thiết bị di động

</div>

Thành viên

MSSV

Phụ trách chính

Phạm Thế Duy

24100583

Kiến trúc, state, theme, localization, lịch và dịch vụ thú y

Phạm Thảo Hiền Vy

24100439

Trang chủ và quản lý hồ sơ thú cưng

Nguyễn Hoàng Nam

24100136

Xác thực, quên mật khẩu và hồ sơ cá nhân

<div align="center">

Giảng viên hướng dẫn: ThS. Nguyễn Xuân Quế

</div>

🛣 Hướng phát triển

Kết nối Firebase Authentication và Firestore

Lưu phiên đăng nhập và dữ liệu cục bộ

Thêm Google Maps, GPS và phòng khám thực tế

Gửi thông báo nhắc lịch chăm sóc

Cho phép tải ảnh thú cưng

Bổ sung dark mode và automated tests

📌 Trạng thái hiện tại

Đây là dự án học tập. Luồng đăng nhập, dữ liệu phòng khám, lịch hẹn và SOS hiện được mô phỏng; dữ liệu chưa được lưu lâu dài sau khi đóng ứng dụng.

<div align="center">

🐾 Small routines. Happier pets.

Made with 🧡 by PawCare Team — Nhóm 04

⬆ Trở về đầu trang

</div>
