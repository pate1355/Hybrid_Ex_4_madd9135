import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  // Define the API endpoint and specify the number of users to fetch
  const url = 'https://random-data-api.com/api/users/random_user?size=10';

  try {
    // Make an asynchronous GET request
    final response = await http.get(Uri.parse(url));

    // Check if the response is successful
    if (response.statusCode == 200) {
      // Decode the JSON data into a List of Maps
      List<dynamic> users = jsonDecode(response.body);

      // Loop through each user in the list and print the details
      for (var user in users) {
        print('${user['uid']} - ${user['first_name']} ${user['last_name']}');
      }
    } else {
      print('Failed to load users. Status code: ${response.statusCode}');
    }
  } catch (e) {
    // Handle any errors that may occur during the request
    print('An error occurred: $e');
  }
}
