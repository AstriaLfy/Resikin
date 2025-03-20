import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CalendarDialog extends StatelessWidget {
  final Function(DateTime) onDateSelected;
  final DateTime focusedDay;

  const CalendarDialog({
    required this.onDateSelected,
    required this.focusedDay,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.teal,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.56,
              child: TableCalendar(
                firstDay: DateTime.now(),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: focusedDay,
                availableGestures: AvailableGestures.horizontalSwipe,
                pageJumpingEnabled: false,
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  titleTextStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                daysOfWeekHeight: 14,
                daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: TextStyle(fontSize: 10, color: Colors.white),
                  weekendStyle: TextStyle(fontSize: 10, color: Colors.white),
                ),
                calendarStyle: CalendarStyle(
                  defaultTextStyle: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                  weekendTextStyle: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                  outsideDaysVisible: false,
                  disabledTextStyle: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                  todayTextStyle: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  selectedTextStyle: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: Colors.teal,
                    shape: BoxShape.circle,
                  ),
                  rowDecoration: BoxDecoration(),
                  cellMargin: EdgeInsets.symmetric(vertical: 2, horizontal: 0),
                ),
                onFormatChanged: (format) {},
                selectedDayPredicate: (day) => false,
                onDaySelected: (newSelectedDay, focusedDay) {
                  onDateSelected(newSelectedDay);
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
