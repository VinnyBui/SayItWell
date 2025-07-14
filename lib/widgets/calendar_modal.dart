import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarModal extends StatefulWidget {
  final DateTime initialDate;
  final Function(DateTime) onDateSelected;
  final DateTime? firstDay;

  const CalendarModal({
    super.key,
    required this.initialDate,
    required this.onDateSelected,
    this.firstDay,
  });

  @override
  State<CalendarModal> createState() => _CalendarModalState();
}

class _CalendarModalState extends State<CalendarModal> {
  late DateTime _selectedDate;
  late DateTime _focusedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
    _focusedDate = widget.initialDate;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          // Handle bar
          Container(
            margin: const EdgeInsets.only(top: 12, bottom: 20),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          // Calendar
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TableCalendar(
                firstDay: DateTime(
                  DateTime.now().year,
                  DateTime.now().month,
                  1,
                ),
                lastDay: DateTime.now(),
                focusedDay: _focusedDate,
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDate, day);
                },
                enabledDayPredicate: (day) {
                  final now = DateTime.now();
                  final firstDayOfMonth = DateTime(now.year, now.month, 1);

                  // Only enable dates that are:
                  // 1. In the current month
                  // 2. From the start of the month to today
                  return day.isAfter(
                        firstDayOfMonth.subtract(const Duration(days: 1)),
                      ) &&
                      day.isBefore(now.add(const Duration(days: 1))) &&
                      day.month == now.month &&
                      day.year == now.year;
                },
                onDaySelected: (selectedDay, focusedDay) {
                  final now = DateTime.now();
                  // Only allow selection if the day is in current month and today or in the past
                  if (selectedDay.month == now.month &&
                      selectedDay.year == now.year &&
                      selectedDay.isBefore(now.add(const Duration(days: 1)))) {
                    setState(() {
                      _selectedDate = selectedDay;
                      _focusedDate = focusedDay;
                    });
                    // Call the callback with the selected date
                    widget.onDateSelected(selectedDay);
                    Navigator.pop(context);
                  }
                },
                onPageChanged: (focusedDay) {
                  setState(() {
                    _focusedDate = focusedDay;
                  });
                },
                calendarStyle: CalendarStyle(
                  outsideDaysVisible: false,
                  holidayTextStyle: TextStyle(
                    color: Colors.grey[300],
                    decoration: TextDecoration.lineThrough,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                  todayDecoration: BoxDecoration(
                    color: Theme.of(
                      context,
                    ).colorScheme.primary.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                  disabledDecoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  disabledTextStyle: TextStyle(
                    color: Colors.grey[300],
                    decoration: TextDecoration.lineThrough,
                  ),
                  markersMaxCount: 1,
                  markerDecoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    shape: BoxShape.circle,
                  ),
                ),
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  leftChevronVisible: false,
                  rightChevronVisible: false,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
