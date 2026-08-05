import 'package:flutter/material.dart';
import '../models/pet.dart';
import '../models/task.dart';
import '../models/appointment.dart';

/// Nguồn dữ liệu dùng chung cho toàn app (thú cưng, việc cần làm, tên chủ
/// nuôi...). Dùng ChangeNotifier + AnimatedBuilder để các màn hình tự cập
/// nhật khi có thay đổi, không cần package quản lý state ngoài.
class AppState extends ChangeNotifier {
  String ownerName = 'Nhi';
  String? _ownerAvatarPath;
  final List<Pet> pets = List.of(samplePets);
  final List<PetTask> tasks = List.of(sampleTasks);
  final List<Appointment> appointments = [];

  String? get ownerAvatarPath => _ownerAvatarPath;

  /// Ngôn ngữ hiện tại của ứng dụng: 'vi' (Tiếng Việt) hoặc 'en' (English).
  String language = 'vi';

  void setLanguage(String code) {
    if (language == code) return;
    language = code;
    notifyListeners();
  }

  /// Chỉ số tab hiện tại của thanh điều hướng dưới cùng (0: Trang chủ,
  /// 1: Thú cưng, 2: Lịch, 3: Dịch vụ, 4: Cá nhân). Cho phép các màn hình
  /// khác (vd: nút "Truy cập nhanh" ở Trang chủ) chuyển tab trực tiếp.
  final ValueNotifier<int> navIndex = ValueNotifier<int>(0);

  void goToTab(int index) => navIndex.value = index;

  /// Chuyển thẳng sang tab "Dịch vụ" (phòng khám thú y / SOS).
  void goToVetTab() => navIndex.value = 3;

  String get petNamesLabel => pets.map((p) => p.name).join(', ');

  // ----------------------- Thú cưng -----------------------
  void addPet(Pet pet) {
    pets.add(pet);
    notifyListeners();
  }

  void removePet(Pet pet) {
    pets.remove(pet);
    notifyListeners();
  }

  /// Dùng sau khi các trường của [pet] đã được chỉnh sửa trực tiếp, để các
  /// màn hình đang lắng nghe appState cập nhật lại giao diện.
  void notifyPetsChanged() => notifyListeners();

  // ----------------------- Công việc -----------------------
  void addTask(PetTask task) {
    tasks.add(task);
    notifyListeners();
  }

  void removeTask(PetTask task) {
    tasks.remove(task);
    notifyListeners();
  }

  void toggleTask(PetTask task) {
    task.isDone = !task.isDone;
    notifyListeners();
  }

  void notifyTasksChanged() => notifyListeners();

  // ----------------------- Lịch khám -----------------------
  void addAppointment(Appointment appointment) {
    appointments.add(appointment);
    notifyListeners();
  }

  void removeAppointment(Appointment appointment) {
    appointments.remove(appointment);
    notifyListeners();
  }

  void notifyAppointmentsChanged() => notifyListeners();

  void updateOwnerName(String name) {
    if (name.trim().isEmpty) return;
    ownerName = name.trim();
    notifyListeners();
  }

  void updateOwnerAvatarPath(String? path) {
    _ownerAvatarPath = path;
    notifyListeners();
  }

  /// Chọn emoji phù hợp dựa theo tên loài người dùng nhập khi thêm thú cưng mới.
  static String emojiForSpecies(String species) {
    final s = species.toLowerCase();
    if (s.contains('mèo') || s.contains('meo') || s.contains('cat')) return '🐱';
    if (s.contains('thỏ') || s.contains('tho') || s.contains('rabbit')) return '🐰';
    if (s.contains('chim') || s.contains('bird')) return '🐦';
    if (s.contains('cá') || s.contains('ca ') || s.contains('fish')) return '🐠';
    if (s.contains('hamster')) return '🐹';
    return '🐕';
  }
}

/// Instance dùng chung cho toàn app.
final AppState appState = AppState();
