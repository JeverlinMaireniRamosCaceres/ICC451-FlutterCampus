import 'package:flutter_campus/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('muestra el estado vacío', (tester) async {
    await tester.pumpWidget(const FlutterCampusApp());
    expect(find.text('Aún no hay actividades'), findsOneWidget);
  });
}