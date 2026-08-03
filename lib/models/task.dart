/// Model cho một công việc/nhắc nhở chăm sóc thú cưng (vd: cho ăn, uống thuốc).
class PetTask {
  final String id;
  String title;
  String time;
  String emoji;
  bool isDone;

  PetTask({
    String? id,
    required this.title,
    required this.time,
    required this.emoji,
    this.isDone = false,
  }) : id = id ?? DateTime.now().microsecondsSinceEpoch.toString();
}

final List<PetTask> sampleTasks = [
  PetTask(title: 'Cho ăn sáng', time: '7:00', emoji: '🦴', isDone: true),
  PetTask(title: 'Uống thuốc dị ứng', time: '12:00', emoji: '💊'),
  PetTask(title: 'Tiêm phòng dại', time: '15:00', emoji: '💉'),
];
