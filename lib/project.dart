import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  final String botToken = '6615348419:AAFFoMIu9qFacUf9BRKZXZqZac-9_gCgbng';
  final String chatId = '-1001548036287';
  final String yourName = 'Dong Phyy';

  final String message = 'Hello World, $yourName.';

  final String telegramEndpoint =
      'https://api.telegram.org/bot$botToken/sendMessage';

  Map<String, String> data = {
    'chat_id': chatId,
    'text': message,
  };

  http.post(Uri.parse(telegramEndpoint), body: data).then((response) {
    if (response.statusCode == 200) {
      print('Message sent successfully!');
    } else {
      print('Failed to send message. Status code: ${response.statusCode}');
      print('Response: ${response.body}');
    }
  }).catchError((error) {
    print('Error sending message: $error');
  });
}
