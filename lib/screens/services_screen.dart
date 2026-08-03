import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../models/clinic.dart';
import '../models/pet.dart';
import '../models/appointment.dart';
import '../state/app_state.dart';
import '../l10n/app_strings.dart';
import '../widgets/language_badge.dart';
import '../widgets/app_bottom_sheet.dart';

/// Màn hình "Dịch vụ" (thay thế Cộng đồng cũ):
/// 1. Xem & tìm kiếm phòng khám.
/// 2. Đặt lịch khám.
/// 3. Chỉnh sửa lịch khám.
/// 4. Hủy lịch khám.
/// 5. Gọi SOS khẩn cấp.
class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  int _filterIndex = 0;
  String _query = '';

  List<Clinic> get _visibleClinics {
    var list = sampleClinics
        .where((c) => c.name.toLowerCase().contains(_query.toLowerCase()))
        .toList();
    switch (_filterIndex) {
      case 1:
        list.sort((a, b) => b.rating.compareTo(a.rating));
        break;
      case 2:
        list = list.where((c) => c.open24h).toList();
        break;
      default:
        list.sort((a, b) => a.distanceKm.compareTo(b.distanceKm));
    }
    return list;
  }

  // ------------------------------------------------------------------
  // SOS khẩn cấp
  // ------------------------------------------------------------------
  void _showSosDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(t('sos_title')),
        content: Text(t('sos_confirm')),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(t('cancel'), style: const TextStyle(color: AppColors.textGrey)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.allergyRed),
            onPressed: () {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(t('sos_connecting'))),
              );
            },
            child: Text(t('sos_call_now')),
          ),
        ],
      ),
    );
  }

  // ------------------------------------------------------------------
  // Đặt lịch khám / Chỉnh sửa lịch khám (dùng chung 1 form)
  // ------------------------------------------------------------------
  Future<void> _openAppointmentForm({required String clinicName, Appointment? existing}) async {
    final pets = appState.pets;
    if (pets.isEmpty) return;

    Pet selectedPet = existing != null
        ? pets.firstWhere((p) => p.name == existing.petName, orElse: () => pets.first)
        : pets.first;
    DateTime? selectedDate = existing?.date;
    TimeOfDay? selectedTime;
    if (existing != null) {
      final parts = existing.timeLabel.split(':');
      if (parts.length == 2) {
        selectedTime = TimeOfDay(
          hour: int.tryParse(parts[0]) ?? 9,
          minute: int.tryParse(parts[1].split(' ').first) ?? 0,
        );
      }
    }
    final noteController = TextEditingController(text: existing?.note ?? '');
    String? errorText;

    await showAppBottomSheet(
      context: context,
      title: existing == null ? t('book_appointment_title') : t('edit_appointment_title'),
      child: StatefulBuilder(
        builder: (context, setSheetState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(t('choose_pet'), style: const TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: pets.map((pet) {
                  final selected = pet.id == selectedPet.id;
                  return GestureDetector(
                    onTap: () => setSheetState(() => selectedPet = pet),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                      decoration: BoxDecoration(
                        color: selected ? AppColors.primaryOrangeDark : Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: selected ? AppColors.primaryOrangeDark : Colors.black12,
                        ),
                      ),
                      child: Text(
                        '${pet.emoji} ${pet.name}',
                        style: TextStyle(
                          color: selected ? Colors.white : AppColors.textDark,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
              Text(t('choose_date'), style: const TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () async {
                  final result = await showDatePicker(
                    context: context,
                    initialDate: selectedDate ?? DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 90)),
                  );
                  if (result != null) setSheetState(() => selectedDate = result);
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
                      const Icon(Icons.calendar_today_rounded, color: AppColors.textGrey, size: 18),
                      const SizedBox(width: 8),
                      Text(selectedDate == null
                          ? t('choose_date')
                          : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(t('choose_time'), style: const TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () async {
                  final result = await showTimePicker(
                    context: context,
                    initialTime: selectedTime ?? const TimeOfDay(hour: 15, minute: 0),
                  );
                  if (result != null) setSheetState(() => selectedTime = result);
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
                      Text(selectedTime == null ? t('choose_time') : selectedTime!.format(context)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(t('note_label'), style: const TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              TextField(
                controller: noteController,
                maxLines: 2,
                decoration: InputDecoration(hintText: t('note_hint')),
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
                    if (selectedDate == null) {
                      setSheetState(() => errorText = t('select_date_error'));
                      return;
                    }
                    if (selectedTime == null) {
                      setSheetState(() => errorText = t('select_time_error'));
                      return;
                    }
                    final timeLabel = selectedTime!.format(context);
                    if (existing == null) {
                      appState.addAppointment(Appointment(
                        clinicName: clinicName,
                        petName: selectedPet.name,
                        date: selectedDate!,
                        timeLabel: timeLabel,
                        note: noteController.text.trim(),
                      ));
                      ScaffoldMessenger.of(this.context).showSnackBar(
                        SnackBar(content: Text(t('booked_snack').replaceFirst('{clinic}', clinicName))),
                      );
                    } else {
                      existing.petName = selectedPet.name;
                      existing.date = selectedDate!;
                      existing.timeLabel = timeLabel;
                      existing.note = noteController.text.trim();
                      appState.notifyAppointmentsChanged();
                      ScaffoldMessenger.of(this.context).showSnackBar(
                        SnackBar(
                            content: Text(
                                t('appointment_updated_snack').replaceFirst('{clinic}', clinicName))),
                      );
                    }
                    Navigator.of(context).pop();
                  },
                  child: Text(existing == null ? t('book') : t('update_appointment_button')),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _confirmCancelAppointment(Appointment appointment) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(t('cancel_appointment_title')),
        content: Text(
            t('cancel_appointment_confirm').replaceFirst('{clinic}', appointment.clinicName)),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(t('keep_appointment'), style: const TextStyle(color: AppColors.textGrey)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.allergyRed),
            onPressed: () {
              Navigator.of(context).pop();
              appState.removeAppointment(appointment);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text(t('appointment_cancelled_snack')
                        .replaceFirst('{clinic}', appointment.clinicName))),
              );
            },
            child: Text(t('cancel_appointment_title')),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final filters = [t('filter_near'), t('filter_rating'), t('filter_24_7')];

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
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            t('services_title'),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            t('services_subtitle'),
                            style: const TextStyle(color: Colors.white70, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    const LanguageBadge(background: Colors.white24, textColor: Colors.white),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(t('find_clinic_near'),
                          style: const TextStyle(color: AppColors.textGrey, fontSize: 13)),
                      const SizedBox(height: 12),
                      TextField(
                        onChanged: (value) => setState(() => _query = value),
                        decoration: InputDecoration(
                          hintText: t('search_clinic_hint'),
                          prefixIcon: const Icon(Icons.search_rounded, color: AppColors.textGrey),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Ô cấp cứu khẩn cấp
                      GestureDetector(
                        onTap: _showSosDialog,
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.allergyRedBg,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 44,
                                height: 44,
                                decoration: BoxDecoration(
                                  color: AppColors.allergyRed,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Center(
                                  child: Text('SOS',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(t('sos_title'), style: const TextStyle(fontWeight: FontWeight.bold)),
                                    const SizedBox(height: 2),
                                    Text(t('sos_subtitle'),
                                        style: const TextStyle(fontSize: 12, color: AppColors.textGrey)),
                                  ],
                                ),
                              ),
                              const Icon(Icons.chevron_right_rounded, color: AppColors.allergyRed),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 36,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: filters.length,
                          separatorBuilder: (_, __) => const SizedBox(width: 8),
                          itemBuilder: (context, index) {
                            final selected = index == _filterIndex;
                            return GestureDetector(
                              onTap: () => setState(() => _filterIndex = index),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                                decoration: BoxDecoration(
                                  color: selected ? AppColors.tealLight : const Color(0xFFF3EFEA),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  filters[index],
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: selected ? AppColors.secondaryTeal : AppColors.textGrey,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 18),
                      Text(t('clinics_nearby'), style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 12),
                      if (_visibleClinics.isEmpty)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Center(
                            child: Text(t('no_clinics'), style: const TextStyle(color: AppColors.textGrey)),
                          ),
                        ),
                      ..._visibleClinics.map((clinic) => Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            padding: const EdgeInsets.all(12),
                            decoration: AppTheme.cardDecoration(),
                            child: Row(
                              children: [
                                Container(
                                  width: 48,
                                  height: 48,
                                  decoration: BoxDecoration(
                                    color: AppColors.tealLight,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Icon(Icons.local_hospital_rounded,
                                      color: AppColors.secondaryTeal),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Flexible(
                                            child: Text(clinic.name,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(fontWeight: FontWeight.w600)),
                                          ),
                                          if (clinic.open24h) ...[
                                            const SizedBox(width: 6),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                              decoration: BoxDecoration(
                                                color: AppColors.allergyRedBg,
                                                borderRadius: BorderRadius.circular(6),
                                              ),
                                              child: const Text('24/7',
                                                  style: TextStyle(
                                                      fontSize: 9,
                                                      fontWeight: FontWeight.bold,
                                                      color: AppColors.allergyRed)),
                                            ),
                                          ],
                                        ],
                                      ),
                                      const SizedBox(height: 4),
                                      Row(
                                        children: [
                                          const Icon(Icons.star_rounded, size: 14, color: Colors.amber),
                                          const SizedBox(width: 2),
                                          Text('${clinic.rating} · ${clinic.distanceLabel}',
                                              style: const TextStyle(
                                                  fontSize: 12, color: AppColors.textGrey)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () => _openAppointmentForm(clinicName: clinic.name),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.tealLight,
                                    foregroundColor: AppColors.secondaryTeal,
                                    elevation: 0,
                                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                                    textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                                  ),
                                  child: Text(t('book')),
                                ),
                              ],
                            ),
                          )),
                      const SizedBox(height: 24),
                      Text(t('your_appointments'), style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 12),
                      if (appState.appointments.isEmpty)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Center(
                            child: Text(t('no_appointments'),
                                style: const TextStyle(color: AppColors.textGrey)),
                          ),
                        )
                      else
                        ...appState.appointments.map((appt) => Container(
                              margin: const EdgeInsets.only(bottom: 12),
                              padding: const EdgeInsets.all(14),
                              decoration: AppTheme.cardDecoration(),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(appt.clinicName,
                                            style: const TextStyle(fontWeight: FontWeight.bold)),
                                      ),
                                      Text('${appt.dateLabel} · ${appt.timeLabel}',
                                          style: const TextStyle(
                                              fontSize: 12, color: AppColors.textGrey)),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Text('🐾 ${appt.petName}',
                                      style: const TextStyle(fontSize: 12, color: AppColors.textGrey)),
                                  if (appt.note.trim().isNotEmpty) ...[
                                    const SizedBox(height: 4),
                                    Text(appt.note, style: const TextStyle(fontSize: 12)),
                                  ],
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: OutlinedButton(
                                          onPressed: () => _openAppointmentForm(
                                              clinicName: appt.clinicName, existing: appt),
                                          style: OutlinedButton.styleFrom(
                                            foregroundColor: AppColors.secondaryTeal,
                                            side: const BorderSide(color: AppColors.secondaryTeal),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(12)),
                                            padding: const EdgeInsets.symmetric(vertical: 10),
                                          ),
                                          child: Text(t('edit'), style: const TextStyle(fontSize: 12)),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: OutlinedButton(
                                          onPressed: () => _confirmCancelAppointment(appt),
                                          style: OutlinedButton.styleFrom(
                                            foregroundColor: AppColors.allergyRed,
                                            side: const BorderSide(color: AppColors.allergyRed),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(12)),
                                            padding: const EdgeInsets.symmetric(vertical: 10),
                                          ),
                                          child: Text(t('cancel_appointment_title'),
                                              style: const TextStyle(fontSize: 12)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )),
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
