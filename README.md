# 🐾 PawCare - Ứng dụng chăm sóc thú cưng (Flutter)

Ứng dụng quản lý chăm sóc thú cưng: đăng nhập/đăng ký/quên mật khẩu, quản lý
thú cưng, lịch chăm sóc & nhắc việc, đặt lịch khám thú y & SOS khẩn cấp, hồ sơ
cá nhân, hỗ trợ song ngữ Việt/Anh, đổi ngôn ngữ ngay trong app.

**Môn học:** Lập trình thiết bị di động
**Nhóm:** 04 - Lớp N01
**Repo:** https://github.com/duyphamdevx/2025_2026_3_2_LTTBDD_N01_Nhom_04

---

## 1. Cách chạy dự án

1. Cài Flutter SDK: https://docs.flutter.dev/get-started/install (kiểm tra
   bằng lệnh `flutter doctor`).
2. Clone repo về máy:
   ```bash
   git clone https://github.com/duyphamdevx/2025_2026_3_2_LTTBDD_N01_Nhom_04.git
   cd 2025_2026_3_2_LTTBDD_N01_Nhom_04
   ```
3. Cài dependency:
   ```bash
   flutter pub get
   ```
4. Chạy ứng dụng (kết nối điện thoại/máy ảo, hoặc chạy trên Chrome):
   ```bash
   flutter run
   ```

---

## 2. Cấu trúc thư mục

```
lib/
  main.dart                        # Điểm khởi chạy app, mở TeamInfoScreen đầu tiên
  theme/
    app_theme.dart                 # Bảng màu, font (Baloo 2), style dùng chung
  state/
    app_state.dart                 # State dùng chung toàn app (ChangeNotifier):
                                    #   danh sách thú cưng, việc cần làm, lịch khám,
                                    #   ngôn ngữ, tab hiện tại...
  l10n/
    app_strings.dart                # Từ điển song ngữ Việt/Anh + hàm t('key')
  models/
    pet.dart                        # Model Thú cưng (mutable, hỗ trợ sửa)
    task.dart                       # Model Việc cần làm (mutable, có id)
    appointment.dart                # Model Lịch khám thú y
    clinic.dart                     # Model Phòng khám thú y (dữ liệu mẫu)
  widgets/
    bottom_nav.dart                 # Thanh điều hướng dưới cùng (5 tab)
    app_bottom_sheet.dart           # Bottom sheet dùng chung cho các form
    language_badge.dart             # Badge + bảng chọn ngôn ngữ VI/EN
  screens/
<<<<<<< HEAD
    team_info_screen.dart           # Giới thiệu nhóm thực hiện (mở đầu app)
    login_screen.dart               # Đăng nhập
    register_screen.dart            # Đăng ký tài khoản
    forgot_password_screen.dart     # Quên mật khẩu (gửi email khôi phục)
    home_screen.dart                # Trang chủ - chọn thú cưng, việc hôm nay
    pet_profile_screen.dart         # Quản lý thú cưng (xem/thêm/sửa/xóa)
    calendar_screen.dart            # Lịch chăm sóc (xem/thêm/sửa/xóa/hoàn thành)
    services_screen.dart            # Dịch vụ thú y (tìm phòng khám/đặt-sửa-hủy
                                     #   lịch khám/SOS khẩn cấp)
    profile_screen.dart             # Cá nhân, đổi ngôn ngữ, về ứng dụng, nhóm
=======
    team_info_screen.dart      # Giới thiệu nhóm thực hiện (mở đầu app)
    login_screen.dart          # Đăng nhập
    register_screen.dart       # Đăng ký tài khoản
    home_screen.dart           # Trang chủ - thẻ chọn thú cưng, thêm thú cưng
    pet_profile_screen.dart    # Hồ sơ thú cưng (nước uống/khẩu phần/dị ứng)
    calendar_screen.dart       # Lịch + thêm việc cần làm + toggle Bác sĩ thú y
    vet_screen.dart            # Tìm phòng khám (tìm kiếm, lọc, đặt lịch, SOS)
    profile_screen.dart        # Cá nhân, đổi ngôn ngữ, về ứng dụng, nhóm thực hiện
>>>>>>> 0b5a0d5e9d17a05e3357098505ec9713d988cf75
```

