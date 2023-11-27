class Book {
  late String id;
  late String title;
  late String authors;
  late String description;
  late String editor;
  late String cover;

  Book(this.id, this.title, this.authors, this.description, this.editor,
      this.cover);

  Book.fromMap(Map<String, dynamic> bookMap) {
    id = bookMap['id'];
    title = bookMap['volumeInfo']['title'];
    authors = bookMap['volumeInfo']['authors'] == null
        ? ''
        : bookMap['volumeInfo']['authors'].toString();
    description = bookMap['volumeInfo']['description'] == null
        ? ''
        : bookMap['volumeInfo']['description'].toString();
    editor = bookMap['volumeInfo']['publisher'] == null
        ? ''
        : bookMap['volumeInfo']['publisher'].toString();
    cover = bookMap['volumeInfo']['imageLinks'] == null
        ? ''
        : bookMap['volumeInfo']['imageLinks']['smallThumbnail'].toString();
  }
}
