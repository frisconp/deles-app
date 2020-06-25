library rupiah;

import 'package:intl/intl.dart';

String rupiah(double value) {
  return NumberFormat.simpleCurrency(locale: 'id').format(value);
}
