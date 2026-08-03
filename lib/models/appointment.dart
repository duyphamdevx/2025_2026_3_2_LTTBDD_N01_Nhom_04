/// Model cho một lịch khám thú y đã đặt tại phòng khám.
class Appointment {
  final String id;
  String clinicName;
  String petName;
  DateTime date;
  String timeLabel; // Giờ hẹn đã format sẵn, vd: "14:30"
  String note;

  Appointment({
    String? id,
    required this.clinicName,
    required this.petName,
    required this.date,
    required this.timeLabel,
    this.note = '',
  }) : id = id ?? DateTime.now().microsecondsSinceEpoch.toString();

  String get dateLabel => '${date.day}/${date.month}/${date.year}';
}
