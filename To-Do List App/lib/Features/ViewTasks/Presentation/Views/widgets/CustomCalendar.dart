import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_list_app/Core/Utils/Styles.dart';
import 'package:todo_list_app/constants.dart';

class CustomCalendar extends StatefulWidget {
  const CustomCalendar({super.key, required this.onDaySelected});

  final void Function(DateTime dateTime) onDaySelected;

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  late DateTime _focusedDay;
  DateTime? _selectedDay;

  Map<int, String> weekdays = {1: 'M', 2: 'T', 3: 'W', 4: 'T', 5: 'F', 6: 'S', 7: 'S'};

  @override
  void initState() {
    _focusedDay = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      focusedDay: _focusedDay,
      firstDay: DateTime(2000, 1, 1),
      lastDay: DateTime(9999, 12, 31),
      calendarFormat: CalendarFormat.week,
      startingDayOfWeek: StartingDayOfWeek.monday,
      headerStyle: HeaderStyle(
        headerPadding: const EdgeInsets.only(left: kPadding, bottom: 10),
        rightChevronIcon: TextButton(
          style: ButtonStyle(padding: WidgetStateProperty.all(EdgeInsets.zero)),
          onPressed: () {
            _focusedDay = DateTime.now();
            widget.onDaySelected.call(DateTime.now());
            setState(() {});
          },
          child: const Text('Today', style: Styles.blue18Bold),
        ),
        titleTextStyle: Styles.black20Bold.copyWith(fontSize: 18),
        formatButtonVisible: false,
        leftChevronVisible: false,
      ),
      calendarBuilders: CalendarBuilders(
        dowBuilder: (context, day) {
          return Container(
            alignment: Alignment.center,
            child: Text(weekdays[day.weekday]!, style: Styles.calenderStyle.copyWith(fontFamily: 'Lato')),
          );
        },
        selectedBuilder: (context, day, focusedDay) {
          if (isSameDay(focusedDay, _focusedDay)) {
            return Center(
              child: CircleAvatar(
                radius: 20,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kRaduis),
                        gradient: const LinearGradient(colors: [Color(0xff5c919d), Color(0xff4361b7)]),
                      ),
                    ),
                    Center(child: Text(day.day.toString(), style: Styles.calenderStyle.copyWith(color: Colors.white, fontWeight: FontWeight.bold))),
                  ],
                ),
              ),
            );
          } else {
            return Container(
              alignment: Alignment.center,
              child: Text(day.day.toString(), style: Styles.calenderStyle.copyWith(fontFamily: 'Lato')),
            );
          }
        },
      ),
      calendarStyle: CalendarStyle(
        weekendTextStyle: Styles.calenderStyle,
        defaultTextStyle: Styles.calenderStyle,
        tablePadding: const EdgeInsets.symmetric(horizontal: kPadding),
      ),
      selectedDayPredicate: (day) {
        return isSameDay(_focusedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        if (!isSameDay(_selectedDay, selectedDay)) {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay;
          widget.onDaySelected.call(_selectedDay!);
          setState(() {});
        }
      },
    );
  }
}
