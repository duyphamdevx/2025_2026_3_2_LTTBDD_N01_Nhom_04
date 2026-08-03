# PawCare - Ứng dụng chăm sóc thú cưng (Flutter)

Ứng dụng demo giao diện + tính năng theo đúng thiết kế: giới thiệu nhóm, đăng
nhập/đăng ký, trang chủ, hồ sơ thú cưng, lịch chăm sóc & tìm bác sĩ thú y,
cộng đồng (bảng tin/tin nhắn/nhóm), cá nhân - hỗ trợ song ngữ Việt/Anh, đổi
ngôn ngữ ngay trong app.

## Cách chạy

1. Cài Flutter SDK (https://docs.flutter.dev/get-started/install) nếu chưa có.
2. Giải nén project, mở terminal tại thư mục `pawcare`.
3. Cài dependency:
   ```
   flutter pub get
   ```
4. Chạy ứng dụng (kết nối điện thoại/giả lập hoặc dùng Chrome):
   ```
   flutter run
   ```

## Cấu trúc thư mục

```
lib/
  main.dart                    # Điểm khởi chạy, mở TeamInfoScreen đầu tiên
  theme/app_theme.dart         # Bảng màu, font (Baloo 2), theme dùng chung
  state/app_state.dart         # State dùng chung (thú cưng, việc, ngôn ngữ...)
  l10n/app_strings.dart        # Từ điển song ngữ Việt/Anh + hàm t('key')
  models/                      # Dữ liệu mẫu: Pet, Task, Clinic, Chat, Community
  widgets/                     # Bottom nav, badge+picker ngôn ngữ, bottom sheet
  screens/
    team_info_screen.dart      # Giới thiệu nhóm thực hiện (mở đầu app)
    login_screen.dart          # Đăng nhập
    register_screen.dart       # Đăng ký tài khoản
    home_screen.dart           # Trang chủ - thẻ chọn thú cưng, thêm thú cưng
    pet_profile_screen.dart    # Hồ sơ thú cưng (nước uống/khẩu phần/dị ứng)
    calendar_screen.dart       # Lịch + thêm việc cần làm + toggle Bác sĩ thú y
    vet_screen.dart            # Tìm phòng khám (tìm kiếm, lọc, đặt lịch, SOS)
    community_screen.dart      # Bảng tin, tin nhắn, nhóm của tôi
    chat_screen.dart           # Chi tiết 1 cuộc trò chuyện
    profile_screen.dart        # Cá nhân, đổi ngôn ngữ, về ứng dụng, nhóm thực hiện
```

## Tính năng đã hoàn thiện

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
  phòng khám, bảng tin, nhóm cộng đồng... vẫn hoạt động như trước, nay đã dịch
  song ngữ đầy đủ.

## Giới hạn / gợi ý làm tiếp

- Đăng nhập/đăng ký hiện là demo (chưa gọi API thật, chưa lưu phiên đăng nhập).
- Tên loài, giới tính do người dùng tự nhập khi thêm thú cưng mới sẽ giữ
  nguyên ngôn ngữ lúc nhập (không tự dịch) - đây là dữ liệu người dùng, khác
  với chữ giao diện cố định (đã dịch đầy đủ).
- Nội dung mẫu trong bảng tin/nhóm cộng đồng vẫn là tiếng Việt cố định (dữ
  liệu demo), có thể thay bằng dữ liệu thật/đa ngôn ngữ khi nối backend.
- Cần backend thật để đồng bộ dữ liệu, xác thực, push notification, bản đồ
  thật cho phần tìm phòng khám (xem thêm gợi ý ở bản trước).

## Ghi chú

- Đổi icon/ảnh thật cho thú cưng thay vì emoji: sửa `emoji` trong
  `models/pet.dart` bằng `Image.asset(...)`.
- Package dùng thêm: `table_calendar` (lịch), `intl` (định dạng ngày tháng),
  `google_fonts` (font Baloo 2).

