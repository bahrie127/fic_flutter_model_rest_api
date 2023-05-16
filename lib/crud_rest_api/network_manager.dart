import 'dart:convert';
import 'package:http/http.dart' as http;
import 'album.dart';

class NetworkManager {
  Future<Album> fetchAlbum() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

    if (response.statusCode == 200) {
      return Album.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<List<Album>> fetchAllAlbum() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));

    if (response.statusCode == 200) {
      List<Album> listData = List<Album>.from(
          json.decode(response.body).map((x) => Album.fromJson(x)));
      return listData;
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<Album> createAlbum(String title) async {
    final response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/albums'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': title,
      }),
    );

    if (response.statusCode == 201) {
      return Album.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create album.');
    }
  }

  Future<Album> updateAlbum(int id, String title) async {
    final response = await http.put(
      Uri.parse('https://jsonplaceholder.typicode.com/albums/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': title,
      }),
    );

    if (response.statusCode == 200) {
      return Album.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update album.');
    }
  }

  Future<Album> deleteAlbum(String id) async {
    final http.Response response = await http.delete(
      Uri.parse('https://jsonplaceholder.typicode.com/albums/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      // Jika server mengembalikan respons 200 OK,
      // lalu parsing JSON. Setelah menghapus,
      // Anda akan mendapatkan respons `{}` JSON kosong.
      // Jangan kembalikan `null`, jika mengembalikan null `snapshot.hasData`
      // akan selalu menghasilkan false pada `FutureBuilder`.
      return Album.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to delete album.');
    }
  }
}



// // Memanggil data dari server atau API
//   Future<http.Response> getData() async {
//     final response = await http
//         .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
//     return response;
//   }

//   sendData() async {
//     // Data yang akan dikirim
//     var data = {'title': 'The best dewa 19'};

//     // Kirim data ke server dengan HTTP Method POST
//     var response = await http.post(
//       Uri.parse('https://jsonplaceholder.typicode.com/albums'),
//       body: data,
//     );

//     // Cek apakah pengiriman data berhasil
//     if (response.statusCode == 200) {
//       debugPrint('Data berhasil dikirim');
//     } else {
//       debugPrint('Data gagal dikirim');
//     }
//   }

//   Future<http.Response> updateAlbum(String title) {
//     return http.put(
//       Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(<String, String>{
//         'title': title,
//       }),
//     );
//   }

//   Future<http.Response> deleteAlbum(String id) async {
//     final http.Response response = await http.delete(
//       Uri.parse('https://jsonplaceholder.typicode.com/albums/$id'),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//     );

//     return response;
//   }
// }
