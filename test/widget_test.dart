import 'package:flutter_test/flutter_test.dart';
import 'package:healty_app/app/app.dart';

void main() {
  testWidgets('Splash screen renders app identity', (tester) async {
    await tester.pumpWidget(const DigitalHealthSystemApp());

    expect(find.text('منظومة الصحة الرقمية'), findsOneWidget);
    expect(find.text('Digital Health System'), findsOneWidget);
    expect(find.text('وزارة الصحة'), findsOneWidget);
  });

  testWidgets('Splash navigates to onboarding after duration', (tester) async {
    await tester.pumpWidget(const DigitalHealthSystemApp());

    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();

    expect(find.text('رؤية صحية واضحة'), findsOneWidget);
  });
}
