/// Model cho phòng khám thú y.
class Clinic {
  final String name;
  final double rating;
  final double distanceKm;
  final bool open24h;

  const Clinic({
    required this.name,
    required this.rating,
    required this.distanceKm,
    this.open24h = false,
  });

  /// Nhãn khoảng cách hiển thị (m nếu <1km, ngược lại km).
  String get distanceLabel =>
      distanceKm < 1 ? '${(distanceKm * 1000).round()}m' : '${distanceKm.toStringAsFixed(1)}km';
}

final List<Clinic> sampleClinics = [
  const Clinic(name: 'PetCare Clinic', rating: 4.8, distanceKm: 0.8, open24h: true),
  const Clinic(name: 'Phòng khám Vet24h', rating: 4.6, distanceKm: 1.2, open24h: true),
  const Clinic(name: 'Phòng khám Thú y An Khang', rating: 4.5, distanceKm: 1.8),
];
