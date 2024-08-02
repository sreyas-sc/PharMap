// import 'package:flutter/material.dart';
// import 'package:supabase/supabase.dart';
// import 'package:mcamajor/screens/welcome_screen.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   final SupabaseClient supabase = SupabaseClient(
//     'https://syscfbcpmjoxtverlwqx.supabase.co',
//     'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InN5c2NmYmNwbWpveHR2ZXJsd3F4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTA3ODc1MDYsImV4cCI6MjAyNjM2MzUwNn0.a_FYaQUwGHIGJe5ULkiWGPfH3WfvNm-02z4fkA_Ecgw',
//   );

//   MyApp({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: 'MCAMajor',
//       home: WelcomeScreen(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:mcamajor/screens/welcome_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Supabase
  await Supabase.initialize(
    url: 'https://syscfbcpmjoxtverlwqx.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InN5c2NmYmNwbWpveHR2ZXJsd3F4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTA3ODc1MDYsImV4cCI6MjAyNjM2MzUwNn0.a_FYaQUwGHIGJe5ULkiWGPfH3WfvNm-02z4fkA_Ecgw',
  );

  // Create SupabaseClient instance

  // runApp(MyApp(supabase: supabase));
  runApp(MyApp(
    supabase: supabase,
  ));
}

final SupabaseClient supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  final SupabaseClient supabase;

  const MyApp({super.key, required this.supabase});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MCAMajor',
      home: WelcomeScreen(supabase: supabase),
    );
  }
}
