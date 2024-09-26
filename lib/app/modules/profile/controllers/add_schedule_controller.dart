import 'package:bizne_fonda_app/app/models/profile/schedule.dart';
import 'package:get/get.dart';

class AddScheduleController extends GetxController {
  RxList<Schedule> schedules = <Schedule>[].obs;
  RxList<String> errors = <String>[].obs;
  int count = 0;

  String validator(String value) {
    if (value.isEmpty) return 'requiredField'.tr;

    final values = value.split(':');
    if (values.length != 2) return 'invalidSchedule'.tr;

    final hh = int.tryParse(values[0]);
    final mm = int.tryParse(values[1]);

    if (hh == null || 0 > hh || hh >= 24) return 'invalidHour'.tr;
    if (mm == null || 0 > mm || mm >= 60) return 'invalidMinutes'.tr;

    return '';
  }

  bool validate() {
    for (var i = 0; i < schedules.length; i++) {
      errors[i] = validator(schedules[i].start);
      errors[i] = validator(schedules[i].end);
    }

    return errors.where((e) => e.isEmpty).length == errors.length;
  }

  void addSchedule() {
    schedules.add(Schedule(
        id: ++count,
        day: schedules.isEmpty
            ? DayOfWeeks.monday
            : numberToDayOfWeek(
                (dayOfWeekToNumber(schedules.last.day) + 1) % 7),
        start: schedules.lastOrNull?.start ?? '',
        end: schedules.lastOrNull?.end ?? ''));
    errors.add('');
  }

  void removeSchedule(int index) {
    schedules.removeAt(index);
    errors.removeAt(index);
  }

  void setSchedules(List<Schedule> schedules) {
    this.schedules.clear();

    for (var i in schedules) {
      i.id = ++count;
      this.schedules.add(i);
    }

    errors.value = List.generate(schedules.length, (ind) => '');
  }
}
