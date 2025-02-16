import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_school/core/routes/app_routes.dart';
import 'package:smart_school/core/services/injection_container.dart';
import 'package:smart_school/src/dashboard/dashboard.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init(); // dependency injection
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoutes.home,
      routes: AppRoutes.routes,
      title: 'Smart School',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
          textTheme: GoogleFonts.montserratTextTheme(
            Theme.of(context).textTheme,
          )
      ),
      home: DashboardScreen(),
    );
  }
}
