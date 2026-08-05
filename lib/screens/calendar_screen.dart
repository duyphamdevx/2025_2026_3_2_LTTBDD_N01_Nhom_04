import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../theme/app_theme.dart';
import '../models/task.dart';
import '../state/app_state.dart';
import '../l10n/app_strings.dart';
import '../widgets/language_badge.dart';
import '../widgets/app_bottom_sheet.dart';

const _monthAbbrEn = [
  'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
  'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
];

/// Màn hình "Lịch":
/// - Xem công việc -> chọn 1 việc -> xem chi tiết -> quay lại danh sách.
/// - Thêm / chỉnh sửa / xóa công việc, có kiểm tra hợp lệ & xác nhận xóa.
/// - Đánh dấu hoàn thành.
class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  final List<String> _emojiChoices = const ['🦴', '💊', '💉', '🚿', '🩺', '🍚'];

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
  }

  // Helper: parse a simple "HH:mm" string into TimeOfDay.
  TimeOfDay _parseTimeOfDayFromString(String t) {
    final parts = t.split(':');
    if (parts.length >= 2) {
      final h = int.tryParse(parts[0]) ?? 0;
      final m = int.tryParse(parts[1]) ?? 0;
      return TimeOfDay(hour: h, minute: m);
    }
    return TimeOfDay.now();
  }

  void _openTaskForm({PetTask? existing}) {
    final titleController = TextEditingController(text: existing?.title ?? '');
    // Preserve existing task time when editing (instead of losing it and
    // writing TimeOfDay.now()).
    TimeOfDay pickedTime = existing != null
        ? _parseTimeOfDayFromString(existing.time)
        : TimeOfDay.now();
    String selectedEmoji = existing?.emoji ?? _emojiChoices.first;
    String? errorText;

    showAppBottomSheet(
      context: context,
      title: existing == null ? t('add_task_title') : t('edit_task_title'),
      child: StatefulBuilder(
        builder: (context, setSheetState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(t('task_name'), style: const TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 6),
              TextField(
                controller: titleController,
                decoration: InputDecoration(hintText: t('task_name_hint')),
              ),
              const SizedBox(height: 14),
              Text(t('icon_label'), style: const TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: _emojiChoices.map((emoji) {
                  final selected = emoji == selectedEmoji;
                  return GestureDetector(
                    onTap: () => setSheetState(() => selectedEmoji = emoji),
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: selected ? AppColors.pinkLight : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: selected ? AppColors.primaryOrangeDark : Colors.black12,
                        ),
                      ),
                      child: Center(child: Text(emoji, style: const TextStyle(fontSize: 20))),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 14),
              Text(t('time_label'), style: const TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () async {
                  final result = await showTimePicker(
                    context: context,
                    initialTime: pickedTime,
                  );
                  if (result != null) setSheetState(() => pickedTime = result);
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF6F1EC),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.access_time_rounded, color: AppColors.textGrey, size: 18),
                      const SizedBox(width: 8),
                      Text(existing != null ? existing.time : pickedTime.format(context)),
                    ],
                  ),
                ),
              ),
              if (errorText != null) ...[
                const SizedBox(height: 10),
                Text(errorText!, style: const TextStyle(color: AppColors.allergyRed, fontSize: 12)),
              ],
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (titleController.text.trim().isEmpty) {
                      setSheetState(() => errorText = t('task_name_required'));
                      return;
                    }
                    if (existing == null) {
                      appState.addTask(PetTask(
                        title: titleController.text.trim(),
                        time: pickedTime.format(context),
                        emoji: selectedEmoji,
                      ));
                    } else {
                      existing.title = titleController.text.trim();
                      existing.emoji = selectedEmoji;
                      existing.time = pickedTime.format(context);
                      appState.notifyTasksChanged();
                    }
                    Navigator.of(context).pop();
                  },
                  child: Text(existing == null ? t('add_task_button') : t('update_task_button')),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _confirmDeleteTask(PetTask task) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(t('delete_task_title')),
        content: Text(t('delete_task_confirm').replaceFirst('{task}', task.title)),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(t('no'), style: const TextStyle(color: AppColors.textGrey)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.allergyRed),
            onPressed: () {
              Navigator.of(context).pop();
              appState.removeTask(task);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(t('task_deleted_snack'))),
              );
            },
            child: Text(t('yes')),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: appState,
      builder: (context, _) {
        return SafeArea(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
                decoration: const BoxDecoration(
                  gradient: AppColors.tealHeaderGradient,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      t('calendar_tab'),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const LanguageBadge(background: Colors.white24, textColor: Colors.white),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Stack(
                  children: [
                    _buildScheduleView(),
                    Positioned(
                      right: 20,
                      bottom: 20,
                      child: FloatingActionButton(
                        heroTag: 'add_task_fab',
                        backgroundColor: const Color(0xFFFFC15C),
                        onPressed: () => _openTaskForm(),
                        child: const Icon(Icons.add_rounded, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildScheduleView() {
    return AnimatedBuilder(
      animation: appState,
      builder: (context, _) {
        final tasks = appState.tasks;
        return SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 90),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: AppTheme.cardDecoration(),
                child: TableCalendar(
                  locale: 'vi_VN',
                  firstDay: DateTime.utc(2020, 1, 1),
                  lastDay: DateTime.utc(2035, 12, 31),
                  focusedDay: _focusedDay,
                  selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  },
                  // Update focused month when user pages the calendar (chevrons/swipe)
                  onPageChanged: (focusedDay) {
                    setState(() => _focusedDay = focusedDay);
                  },
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  calendarStyle: CalendarStyle(
                    todayDecoration: BoxDecoration(
                      color: AppColors.pinkLight,
                      shape: BoxShape.circle,
                    ),
                    todayTextStyle: const TextStyle(color: AppColors.primaryOrangeDark),
                    selectedDecoration: const BoxDecoration(
                      color: AppColors.primaryOrangeDark,
                      shape: BoxShape.circle,
                    ),
                  ),
                  headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                    titleTextStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    leftChevronIcon: const Icon(Icons.chevron_left_rounded, color: AppColors.secondaryTeal),
                    rightChevronIcon: const Icon(Icons.chevron_right_rounded, color: AppColors.secondaryTeal),
                    titleTextFormatter: (date, locale) => appState.language == 'vi'
                        ? 'Th${date.month} ${date.year}'
                        : '${_monthAbbrEn[date.month - 1]} ${date.year}',
                  ),
                  calendarBuilders: CalendarBuilders(
                    dowBuilder: (context, day) {
                      final labels = appState.language == 'vi'
                          ? const ['T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'CN']
                          : const ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su'];
                      return Center(
                        child: Text(
                          labels[day.weekday - 1],
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textGrey,
                          ),
                        ),
                      );
                    },
                  ),
                  calendarFormat: CalendarFormat.month,
                  availableCalendarFormats: const {CalendarFormat.month: 'Tháng'},
                ),
              ),
              const SizedBox(height: 20),
              Text(t('todo'), style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 12),
              if (tasks.isEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Center(
                    child: Text(t('no_tasks'), style: const TextStyle(color: AppColors.textGrey)),
                  ),
                )
              else
                ...tasks.map(
                  (task) => Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(14),
                    decoration: AppTheme.cardDecoration(),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => appState.toggleTask(task),
                          child: Icon(
                            task.isDone ? Icons.check_circle_rounded : Icons.radio_button_unchecked_rounded,
                            color: task.isDone ? AppColors.success : AppColors.textGrey,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: AppColors.pinkLight,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(child: Text(task.emoji)),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                task.title,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  decoration: task.isDone ? TextDecoration.lineThrough : null,
                                ),
                              ),
                              Text(
                                task.isDone ? '${task.time} · ${t('done_at')}' : task.time,
                                style: const TextStyle(fontSize: 12, color: AppColors.textGrey),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () => _openTaskForm(existing: task),
                          icon: const Icon(Icons.edit_rounded, size: 18, color: AppColors.secondaryTeal),
                          splashRadius: 20,
                        ),
                        IconButton(
                          onPressed: () => _confirmDeleteTask(task),
                          icon: const Icon(Icons.delete_rounded, size: 18, color: AppColors.allergyRed),
                          splashRadius: 20,
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
