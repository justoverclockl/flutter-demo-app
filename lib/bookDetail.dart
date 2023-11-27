import 'package:flutter/material.dart';
import 'book.dart';

class BookDetail extends StatelessWidget {
  final Book book;
  const BookDetail(this.book, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Padding(padding: const EdgeInsets.all(8),
              child: Image.network(book.cover),
              ),
              Padding(padding: const EdgeInsets.all(8),
                child: Text('Scritto da ${book.authors}',
                  style: TextStyle(fontSize: 20, color: Theme.of(context).colorScheme.primary)),
              ),
              Padding(padding: const EdgeInsets.all(8),
                child: Text(book.editor,
                    style: const TextStyle(fontSize: 16),
                ),
              ),
              Padding(padding: const EdgeInsets.all(8),
                child: Text(book.description),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
