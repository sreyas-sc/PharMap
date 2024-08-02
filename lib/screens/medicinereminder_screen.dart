import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class MedicineReminderPage extends StatefulWidget {
  const MedicineReminderPage({super.key});

  @override
  State<MedicineReminderPage> createState() => _MedicineReminderPageState();
}

class _MedicineReminderPageState extends State<MedicineReminderPage> {
  final TextEditingController medicineNameController = TextEditingController();
  final TextEditingController dosageController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    // Initialize notification plugin
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    var initializationSettingsAndroid =
        const AndroidInitializationSettings('ic_notification');
    // var initializationSettingsIOS = IOSInitializationSettings();
    var initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      child: Scaffold(
        // appBar: AppBar(
        //   title: const Text('Medicine Reminder'),
        // ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: medicineNameController,
                  decoration: InputDecoration(
                    labelText: 'Medicine Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: dosageController,
                  decoration: InputDecoration(
                    labelText: 'Dosage',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: timeController,
                  decoration: InputDecoration(
                    labelText: 'Time (HH:MM format)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onTap: () async {
                    final TimeOfDay? selectedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                      initialEntryMode: TimePickerEntryMode.dial,
                    );
                    if (selectedTime != null) {
                      timeController.text = selectedTime.format(context);
                    }
                  },
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    scheduleNotification(
                        medicineNameController.text, timeController.text);
                    // Clear text fields after scheduling
                    medicineNameController.clear();
                    dosageController.clear();
                    timeController.clear();
                  },
                  child: const Text('Set Reminder'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void scheduleNotification(String medicineName, String time) async {
    try {
      final timeSplit = time.split(':');
      final hour = int.parse(timeSplit[0]);
      final minute = int.parse(timeSplit[1]);

      // Use UTC time zone for scheduling (recommended)
      final now = tz.TZDateTime.now(tz.local);
      final scheduledTime = now.add(Duration(hours: hour, minutes: minute));

      const androidNotificationDetails = AndroidNotificationDetails(
        'channel_id',
        'Medicine Reminder',
        channelDescription: 'Reminder to take your medicine',
        importance: Importance.high,
        priority: Priority.high,
        playSound: true,
      );

      const notificationDetails =
          NotificationDetails(android: androidNotificationDetails);

      await flutterLocalNotificationsPlugin.zonedSchedule(
        0, // Notification ID
        'It\'s time to take your $medicineName!',
        'Don\'t forget to take your medication!',
        scheduledTime
            .toLocal(), // Convert to user's local time zone for display
        notificationDetails,
        payload: medicineName, // Optional data attached to the notification
        // ignore: deprecated_member_use
        androidAllowWhileIdle: true, // Ensure delivery even in doze mode
        // Add the required argument
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation
                .absoluteTime, // Interpret as absolute time
      );
    } catch (error) {
      // Handle potential errors during notification scheduling
      print('Error scheduling notification: $error');
    }
  }
}
