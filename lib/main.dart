import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'book.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BooksScreen(),
    );
  }
}

class BooksScreen extends StatefulWidget {
  @override
  State<BooksScreen> createState() => _LibriScreenState();
}

class _LibriScreenState extends State<BooksScreen> {
  String result = '';
  List<Book> books = []; 

  @override
  void initState() {
    getBooks('oceano mare');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Libri')),
      body: ListView.builder(
          itemCount: books.length,
          itemBuilder: (BuildContext context, int position) {
            return Card(
              elevation: 2,
              child: ListTile(
                leading: (books[position].cover != '')
                  ? Image.network(books[position].cover) : const FlutterLogo(),
                title: Text(books[position].title),
                subtitle: Text(books[position].authors),
              ),
            );
          },
      )
    );
  }

  Future getBooks(String ricerca) async {
    const domain = 'www.googleapis.com';
    const path = '/books/v1/volumes';
    Map<String, dynamic> params = {'q': ricerca};

    final Uri url = Uri.https(domain, path, params);

    http.get(url).then((res) {
      final resJson = json.decode(res.body);
      final booksResult = resJson['items'];
      books = booksResult.map<Book>((map) => Book.fromMap(map)).toList();

      setState(() {
        result = res.body;
        books = books;
      });
    });

    setState(() {
      result = 'Richiesta in corso';
    });
  }
}
