import 'package:http/http.dart' as http;

Future<String> connect (String text) async{
  var resBody = await http
      .get(Uri.parse("http://10.0.2.2:8000/api/notes"))
      .then((response) {
    return response.body;
  });
  return resBody;
}