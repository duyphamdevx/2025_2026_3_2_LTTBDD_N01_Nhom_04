/// Model đại diện cho một thú cưng trong ứng dụng.
class Pet {
  final String id;
  String name;
  String species; // Loài, vd: Corgi, Mèo Anh lông ngắn...
  int age;
  String gender; // Mã: 'female' hoặc 'male' (hiển thị dịch qua t())
  String emoji; // icon đại diện đơn giản (dùng thay ảnh thật)
  String waterInfo;
  String foodInfo;
  String allergyInfo;
  bool hasAllergy;

  Pet({
    required this.id,
    required this.name,
    required this.species,
    required this.age,
    required this.gender,
    required this.emoji,
    required this.waterInfo,
    required this.foodInfo,
    required this.allergyInfo,
    this.hasAllergy = false,
  });
}

/// Dữ liệu mẫu cho danh sách thú cưng của người dùng.
final List<Pet> samplePets = [
  Pet(
    id: 'bella',
    name: 'Bella',
    species: 'Corgi',
    age: 2,
    gender: 'female',
    emoji: '🐕',
    waterInfo: 'Uống khoảng 500ml nước lọc mỗi ngày, thay nước 2 lần/ngày.',
    foodInfo: 'Khẩu phần: 150g hạt khô/ngày, chia 2 bữa sáng - tối.',
    allergyInfo: 'Nhạy với phấn hoa và hải sản.',
    hasAllergy: true,
  ),
  Pet(
    id: 'mit',
    name: 'Mít',
    species: 'Mèo Anh lông ngắn',
    age: 1,
    gender: 'female',
    emoji: '🐱',
    waterInfo: 'Uống khoảng 200ml nước mỗi ngày.',
    foodInfo: 'Khẩu phần: 80g hạt khô/ngày, chia 3 bữa nhỏ.',
    allergyInfo: 'Chưa ghi nhận dị ứng.',
    hasAllergy: false,
  ),
  Pet(
    id: 'tit',
    name: 'Tít',
    species: 'Thỏ',
    age: 1,
    gender: 'male',
    emoji: '🐰',
    waterInfo: 'Uống khoảng 100ml nước mỗi ngày.',
    foodInfo: 'Khẩu phần: cỏ khô tự do, 30g rau củ/ngày.',
    allergyInfo: 'Chưa ghi nhận dị ứng.',
    hasAllergy: false,
  ),
];
