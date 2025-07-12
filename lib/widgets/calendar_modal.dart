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
      height: MediaQuery.of(context).size.height * 0.7,
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
          // Title
          Text(
            'Select Date',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          // Calendar
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TableCalendar(
                firstDay: widget.firstDay ?? DateTime.utc(2025, 1, 1),
                lastDay: DateTime.now(),
                focusedDay: _focusedDate,
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDate, day);
                },
                enabledDayPredicate: (day) {
                  // Only enable dates that are today or in the past
                  return day.isBefore(
                    DateTime.now().add(const Duration(days: 1)),
                  );
                },
                onDaySelected: (selectedDay, focusedDay) {
                  // Only allow selection if the day is today or in the past
                  if (selectedDay.isBefore(
                    DateTime.now().add(const Duration(days: 1)),
                  )) {
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
                  leftChevronIcon: Icon(
                    Icons.chevron_left,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  rightChevronIcon: Icon(
                    Icons.chevron_right,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ),
          ),
          // Close button
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Close'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
