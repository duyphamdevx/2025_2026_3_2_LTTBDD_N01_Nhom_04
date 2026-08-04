import '../state/app_state.dart';

/// Trả về chuỗi đã dịch theo ngôn ngữ hiện tại (appState.language: 'vi'/'en').
/// Dùng: `Text(t('good_morning'))`.
/// Với chuỗi cần chèn giá trị động, dùng placeholder `{x}` rồi thay bằng
/// `.replaceFirst('{x}', value)`, ví dụ: `t('feed_reminder').replaceFirst('{pet}', name)`.
String t(String key) {
  final entry = _strings[key];
  if (entry == null) return key;
  return entry[appState.language] ?? entry['vi'] ?? key;
}

const Map<String, Map<String, String>> _strings = {
  // Chung
  'app_name': {'vi': 'PawCare', 'en': 'PawCare'},
  'cancel': {'vi': 'Hủy', 'en': 'Cancel'},
  'save': {'vi': 'Lưu thay đổi', 'en': 'Save changes'},
  'send': {'vi': 'Gửi', 'en': 'Send'},
  'start': {'vi': 'Bắt đầu', 'en': 'Get started'},
  'female': {'vi': 'Cái', 'en': 'Female'},
  'male': {'vi': 'Đực', 'en': 'Male'},
  'years_old': {'vi': 'tuổi', 'en': 'years old'},
  'choose_language': {'vi': 'Chọn ngôn ngữ', 'en': 'Choose language'},
  'vietnamese': {'vi': 'Tiếng Việt', 'en': 'Vietnamese'},
  'english': {'vi': 'Tiếng Anh', 'en': 'English'},

  // Bottom nav
  'nav_home': {'vi': 'Trang chủ', 'en': 'Home'},
  'nav_pet': {'vi': 'Thú cưng', 'en': 'Pets'},
  'nav_calendar': {'vi': 'Lịch', 'en': 'Calendar'},
  'nav_service': {'vi': 'Dịch vụ', 'en': 'Services'},
  'nav_profile': {'vi': 'Cá nhân', 'en': 'Profile'},

  // Đăng nhập / Đăng ký
  'login_title': {'vi': 'Đăng nhập PawCare', 'en': 'Login to PawCare'},
  'login_subtitle': {
    'vi': 'Đăng nhập để bắt đầu chăm sóc thú cưng của bạn',
    'en': 'Log in to start taking care of your pets',
  },
  'register_title': {'vi': 'Đăng ký PawCare', 'en': 'Create a PawCare account'},
  'register_subtitle': {
    'vi': 'Tạo tài khoản để bắt đầu chăm sóc thú cưng của bạn',
    'en': 'Sign up to start taking care of your pets',
  },
  'full_name': {'vi': 'Họ và tên', 'en': 'Full name'},
  'full_name_hint': {'vi': 'VD: Nguyễn Văn Minh', 'en': 'e.g. John Smith'},
  'email': {'vi': 'Email', 'en': 'Email'},
  'password': {'vi': 'Mật khẩu', 'en': 'Password'},
  'confirm_password': {'vi': 'Xác nhận mật khẩu', 'en': 'Confirm password'},
  'login_button': {'vi': 'Đăng nhập', 'en': 'Log in'},
  'register_button': {'vi': 'Đăng ký', 'en': 'Sign up'},
  'no_account': {'vi': 'Chưa có tài khoản? ', 'en': "Don't have an account? "},
  'have_account': {'vi': 'Đã có tài khoản? ', 'en': 'Already have an account? '},
  'password_mismatch': {
    'vi': 'Mật khẩu xác nhận không khớp',
    'en': 'Passwords do not match',
  },
  'forgot_password': {'vi': 'Quên mật khẩu?', 'en': 'Forgot password?'},
  'forgot_password_title': {'vi': 'Khôi phục mật khẩu', 'en': 'Reset your password'},
  'forgot_password_subtitle': {
    'vi': 'Nhập email đã đăng ký, chúng tôi sẽ gửi liên kết khôi phục mật khẩu cho bạn',
    'en': "Enter your registered email and we'll send you a password reset link",
  },
  'send_reset_email_button': {'vi': 'Gửi email khôi phục', 'en': 'Send recovery email'},
  'reset_email_sent_title': {'vi': 'Đã gửi email!', 'en': 'Email sent!'},
  'reset_email_sent_desc': {
    'vi': 'Vui lòng kiểm tra hộp thư {email} để khôi phục mật khẩu.',
    'en': 'Please check {email} to reset your password.',
  },
  'back_to_login': {'vi': 'Quay lại đăng nhập', 'en': 'Back to login'},
  'remember_password': {'vi': 'Đã nhớ mật khẩu? ', 'en': 'Remembered your password? '},
  'email_required': {'vi': 'Vui lòng nhập email', 'en': 'Please enter your email'},
  'email_invalid': {'vi': 'Email không hợp lệ', 'en': 'Please enter a valid email'},
  'name_required': {'vi': 'Vui lòng nhập họ và tên', 'en': 'Please enter your full name'},
  'password_too_short': {
    'vi': 'Mật khẩu phải có ít nhất 6 ký tự',
    'en': 'Password must be at least 6 characters',
  },
  'register_success_title': {'vi': 'Đăng ký thành công!', 'en': 'Registration successful!'},
  'register_success_desc': {
    'vi': 'Tài khoản của bạn đã được tạo. Vui lòng đăng nhập để tiếp tục.',
    'en': 'Your account has been created. Please log in to continue.',
  },
  'ok': {'vi': 'Đồng ý', 'en': 'OK'},
  'yes': {'vi': 'Có', 'en': 'Yes'},
  'no': {'vi': 'Không', 'en': 'No'},
  'delete': {'vi': 'Xóa', 'en': 'Delete'},
  'edit': {'vi': 'Sửa', 'en': 'Edit'},

  // Trang chủ
  'good_morning': {'vi': 'Chào buổi sáng, {name} 👋', 'en': 'Good morning, {name} 👋'},
  'feed_reminder': {
    'vi': '{pet} cần cho ăn trong 20 phút nữa',
    'en': '{pet} needs feeding in 20 minutes',
  },
  'quick_pet': {'vi': 'Thú cưng', 'en': 'Pets'},
  'quick_calendar': {'vi': 'Lịch', 'en': 'Calendar'},
  'quick_vet': {'vi': 'Bác sĩ thú y', 'en': 'Vet'},
  'quick_profile': {'vi': 'Hồ sơ', 'en': 'Profile'},
  'today': {'vi': 'Hôm nay', 'en': 'Today'},
  'done_at': {'vi': 'đã hoàn thành', 'en': 'completed'},
  'add_pet_title': {'vi': 'Thêm thú cưng mới', 'en': 'Add a new pet'},
  'pet_name': {'vi': 'Tên thú cưng', 'en': 'Pet name'},
  'pet_name_hint': {'vi': 'VD: Bông', 'en': 'e.g. Buddy'},
  'species': {'vi': 'Loài', 'en': 'Species'},
  'species_hint': {'vi': 'VD: Poodle, Mèo Anh...', 'en': 'e.g. Poodle, British Shorthair...'},
  'age': {'vi': 'Tuổi', 'en': 'Age'},
  'age_hint': {'vi': 'VD: 1', 'en': 'e.g. 1'},
  'gender': {'vi': 'Giới tính', 'en': 'Gender'},
  'add_pet_button': {'vi': 'Thêm thú cưng', 'en': 'Add pet'},

  // Hồ sơ thú cưng
  'water': {'vi': 'Nước uống', 'en': 'Water'},
  'diet': {'vi': 'Khẩu phần ăn', 'en': 'Diet'},
  'allergy': {'vi': 'Dị ứng', 'en': 'Allergy'},
  'other_needs': {'vi': 'Nhu cầu khác', 'en': 'Other needs'},
  'bathing': {'vi': 'Tắm rửa', 'en': 'Bathing'},
  'vaccination': {'vi': 'Tiêm phòng', 'en': 'Vaccination'},
  'tap_to_switch': {
    'vi': 'Chạm vào ảnh để xem thú cưng khác',
    'en': 'Tap the photo to view other pets',
  },
  'pet_management_title': {'vi': 'Quản lý thú cưng', 'en': 'Manage pets'},
  'pet_list_subtitle': {
    'vi': 'Chọn một thú cưng để xem chi tiết',
    'en': 'Select a pet to view details',
  },
  'no_pets': {'vi': 'Chưa có thú cưng nào', 'en': 'No pets yet'},
  'back_to_list': {'vi': 'Quay lại danh sách', 'en': 'Back to list'},
  'edit_pet_title': {'vi': 'Chỉnh sửa thú cưng', 'en': 'Edit pet'},
  'delete_pet_title': {'vi': 'Xóa thú cưng', 'en': 'Delete pet'},
  'delete_pet_confirm': {
    'vi': 'Bạn có chắc muốn xóa {pet} không?',
    'en': 'Are you sure you want to delete {pet}?',
  },
  'pet_deleted_snack': {'vi': 'Đã xóa {pet}', 'en': '{pet} has been deleted'},
  'pet_name_required': {'vi': 'Vui lòng nhập tên thú cưng', 'en': 'Please enter a pet name'},
  'pet_updated_snack': {'vi': 'Đã cập nhật thông tin {pet}', 'en': "Updated {pet}'s information"},
  'water_hint': {'vi': 'VD: 500ml/ngày', 'en': 'e.g. 500ml/day'},
  'diet_hint': {'vi': 'VD: 150g hạt khô/ngày', 'en': 'e.g. 150g of kibble/day'},
  'allergy_hint': {'vi': 'VD: Nhạy với hải sản', 'en': 'e.g. Sensitive to seafood'},

  // Lịch
  'calendar_tab': {'vi': 'Lịch', 'en': 'Calendar'},
  'vet_tab': {'vi': 'Bác sĩ thú y', 'en': 'Vet'},
  'todo': {'vi': 'Việc cần làm', 'en': 'To-do'},
  'no_tasks': {'vi': 'Chưa có việc cần làm nào', 'en': 'No tasks yet'},
  'add_task_title': {'vi': 'Thêm việc cần làm', 'en': 'Add a task'},
  'task_name': {'vi': 'Tên việc cần làm', 'en': 'Task name'},
  'task_name_hint': {'vi': 'VD: Cho ăn tối', 'en': 'e.g. Evening feeding'},
  'icon_label': {'vi': 'Biểu tượng', 'en': 'Icon'},
  'time_label': {'vi': 'Thời gian', 'en': 'Time'},
  'add_task_button': {'vi': 'Thêm việc cần làm', 'en': 'Add task'},
  'edit_task_title': {'vi': 'Chỉnh sửa việc cần làm', 'en': 'Edit task'},
  'update_task_button': {'vi': 'Cập nhật việc cần làm', 'en': 'Update task'},
  'delete_task_title': {'vi': 'Xóa việc cần làm', 'en': 'Delete task'},
  'delete_task_confirm': {
    'vi': 'Bạn có chắc muốn xóa việc "{task}" không?',
    'en': 'Are you sure you want to delete "{task}"?',
  },
  'task_name_required': {'vi': 'Vui lòng nhập tên việc cần làm', 'en': 'Please enter a task name'},
  'task_deleted_snack': {'vi': 'Đã xóa việc cần làm', 'en': 'Task deleted'},

  // Dịch vụ thú y
  'services_title': {'vi': 'Dịch vụ thú y', 'en': 'Vet services'},
  'services_subtitle': {
    'vi': 'Tìm phòng khám, đặt lịch khám và cứu hộ khẩn cấp',
    'en': 'Find clinics, book appointments and emergency rescue',
  },
  'find_clinic_near': {'vi': 'Tìm phòng khám gần bạn', 'en': 'Find clinics near you'},
  'search_clinic_hint': {
    'vi': 'Tìm phòng khám, quận...',
    'en': 'Search clinics, district...',
  },
  'sos_title': {'vi': 'Cứu hộ khẩn cấp 24/7', 'en': '24/7 Emergency rescue'},
  'sos_subtitle': {
    'vi': 'Gọi ngay nếu thú cưng gặp nguy hiểm',
    'en': 'Call now if your pet is in danger',
  },
  'sos_confirm': {
    'vi': 'Bạn có chắc muốn gọi ngay cho đội cứu hộ thú y khẩn cấp không?',
    'en': 'Are you sure you want to call the emergency vet rescue team now?',
  },
  'sos_call_now': {'vi': 'Gọi ngay', 'en': 'Call now'},
  'sos_connecting': {
    'vi': 'Đang kết nối tới đội cứu hộ khẩn cấp...',
    'en': 'Connecting to the emergency rescue team...',
  },
  'filter_near': {'vi': 'Gần nhất', 'en': 'Nearest'},
  'filter_rating': {'vi': 'Đánh giá cao', 'en': 'Top rated'},
  'filter_24_7': {'vi': 'Cấp cứu 24/7', 'en': '24/7 emergency'},
  'clinics_nearby': {'vi': 'Phòng khám quanh đây', 'en': 'Clinics nearby'},
  'no_clinics': {
    'vi': 'Không tìm thấy phòng khám phù hợp',
    'en': 'No matching clinics found',
  },
  'book': {'vi': 'Đặt lịch', 'en': 'Book'},
  'booked_snack': {
    'vi': 'Đã đặt lịch khám tại {clinic}, xem trong tab Lịch nhé!',
    'en': 'Booked an appointment at {clinic} - check the Calendar tab!',
  },
  'exam_at': {'vi': 'Khám tại {clinic}', 'en': 'Checkup at {clinic}'},
  'book_appointment_title': {'vi': 'Đặt lịch khám', 'en': 'Book an appointment'},
  'edit_appointment_title': {'vi': 'Chỉnh sửa lịch khám', 'en': 'Edit appointment'},
  'choose_pet': {'vi': 'Chọn thú cưng', 'en': 'Choose a pet'},
  'choose_date': {'vi': 'Chọn ngày', 'en': 'Choose date'},
  'choose_time': {'vi': 'Chọn giờ', 'en': 'Choose time'},
  'note_label': {'vi': 'Ghi chú', 'en': 'Note'},
  'note_hint': {
    'vi': 'VD: Khám định kỳ, tiêm phòng...',
    'en': 'e.g. Regular checkup, vaccination...',
  },
  'update_appointment_button': {'vi': 'Cập nhật lịch khám', 'en': 'Update appointment'},
  'select_pet_error': {'vi': 'Vui lòng chọn thú cưng', 'en': 'Please select a pet'},
  'select_date_error': {'vi': 'Vui lòng chọn ngày khám', 'en': 'Please select a date'},
  'select_time_error': {'vi': 'Vui lòng chọn giờ khám', 'en': 'Please select a time'},
  'your_appointments': {'vi': 'Lịch khám của bạn', 'en': 'Your appointments'},
  'no_appointments': {'vi': 'Chưa có lịch khám nào', 'en': 'No appointments yet'},
  'appointment_updated_snack': {
    'vi': 'Đã cập nhật lịch khám tại {clinic}',
    'en': 'Updated appointment at {clinic}',
  },
  'cancel_appointment_title': {'vi': 'Hủy lịch khám', 'en': 'Cancel appointment'},
  'cancel_appointment_confirm': {
    'vi': 'Bạn có chắc muốn hủy lịch khám tại {clinic} không?',
    'en': 'Are you sure you want to cancel the appointment at {clinic}?',
  },
  'appointment_cancelled_snack': {
    'vi': 'Đã hủy lịch khám tại {clinic}',
    'en': 'Cancelled appointment at {clinic}',
  },
  'keep_appointment': {'vi': 'Giữ lịch', 'en': 'Keep it'},

  // Cá nhân
  'owner_label': {'vi': 'Chủ nuôi · {pets}', 'en': 'Pet owner · {pets}'},
  'edit_profile': {'vi': 'Chỉnh sửa hồ sơ', 'en': 'Edit profile'},
  'settings': {'vi': 'Cài đặt', 'en': 'Settings'},
  'language': {'vi': 'Ngôn ngữ', 'en': 'Language'},
  'notifications': {'vi': 'Thông báo', 'en': 'Notifications'},
  'about_app': {'vi': 'Về ứng dụng', 'en': 'About app'},
  'team_info': {'vi': 'Nhóm thực hiện', 'en': 'Development team'},
  'logout': {'vi': 'Đăng xuất', 'en': 'Log out'},
  'your_name': {'vi': 'Tên của bạn', 'en': 'Your name'},
  'display_name_hint': {'vi': 'Tên hiển thị', 'en': 'Display name'},
  'about_app_desc': {
    'vi': 'Giúp bạn quản lý thú cưng, theo dõi lịch ăn uống, tiêm phòng, '
        'tìm phòng khám thú y và đặt lịch khám nhanh chóng.',
    'en': 'Helps you manage your pets, track feeding and vaccination '
        'schedules, find vet clinics and book appointments quickly.',
  },
  'version_label': {'vi': 'Phiên bản 1.0.0', 'en': 'Version 1.0.0'},

  // Trang giới thiệu nhóm
  'team_header': {
    'vi': 'Bài tập lớn · Lập trình cho thiết bị di động · Nhóm IV',
    'en': 'Capstone Project · Mobile App Development · Group IV',
  },
  'team_info_title': {'vi': 'Thông tin nhóm', 'en': 'Team information'},
  'instructor': {'vi': 'Giảng viên hướng dẫn', 'en': 'Instructor'},
  'student_id': {'vi': 'MSSV', 'en': 'Student ID'},
};
