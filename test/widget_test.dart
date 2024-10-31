import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:spotify_clone/main.dart'; // แก้ไขให้ตรงกับ path ของ main.dart

void main() {
  testWidgets('HomeScreen has a title and search bar', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // ตรวจสอบว่ามีข้อความ "Spotify Clone" แสดงอยู่
    expect(find.text('Spotify Clone'), findsOneWidget);

    // ตรวจสอบว่ามี TextField สำหรับค้นหา
    expect(find.byType(TextField), findsOneWidget);
  });
}
