class SmsService {
  /// Safe SOS method (works on web + mobile)
  static Future<void> sendSOS(String message, String locationLink) async {
    String fullMessage = "$message\nLocation: $locationLink";

    // For now: simulate sending SMS
    // On web this will print in console
    // On Android later you can integrate real SMS API
    print("🚨 SOS SENT:");
    print(fullMessage);
  }
}