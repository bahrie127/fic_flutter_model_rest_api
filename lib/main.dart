import 'package:flutter/material.dart';

import 'crud_rest_api/album.dart';
import 'crud_rest_api/network_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<List<Album>> futureAlbum;

  // final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    futureAlbum = NetworkManager().fetchAllAlbum();
    //test
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Binar Flutter REST API',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('http example')),
        body: FutureBuilder<List<Album>>(
          future: futureAlbum,
          builder: (context, snapshot) {
            // If the connection is done,
            // check for response data or an error.
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return SafeArea(
                  child: SizedBox(
                    height: double.infinity,
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: const Icon(Icons.album),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                snapshot.data![index].title,
                              ),
                            ],
                          ),
                          trailing: Column(
                            children: [
                              const SizedBox(
                                height: 4,
                              ),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Icon(Icons.edit),
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child:
                                      const Icon(Icons.remove_circle_outline),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      itemCount: snapshot.data!.length,
                      separatorBuilder: (context, index) => const Divider(
                        thickness: 2,
                      ),
                    ),
                  ),
                );
                // Column(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: <Widget>[
                //     Text(snapshot.data!.title.isEmpty
                //         ? 'Deleted'
                //         : snapshot.data!.title),
                //     ElevatedButton(
                //       child: const Text('Delete Data'),
                //       onPressed: () {
                //         setState(() {
                //           futureAlbum = NetworkManager()
                //               .deleteAlbum(snapshot.data!.id.toString());
                //         });
                //       },
                //     ),
                //   ],
                // );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
            }
            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.red,
          child: const Icon(Icons.add),
        ),
      ),
      // body: Column(
      //   children: [
      //     // Column(
      //     //   mainAxisAlignment: MainAxisAlignment.center,
      //     //   children: <Widget>[
      //     //     TextField(
      //     //       controller: _controller,
      //     //       decoration: const InputDecoration(hintText: 'Enter Title'),
      //     //     ),
      //     //     ElevatedButton(
      //     //       onPressed: () {
      //     //         setState(() {
      //     //           futureAlbum =
      //     //               NetworkManager().createAlbum(_controller.text);
      //     //         });
      //     //       },
      //     //       child: const Text('Create Data'),
      //     //     ),
      //     //   ],
      //     // ),
      //     Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: <Widget>[
      //         Padding(
      //           padding: const EdgeInsets.all(8.0),
      //           child: TextField(
      //             controller: _controller,
      //             decoration: const InputDecoration(hintText: 'Enter Title'),
      //           ),
      //         ),
      //         ElevatedButton(
      //           onPressed: () {
      //             setState(() {
      //               futureAlbum =
      //                   NetworkManager().updateAlbum(1, _controller.text);
      //             });
      //           },
      //           child: const Text('Update Data'),
      //         ),
      //       ],
      //     ),
      //     FutureBuilder<Album>(
      //       future: futureAlbum,
      //       builder: (context, snapshot) {
      //         if (snapshot.hasData) {
      //           return Center(child: Text(snapshot.data!.title));
      //         } else if (snapshot.hasError) {
      //           return Text('${snapshot.error}');
      //         }
      //         return const CircularProgressIndicator();
      //       },
      //     ),
      //   ],
      // ),
    );
  }
}
