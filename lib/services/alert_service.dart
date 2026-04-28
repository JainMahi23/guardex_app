import 'location_service.dart';
import 'sms_service.dart';

class AlertService {
  static Future<void> triggerSOS() async {
    String link = await LocationService.getLocationLink();

    await SmsService.sendSOS(
      message: "🚨 Emergency! Help me.\nLocation: $link",
    );
  }
}