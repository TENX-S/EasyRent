import 'package:url_launcher/url_launcher.dart';

makePhoneCall(String number) {
  launch('tel:' + ['+86',
    number.substring(0, 3),
    number.substring(3, 7),
    number.substring(7, 11),
  ].join(" "));
}

makeSMSMessage(String number) {
  launch('sms:' + ['+86',
    number.substring(0, 3),
    number.substring(3, 7),
    number.substring(7, 11),
  ].join(" "));
}
