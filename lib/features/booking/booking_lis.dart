// lib/features/booking/booking_list.dart
import 'package:flutter/material.dart';
import 'booking_detail.dart';  // import ให้ถูกต้องตามโครงสร้างโปรเจกต์

class BookingList extends StatelessWidget {
  const BookingList({super.key});

  @override
  Widget build(BuildContext context) {
    // จำลองข้อมูลการจอง (ในโปรเจกต์จริงให้ดึงจาก backend หรือ database)
    final List<Map<String, String>> bookings = [
      {'service': 'ຕັດຜົມ', 'date': '2025-07-20', 'time': '10:00'},
      {'service': 'ທໍ່ເລັບ', 'date': '2025-07-21', 'time': '13:30'},
      {'service': 'ນວດ', 'date': '2025-07-22', 'time': '15:00'},
    ];

    return ListView.builder(
      itemCount: bookings.length,
      itemBuilder: (context, index) {
        final booking = bookings[index];
        return ListTile(
          title: Text(booking['service'] ?? ''),
          subtitle: Text('ວັນທີ ${booking['date']} ເວລາ ${booking['time']}'),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            // ใช้ context จริง แทน _
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookingDetailPage(booking: booking),
              ),
            );
          },
        );
      },
    );
  }
}
