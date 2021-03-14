// Import the test package and Counter class
import 'package:test/test.dart';
import 'package:intl/intl.dart';

void main() {
  test('Check DateTime specification', () {

    final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');

    var now = DateTime.now();

    final timeStr = formatter.format(now);

    final date = formatter.parse(timeStr);
    final timeStrAgain = formatter.format(date);

    print("timeStr: $timeStr, timeStrAgain: $timeStrAgain");
    expect(timeStr, timeStrAgain);
  });
}
