
String serviceFormatTimestamp(int timestamp) {
  var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  String monthName;
  String minuteName;
  String hourName;

  switch (date.minute) {
    case 0: minuteName = '00';
    break;
    case 1: minuteName = '01';
    break;
    default: minuteName = '${date.minute}';
  }

  switch (date.hour) {
    case 0: hourName = '00';
    break;
    case 1: hourName = '01';
    break;
    default: hourName = '${date.hour}';
  }

  switch (date.month) {
    case 1:
      monthName = 'Января';
      break;
    case 2:
      monthName = 'Февраля';
      break;
    case 3:
      monthName = 'Марта';
      break;
    case 4:
      monthName = 'Апреля';
      break;
    case 5:
      monthName = 'Мая';
      break;
    case 6:
      monthName = 'Июня';
      break;
    case 7:
      monthName = 'Июля';
      break;
    case 8:
      monthName = 'Августа';
      break;
    case 9:
      monthName = 'Сентября';
      break;
    case 10:
      monthName = 'Октября';
      break;
    case 11:
      monthName = 'Ноября';
      break;
    case 12:
      monthName = 'Декабря';
      break;
    default:
      monthName = '${date.month}'; // На случай непредвиденных значений
  }

  return '${date.day} $monthName ${date.year}г. $hourName:$minuteName';
}