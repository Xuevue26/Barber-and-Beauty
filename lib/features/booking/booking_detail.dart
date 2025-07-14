// lib/features/booking/booking_detail.dart
import 'package:flutter/material.dart';

class BookingDetailPage extends StatelessWidget {
  final Map<String, String> booking;

  const BookingDetailPage({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    final service = booking['service'] ?? '—';
    final date = booking['date'] ?? '—';
    final time = booking['time'] ?? '—';

    return Scaffold(
      appBar: AppBar(
        title: const Text('ລາຍລະອຽດການຈອງ'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.design_services, color: Colors.deepOrange),
                    const SizedBox(width: 10),
                    Text(
                      'ບໍລິການ: $service',
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Icon(Icons.calendar_today, color: Colors.deepOrange),
                    const SizedBox(width: 10),
                    Text(
                      'ວັນທີ: $date',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Icon(Icons.access_time, color: Colors.deepOrange),
                    const SizedBox(width: 10),
                    Text(
                      'ເວລາ: $time',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
