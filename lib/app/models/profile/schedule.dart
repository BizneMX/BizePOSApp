import 'package:get/get.dart';

class Schedule {
  int id;
  DayOfWeeks day;
  String start;
  String end;

  Schedule(
      {this.id = 0, required this.day, required this.start, required this.end});

  Map<String, dynamic> toJson() =>
      {'date': dayOfWeekToStrValue(day), 'start': start, 'end': end};

  static Schedule fromJson(Map<String, dynamic> json) => Schedule(
      day: valueStrDayOfWeekTo(json['date']),
      start: json['start'],
      end: json['end']);
}

enum DayOfWeeks {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday
}

String dayOfWeekToStr(DayOfWeeks day) {
  switch (day) {
    case DayOfWeeks.monday:
      return 'monday'.tr;
    case DayOfWeeks.tuesday:
      return 'tuesday'.tr;
    case DayOfWeeks.wednesday:
      return 'wednesday'.tr;
    case DayOfWeeks.thursday:
      return 'thursday'.tr;
    case DayOfWeeks.friday:
      return 'friday'.tr;
    case DayOfWeeks.saturday:
      return 'saturday'.tr;
    case DayOfWeeks.sunday:
      return 'sunday'.tr;
  }
}

String dayOfWeekToStrValue(DayOfWeeks day) {
  switch (day) {
    case DayOfWeeks.monday:
      return 'Lunes';
    case DayOfWeeks.tuesday:
      return 'Martes';
    case DayOfWeeks.wednesday:
      return 'Miércoles';
    case DayOfWeeks.thursday:
      return 'Jueves';
    case DayOfWeeks.friday:
      return 'Viernes';
    case DayOfWeeks.saturday:
      return 'Sábado';
    case DayOfWeeks.sunday:
      return 'Domingo';
  }
}

DayOfWeeks valueStrDayOfWeekTo(String value) {
  switch (value) {
    case 'Lunes':
      return DayOfWeeks.monday;
    case 'Martes':
      return DayOfWeeks.tuesday;
    case 'Miércoles':
      return DayOfWeeks.wednesday;
    case 'Jueves':
      return DayOfWeeks.thursday;
    case 'Viernes':
      return DayOfWeeks.friday;
    case 'Sábado':
      return DayOfWeeks.saturday;
    case 'Domingo':
      return DayOfWeeks.sunday;
    default:
      return DayOfWeeks.monday;
  }
}

DayOfWeeks valueStrDayOfWeekTo1(String value) {
  switch (value) {
    case 'Lu':
      return DayOfWeeks.monday;
    case 'Ma':
      return DayOfWeeks.tuesday;
    case 'Mi':
      return DayOfWeeks.wednesday;
    case 'Ju':
      return DayOfWeeks.thursday;
    case 'Vi':
      return DayOfWeeks.friday;
    case 'Sá':
      return DayOfWeeks.saturday;
    case 'Do':
      return DayOfWeeks.sunday;
    default:
      return DayOfWeeks.monday;
  }
}

int dayOfWeekToNumber(DayOfWeeks day) {
  switch (day) {
    case DayOfWeeks.monday:
      return 0;
    case DayOfWeeks.tuesday:
      return 1;
    case DayOfWeeks.wednesday:
      return 2;
    case DayOfWeeks.thursday:
      return 3;
    case DayOfWeeks.friday:
      return 4;
    case DayOfWeeks.saturday:
      return 5;
    case DayOfWeeks.sunday:
      return 6;
  }
}

DayOfWeeks numberToDayOfWeek(int value) {
  switch (value) {
    case 0:
      return DayOfWeeks.monday;
    case 1:
      return DayOfWeeks.tuesday;
    case 2:
      return DayOfWeeks.wednesday;
    case 3:
      return DayOfWeeks.thursday;
    case 4:
      return DayOfWeeks.friday;
    case 5:
      return DayOfWeeks.saturday;
    case 6:
      return DayOfWeeks.sunday;
    default:
      return DayOfWeeks.monday;
  }
}
