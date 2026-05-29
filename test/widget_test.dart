import 'package:flutter_test/flutter_test.dart';

import 'package:elvobrand/app.dart';

void main() {
  testWidgets('Aplikasi Elvo dapat di-render', (WidgetTester tester) async {
    await tester.pumpWidget(const AplikasiElvo());

    expect(find.text('ELVO'), findsOneWidget);
    expect(find.text('MASUK'), findsOneWidget);
  });
}
