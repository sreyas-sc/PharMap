// // This is a basic Flutter widget test.
// //
// // To perform an interaction with a widget in your test, use the WidgetTester
// // utility in the flutter_test package. For example, you can send tap and scroll
// // gestures. You can also use WidgetTester to find child widgets in the widget
// // tree, read text, and verify that the values of widget properties are correct.

// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';

// import 'package:mcamajor/main.dart';

// void main() {
//   testWidgets('Counter increments smoke test', (WidgetTester tester) async {
//     // Build our app and trigger a frame.
//     await tester.pumpWidget(MyApp());

//     // Verify that our counter starts at 0.
//     expect(find.text('0'), findsOneWidget);
//     expect(find.text('1'), findsNothing);

//     // Tap the '+' icon and trigger a frame.
//     await tester.tap(find.byIcon(Icons.add));
//     await tester.pump();

//     // Verify that our counter has incremented.
//     expect(find.text('0'), findsNothing);
//     expect(find.text('1'), findsOneWidget);
//   });
// }
// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mcamajor/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() {
  testWidgets('MyApp widget test', (WidgetTester tester) async {
    // Initialize a SupabaseClient instance
    final SupabaseClient supabase = SupabaseClient(
      'https://syscfbcpmjoxtverlwqx.supabase.co',
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InN5c2NmYmNwbWpveHR2ZXJsd3F4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTA3ODc1MDYsImV4cCI6MjAyNjM2MzUwNn0.a_FYaQUwGHIGJe5ULkiWGPfH3WfvNm-02z4fkA_Ecgw',
    );

    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(supabase: supabase));

    // You can add your widget tests here
    // For example, you can find widgets by text or icon and verify their existence
    expect(find.text('Welcome'), findsOneWidget);
    expect(find.byIcon(Icons.add),
        findsNothing); // Assuming the WelcomeScreen doesn't contain an icon with the 'add' icon
  });
}
