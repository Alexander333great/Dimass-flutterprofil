import 'package:flutter_test/flutter_test.dart';

import 'package:profil_mahasiswa/main.dart';

void main() {
  testWidgets('Halaman profil tampil', (WidgetTester tester) async {
    await tester.pumpWidget(const ProfilMahasiswaApp());

    expect(find.text('Profil Mahasiswa'), findsOneWidget);
    expect(find.text('Dimas Ferdiansyah'), findsOneWidget);
    expect(find.text('Detail'), findsOneWidget);

    await tester.tap(find.text('Detail'));
    await tester.pumpAndSettle();

    expect(find.text('Detail Mahasiswa'), findsOneWidget);
  });
}
