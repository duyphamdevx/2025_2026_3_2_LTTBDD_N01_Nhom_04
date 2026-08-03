<div align="center">

🐾 PawCare

Ứng dụng quản lý và chăm sóc thú cưng được xây dựng bằng Flutter

<p>
  Theo dõi thú cưng • Lập lịch chăm sóc • Đặt lịch thú y • Hỗ trợ SOS • Song ngữ Việt/Anh
</p>

<p>
  <img src="https://img.shields.io/badge/Flutter-PawCare-02569B?logo=flutter&logoColor=white" alt="Flutter">
  <img src="https://img.shields.io/badge/Dart-%3E%3D%203.0-0175C2?logo=dart&logoColor=white" alt="Dart">
  <img src="https://img.shields.io/badge/Version-1.0.0-F28C45" alt="Version">
  <img src="https://img.shields.io/badge/Language-VI%20%7C%20EN-2A9D8F" alt="Language">
  <img src="https://img.shields.io/badge/Status-Academic%20Project-8A5CF5" alt="Status">
</p>

<p>
  <a href="#-giới-thiệu">Giới thiệu</a> •
  <a href="#-tính-năng-nổi-bật">Tính năng</a> •
  <a href="#-công-nghệ-sử-dụng">Công nghệ</a> •
  <a href="#-cài-đặt-và-chạy-dự-án">Cài đặt</a> •
  <a href="#-thành-viên-thực-hiện">Thành viên</a>
</p>

</div>

📖 Giới thiệu

PawCare là ứng dụng di động hỗ trợ người dùng quản lý thông tin và lịch chăm sóc thú cưng trong một giao diện thân thiện, trực quan.

Ứng dụng cung cấp các chức năng chính như đăng nhập, đăng ký, quản lý hồ sơ thú cưng, tạo công việc chăm sóc, theo dõi lịch, tìm phòng khám thú y, đặt lịch khám và gọi SOS trong trường hợp khẩn cấp.

Môn học: Lập trình thiết bị di độngLớp: N01Nhóm: 04Giảng viên hướng dẫn: ThS. Nguyễn Xuân Quế

✨ Tính năng nổi bật

Phân hệ

Chức năng

🔐 Tài khoản

Đăng nhập, đăng ký, quên mật khẩu và kiểm tra dữ liệu biểu mẫu

🐶 Thú cưng

Xem, thêm, chỉnh sửa và xóa hồ sơ thú cưng

🏠 Trang chủ

Chọn thú cưng, xem công việc hôm nay và truy cập nhanh các chức năng

📅 Lịch chăm sóc

Thêm, sửa, xóa, xem chi tiết và đánh dấu hoàn thành công việc

🏥 Dịch vụ thú y

Tìm kiếm, lọc phòng khám và quản lý lịch hẹn khám

🚨 SOS

Xác nhận trước khi thực hiện cuộc gọi hỗ trợ khẩn cấp

👤 Cá nhân

Xem và cập nhật thông tin người dùng, thông tin nhóm thực hiện

🌐 Song ngữ

Chuyển đổi tức thì giữa tiếng Việt và tiếng Anh

Chi tiết theo màn hình

<details>
<summary><b>🔐 Đăng nhập, đăng ký và quên mật khẩu</b></summary>

Kiểm tra email đúng định dạng.

Kiểm tra mật khẩu tối thiểu 6 ký tự.

Kiểm tra mật khẩu xác nhận trùng khớp.

Mô phỏng quy trình gửi email khôi phục mật khẩu.

Điều hướng hai chiều giữa đăng nhập và đăng ký.

</details>

<details>
<summary><b>🐾 Quản lý thú cưng</b></summary>

Hiển thị danh sách thú cưng.

Xem thông tin nước uống, khẩu phần ăn và dị ứng.

Thêm, chỉnh sửa hoặc xóa thú cưng.

Kiểm tra dữ liệu trước khi lưu.

Hiển thị hộp thoại xác nhận trước khi xóa.

</details>

<details>
<summary><b>📆 Lịch chăm sóc</b></summary>

Quản lý danh sách công việc theo ngày.

Thêm, sửa và xóa công việc.

Gán công việc cho từng thú cưng.

Đánh dấu công việc đã hoàn thành.

Hiển thị lịch bằng table_calendar.

</details>

<details>
<summary><b>🩺 Dịch vụ thú y</b></summary>

Tìm phòng khám theo tên.

Lọc phòng khám gần nhất, đánh giá cao hoặc mở cửa 24 giờ.

Đặt lịch theo thú cưng, ngày, giờ và ghi chú.

Chỉnh sửa hoặc hủy lịch đã đặt.

Xác nhận trước khi gọi SOS khẩn cấp.

</details>

🧰 Công nghệ sử dụng

Công nghệ

Vai trò

Flutter

Xây dựng giao diện và ứng dụng đa nền tảng

Dart

Ngôn ngữ lập trình chính

ChangeNotifier

Quản lý trạng thái dùng chung trong ứng dụng

AnimatedBuilder

Tự động cập nhật giao diện khi trạng thái thay đổi

table_calendar

Hiển thị và thao tác với lịch

intl

Định dạng ngày tháng và hỗ trợ locale

google_fonts

Sử dụng font chữ Google trong giao diện

Material Design

Hệ thống thành phần và phong cách giao diện

Dependencies

cupertino_icons: ^1.0.6
table_calendar: ^3.1.2
intl: ^0.19.0
google_fonts: ^6.2.1

🏗️ Kiến trúc ứng dụng

PawCare sử dụng kiến trúc đơn giản, phù hợp với phạm vi đồ án môn học:

