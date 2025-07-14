import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // เพิ่ม import นี้

class BookingPage extends StatefulWidget {
  final String? selectedService;

  const BookingPage({super.key, this.selectedService});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  String? selectedService;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  final List<String> services = [
    'ຕັດຜົມ',
    'ຕັດຜົມຂອງຜູ້ຍິງ',
    'ຕໍ່ເລັບ',
    'ຍ້ອມສີຜົມ',
    'ແຕ່ງໜ້າ',
    'ໂກນໜວດຜູ້ຊາຍ',
    'ສະຫົວ',
    'ລອນຜົມ',
  ];

  @override
  void initState() {
    super.initState();
    selectedService = widget.selectedService;
  }

  Future<void> pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: now.add(const Duration(days: 30)),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  void confirmBooking() {
    if (selectedService == null || selectedDate == null || selectedTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('ກະລຸນາເລືອກບໍລິການ ວັນທີ ແລະ ເວລາ')),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('ຈອງບໍລິການ $selectedService ສຳເລັດແລ້ວ')),
    );

    setState(() {
      selectedService = null;
      selectedDate = null;
      selectedTime = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ຈອງບໍລິການ')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'ເລືອກບໍລິການ',
                border: OutlineInputBorder(),
              ),
              value: selectedService,
              items: services.map((service) {
                return DropdownMenuItem(
                  value: service,
                  child: Text(service),
                );
              }).toList(),
              onChanged: (value) => setState(() => selectedService = value),
            ),
            const SizedBox(height: 20),
            ListTile(
              title: Text(
                selectedDate == null
                    ? 'ເລືອກວັນທີ'
                    : 'ວັນທີ: ${DateFormat('yyyy-MM-dd').format(selectedDate!)}',
              ),
              trailing: const Icon(Icons.calendar_today),
              onTap: pickDate,
            ),
            ListTile(
              title: Text(
                selectedTime == null
                    ? 'ເລືອກເວລາ'
                    : 'ເວລາ: ${selectedTime!.format(context)}',
              ),
              trailing: const Icon(Icons.access_time),
              onTap: pickTime,
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: confirmBooking,
                child: const Text('ຢືນຢັນການຈອງ'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
