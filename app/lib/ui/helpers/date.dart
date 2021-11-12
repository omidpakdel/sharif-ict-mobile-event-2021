import 'package:shamsi_date/shamsi_date.dart';

class FarsiDate {
  final List<String> monthNames = [
    '',
    'فروردین',
    'اردیبهشت',
    'خرداد',
    'تیر',
    'مرداد',
    'شهریور',
    'مهر',
    'آبان',
    'آذر',
    'دی',
    'بهمن',
    'اسفند',
  ];

  final List<String> dayNames = [
    '',
    'شنبه',
    'یک شنبه',
    'دوشنبه',
    'سه شنبه',
    'چهارشنبه',
    'پنج شنبه',
    'جمعه',
  ];

  String toPersianDateStr(DateTime dateTime, {String format = 'yyyy/MM/dd'}) {
    try {
      var j = Gregorian.fromDateTime(dateTime).toJalali();
      //
      format = format.replaceAll("yyyy", j.year.toString());
      format = format.replaceAll("yy", j.year.toString().substring(2));
      format = format.replaceAll("MMM", monthNames[j.month]);
      format = format.replaceAll("MM", j.month.toString().padLeft(2, "0"));
      format = format.replaceAll("ddd", dayNames[j.weekDay]);
      format = format.replaceAll("dd", j.day.toString().padLeft(2, "0"));
      format =
          format.replaceAll("HH", dateTime.hour.toString().padLeft(2, "0"));
      format =
          format.replaceAll("mm", dateTime.minute.toString().padLeft(2, "0"));
      format =
          format.replaceAll("ss", dateTime.second.toString().padLeft(2, "0"));

      return format;
    } catch (e) {
      return "";
    }
  }

  getDate() {
    return toPersianDateStr(DateTime.now(), format: 'ddd dd MMM yyyy');
  }

  getTime() {
    return toPersianDateStr(DateTime.now(), format: 'HH:mm');
  }
}
