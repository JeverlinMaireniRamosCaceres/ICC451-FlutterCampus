import 'package:flutter/material.dart';
import 'package:flutter_campus/app.dart';
import 'package:flutter_campus/services/activity_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('carga y marca favorita', (tester) async {
    await tester.pumpWidget(FlutterCampusApp(repo: ActivityRepository()));
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    await tester.pumpAndSettle();
    expect(find.text('Parcial de Dart'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.star_border).first);
    await tester.pump();
    expect(find.byIcon(Icons.star), findsWidgets);
  });
}
