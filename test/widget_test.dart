import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:practica2api/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the initial Pokemon ID starts at 0.
    expect(find.text('Pokemon ID: 0'), findsOneWidget);

    // Tap the floating action button to fetch the next Pokemon.
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle(); // Espera a que las animaciones se completen.

    // Verifica que el contador se haya incrementado a 1.
    expect(find.text('Pokemon ID: 0'), findsNothing);
    expect(find.text('Pokemon ID: 1'), findsOneWidget);
  });
}