---

<<<<<<< HEAD
## 3. Tính năng theo màn hình
=======
- **Trang giới thiệu nhóm** hiện đầu tiên khi mở app (giảng viên hướng dẫn, 3
  thành viên, vai trò, link GitHub), bấm "Bắt đầu" để vào Đăng nhập. Xem lại
  bất kỳ lúc nào qua Cá nhân > "Nhóm thực hiện". **Sửa tên/MSSV/vai trò thật
  của nhóm bạn** trực tiếp trong `lib/screens/team_info_screen.dart` (đầu file,
  hằng số `_members` và `_instructor`).
- **Đăng ký tài khoản** (họ tên, email, mật khẩu, xác nhận mật khẩu), liên kết
  hai chiều với màn Đăng nhập.
- **Song ngữ Việt/Anh đầy đủ**: bấm vào badge "VI"/"EN" ở góc trên bất kỳ màn
  hình nào, hoặc vào Cá nhân > "Ngôn ngữ" để đổi - toàn bộ giao diện (nhãn tab,
  nút bấm, tiêu đề, form...) cập nhật ngay lập tức, không cần khởi động lại.
- **Thẻ chọn thú cưng ở Trang chủ** đã sửa theo đúng ảnh: bo góc lớn, cao hơn,
  mỗi thú cưng 1 màu pastel riêng, viền cam + đổ bóng khi được chọn.
- Các tính năng thêm thú cưng, thêm việc cần làm, đặt lịch khám, tìm kiếm/lọc
  phòng khám, ... vẫn hoạt động như trước, nay đã dịch
  song ngữ đầy đủ.
>>>>>>> 0b5a0d5e9d17a05e3357098505ec9713d988cf75

### Đăng nhập / Đăng ký / Quên mật khẩu
- **Đăng nhập**: nhập email + mật khẩu, có nút "Quên mật khẩu?".
- **Quên mật khẩu**: nhập email → kiểm tra hợp lệ → gửi email khôi phục (demo)
  → thông báo thành công → quay lại màn hình đăng nhập.
- **Đăng ký**: nhập họ tên/email/mật khẩu/xác nhận mật khẩu → kiểm tra hợp lệ
  (email đúng định dạng, mật khẩu ≥ 6 ký tự, khớp xác nhận) → tạo tài khoản →
  thông báo thành công → quay lại màn hình đăng nhập.

### Trang chủ
- Hiển thị danh sách thú cưng, việc cần làm hôm nay.
- Chọn thú cưng để xem việc riêng của thú cưng đó, đánh dấu hoàn thành việc.
- 4 nút truy cập nhanh: Thú cưng, Lịch, Bác sĩ thú y, Cá nhân.

### Thú cưng
- Xem danh sách → chọn 1 thú cưng → xem chi tiết (nước uống/khẩu phần/dị ứng)
  → quay lại danh sách.
- Thêm / chỉnh sửa / xóa thú cưng, có kiểm tra hợp lệ và hộp thoại xác nhận
  khi xóa.

### Lịch
- Xem danh sách việc cần làm, chọn xem chi tiết.
- Thêm / chỉnh sửa / xóa việc cần làm, có kiểm tra hợp lệ và xác nhận khi xóa.
- Đánh dấu hoàn thành.

### Dịch vụ thú y
- Xem & tìm kiếm phòng khám (theo tên, lọc gần nhất/đánh giá cao/mở 24 giờ).
- Đặt lịch khám (chọn thú cưng, ngày, giờ, ghi chú), kiểm tra hợp lệ.
- Chỉnh sửa lịch khám đã đặt.
- Hủy lịch khám, có hộp thoại xác nhận.
- Gọi SOS cấp cứu khẩn cấp, có hộp thoại xác nhận trước khi gọi.

### Cá nhân
- Xem/sửa thông tin, đổi ngôn ngữ Việt/Anh, xem thông tin nhóm thực hiện.

