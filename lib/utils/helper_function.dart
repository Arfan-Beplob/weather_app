import 'package:intl/intl.dart';

String getFormatDateTime( num dt ,{String pattern = 'MMM dd yyy'})=>
 DateFormat(pattern).format(DateTime.fromMillisecondsSinceEpoch(dt.toInt()*1000));