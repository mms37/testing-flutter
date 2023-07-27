// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:untitled32/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Test App Test', (WidgetTester tester) async {
    // Uygulama başlatılır
    await tester.pumpWidget(TestApp());

    // Başlangıçta ilk soru ve seçenekler görünmeli
    expect(find.text('Soru 1 / 3'), findsOneWidget);
    expect(find.text('Flutter nedir?'), findsOneWidget);
    expect(find.text('Bir programlama dili'), findsOneWidget);
    expect(find.text('Bir mobil oyun motoru'), findsOneWidget);
    expect(find.text('Bir UI toolkit'), findsOneWidget);
    expect(find.text('Bir grafik tasarım aracı'), findsOneWidget);

    // Başlangıçta doğru cevap sayısı 0 olmalı
    expect(find.text('Doğru Cevaplar: 0 / 3'), findsOneWidget);

    // Test başlar ve soruya tıklanır
    await tester.tap(find.text('Bir UI toolkit'));
    await tester.pump();

    // Doğru cevap seçildiğinden, doğru seçeneğin yeşil olduğunu ve bir sonraki sorunun gösterildiğini kontrol edin
    expect(find.text('Bir UI toolkit'), findsOneWidget);
    expect(find.text('Soru 2 / 3'), findsOneWidget);
    expect(find.text('Doğru Cevaplar: 1 / 3'), findsOneWidget);

    // Test devam eder ve yanlış bir seçenek seçilir
    await tester.tap(find.text('Bir programlama dili'));
    await tester.pump();

    // Yanlış cevap seçildiğinden, seçilen yanlış seçeneğin kırmızı olduğunu ve bir sonraki sorunun gösterildiğini kontrol edin
    expect(find.text('Bir programlama dili'), findsOneWidget);
    expect(find.text('Soru 3 / 3'), findsOneWidget);
    expect(find.text('Doğru Cevaplar: 1 / 3'), findsOneWidget);

    // Test tamamlanır ve test sonucu gösterilir
    await tester.tap(find.text('Bir UI toolkit'));
    await tester.pump();

    expect(find.text('Test Tamamlandı!'), findsOneWidget);
    expect(find.text('Doğru Cevaplar: 2 / 3'), findsOneWidget);

    // Testi yeniden başlat butonuna tıklayarak testi yeniden başlatır
    await tester.tap(find.text('Testi Yeniden Başlat'));
    await tester.pump();

    // Başlangıç durumuna geri döndüğünü kontrol edin
    expect(find.text('Soru 1 / 3'), findsOneWidget);
    expect(find.text('Flutter nedir?'), findsOneWidget);
    expect(find.text('Bir programlama dili'), findsOneWidget);
    expect(find.text('Bir mobil oyun motoru'), findsOneWidget);
    expect(find.text('Bir UI toolkit'), findsOneWidget);
    expect(find.text('Bir grafik tasarım aracı'), findsOneWidget);
    expect(find.text('Doğru Cevaplar: 0 / 3'), findsOneWidget);
  });
}