---

## 4. Phân công nhóm

| Thành viên | Phụ trách |
|---|---|
| **Phạm Thế Duy** | Kiến trúc app (`state/`, `theme/`, `l10n/`, `widgets/`, `models/`) + màn hình **Lịch** (`calendar_screen.dart`) + **Dịch vụ thú y** (`services_screen.dart`) |
| **[Tên thành viên B]** | Màn hình **Trang chủ** (`home_screen.dart`) + **Thú cưng** (`pet_profile_screen.dart`) |
| **[Tên thành viên C]** | Màn hình **Đăng nhập** (`login_screen.dart`), **Đăng ký** (`register_screen.dart`), **Quên mật khẩu** (`forgot_password_screen.dart`), **Cá nhân** (`profile_screen.dart`) |

> Điền đúng họ tên + MSSV của 2 thành viên còn lại vào bảng trên trước khi nộp
> bài, đồng thời cập nhật trong `lib/screens/team_info_screen.dart` (hằng số
> `_members` và `_instructor` ở đầu file).

---

## 5. Quy trình làm việc nhóm (Git)

- Nhánh `main`: code chạy ổn định.
- Mỗi thành viên tạo nhánh riêng theo tính năng, ví dụ:
  ```bash
  git checkout -b feature/home-pet        # Trang chủ + Thú cưng
  git checkout -b feature/login-profile   # Đăng nhập + Cá nhân
  ```
- Commit nhỏ, rõ ràng theo từng phần việc:
  ```bash
  git add lib/screens/home_screen.dart lib/screens/pet_profile_screen.dart
  git commit -m "Hoàn thiện màn hình Trang chủ và Thú cưng"
  git push -u origin feature/home-pet
  ```
- Tạo **Pull Request** trên GitHub vào `main`, nhờ 1 thành viên khác review
  trước khi merge.

---

## 6. Kiến trúc & luồng dữ liệu

- Không dùng package quản lý state ngoài (Provider/Riverpod/Bloc), dùng
  `ChangeNotifier` (`AppState` trong `state/app_state.dart`) kết hợp
  `AnimatedBuilder` để các màn hình tự cập nhật khi dữ liệu thay đổi.
- `AppState` giữ danh sách `pets`, `tasks`, `appointments` dùng chung cho toàn
  app, cùng các hàm CRUD tương ứng (`addPet`, `removePet`, `addTask`,
  `removeTask`, `toggleTask`, `addAppointment`, `removeAppointment`...).
- Điều hướng 5 tab dưới cùng dùng `ValueNotifier<int>` (`appState.navIndex`),
  cho phép các màn hình khác (vd nút truy cập nhanh ở Trang chủ) chuyển tab
  trực tiếp qua `appState.goToTab(index)`.
- Đa ngôn ngữ: mọi chuỗi hiển thị lấy qua hàm `t('key')` trong
  `l10n/app_strings.dart`, tự động đổi theo `appState.language` ('vi'/'en').

---

## 7. Giới hạn / gợi ý làm tiếp

- Đăng nhập/đăng ký/quên mật khẩu hiện là demo (chưa gọi API thật, chưa lưu
  phiên đăng nhập, chưa gửi email thật).
- Dữ liệu thú cưng/việc cần làm/lịch khám lưu tạm trong bộ nhớ (mất khi tắt
  app), cần backend + local storage thật để lưu lâu dài.
- Danh sách phòng khám là dữ liệu mẫu tĩnh, chưa có bản đồ/định vị thật.
- Cần backend thật để đồng bộ dữ liệu nhiều thiết bị, xác thực, push
  notification.

---

## 8. Ghi chú kỹ thuật

- Package sử dụng: `table_calendar` (lịch), `intl` (định dạng ngày tháng),
  `google_fonts` (font Baloo 2).
- Đổi icon/ảnh thật cho thú cưng thay vì emoji: sửa trường `emoji` trong
  `models/pet.dart` bằng `Image.asset(...)`.
- File `.gitignore` đã loại trừ `build/`, `.dart_tool/` và các file cache khác,
  không commit các thư mục này.