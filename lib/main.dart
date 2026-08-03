import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'theme/app_theme.dart';
import 'screens/team_info_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Khởi tạo dữ liệu locale tiếng Việt để table_calendar hiển thị đúng
  // tên tháng/ngày bằng tiếng Việt.
  await initializeDateFormatting('vi_VN', null);
  runApp(const PawCareApp());
}

class PawCareApp extends StatelessWidget {
  const PawCareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PawCare',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const TeamInfoScreen(),
    );
  }
}