flowchart TD
    UI["Screens & Widgets"] --> STATE["AppState - ChangeNotifier"]
    STATE --> PETS["Pet Model"]
    STATE --> TASKS["Task Model"]
    STATE --> APPOINTMENTS["Appointment Model"]
    STATE --> CLINICS["Clinic Model"]
    UI --> L10N["Vietnamese / English Strings"]
    UI --> THEME["App Theme"]

Luồng sử dụng chính

flowchart LR
    TEAM["Thông tin nhóm"] --> LOGIN["Đăng nhập"]
    LOGIN --> HOME["Trang chủ"]
    HOME --> PET["Thú cưng"]
    HOME --> CALENDAR["Lịch chăm sóc"]
    HOME --> SERVICES["Dịch vụ thú y"]
    HOME --> PROFILE["Cá nhân"]
    SERVICES --> SOS["SOS khẩn cấp"]

📂 Cấu trúc thư mục

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

Thư mục

Mô tả

models/

Các lớp dữ liệu của thú cưng, công việc, lịch hẹn và phòng khám

screens/

Các màn hình chính của ứng dụng

state/

Trạng thái dùng chung và các thao tác CRUD

l10n/

Chuỗi giao diện tiếng Việt và tiếng Anh

theme/

Bảng màu, font chữ và style dùng chung

widgets/

Các thành phần giao diện có thể tái sử dụng

🚀 Cài đặt và chạy dự án

1. Yêu cầu

Flutter SDK tương thích với Dart >=3.0.0 <4.0.0.

Android Studio, Visual Studio Code hoặc IDE hỗ trợ Flutter.

Điện thoại thật, máy ảo Android/iOS hoặc trình duyệt Chrome.

Git.

Kiểm tra môi trường:

flutter doctor

2. Clone repository

git clone https://github.com/duyphamdevx/2025_2026_3_2_LTTBDD_N01_Nhom_04.git
cd 2025_2026_3_2_LTTBDD_N01_Nhom_04

3. Tạo các thư mục nền tảng

Repository tập trung vào mã nguồn trong lib/. Chạy lệnh sau để tạo các thư mục nền tảng còn thiếu như android/, ios/ và web/:

flutter create .

Lệnh này giữ lại mã nguồn hiện có trong lib/ và bổ sung cấu trúc chuẩn của một dự án Flutter.

4. Cài đặt dependencies

flutter pub get

5. Chạy ứng dụng

flutter run

Chạy trên Chrome:

flutter run -d chrome

Liệt kê thiết bị khả dụng:

flutter devices

🌍 Đa ngôn ngữ

Toàn bộ chuỗi hiển thị được quản lý tại:

lib/l10n/app_strings.dart

Người dùng có thể chuyển đổi giữa:

🇻🇳 Tiếng Việt

🇬🇧 English

Khi thay đổi ngôn ngữ, giao diện được cập nhật ngay mà không cần khởi động lại ứng dụng.

👥 Thành viên thực hiện

STT

Họ và tên

MSSV

Phụ trách

1

Phạm Thế Duy

24100583

Kiến trúc ứng dụng, state, theme, localization, lịch và dịch vụ thú y

2

Phạm Thảo Hiền Vy

24100439

Trang chủ và quản lý hồ sơ thú cưng

3

Nguyễn Hoàng Nam

24100136

Đăng nhập, đăng ký, quên mật khẩu và hồ sơ cá nhân

Giảng viên hướng dẫn: ThS. Nguyễn Xuân Quế

🔄 Quy trình làm việc với Git

<details>
<summary><b>Xem quy trình đề xuất</b></summary>

Tạo nhánh tính năng

git checkout -b feature/ten-tinh-nang

Ví dụ:

git checkout -b feature/home-pet
git checkout -b feature/login-profile

Commit thay đổi

git add .
git commit -m "Hoàn thiện màn hình và chức năng"
git push -u origin feature/ten-tinh-nang

Merge code

Tạo Pull Request vào nhánh main.

Nhờ ít nhất một thành viên kiểm tra mã nguồn.

Giải quyết conflict trước khi merge.

Chỉ merge khi ứng dụng chạy ổn định.

</details>

⚠️ Giới hạn hiện tại

Đăng nhập, đăng ký và quên mật khẩu đang hoạt động ở mức mô phỏng.

Chưa kết nối API hoặc hệ thống xác thực thực tế.

Dữ liệu được lưu trong bộ nhớ và sẽ mất khi đóng ứng dụng.

Danh sách phòng khám hiện là dữ liệu mẫu.

Chưa tích hợp bản đồ, GPS, thông báo đẩy hoặc gọi điện thực tế.

Chưa có hệ thống kiểm thử tự động đầy đủ.

🗺️ Hướng phát triển

Kết nối Firebase Authentication.

Lưu dữ liệu bằng Firebase Firestore hoặc REST API.

Lưu phiên đăng nhập và dữ liệu cục bộ.

Tích hợp Google Maps và định vị GPS.

Thêm thông báo nhắc lịch chăm sóc.

Cho phép tải ảnh thật của thú cưng.

Bổ sung dark mode.

Viết unit test và widget test.

Xây dựng bản phát hành Android.

📝 Ghi chú

Dự án được xây dựng phục vụ mục đích học tập trong môn Lập trình thiết bị di động. Các dữ liệu về tài khoản, phòng khám và lịch hẹn hiện chỉ dùng để minh họa luồng chức năng.

<div align="center">

🐾 Chăm sóc thú cưng dễ dàng hơn cùng PawCare

Made with ❤️ by Nhóm 04 — Lớp N01

⬆ Về đầu trang

</div>
