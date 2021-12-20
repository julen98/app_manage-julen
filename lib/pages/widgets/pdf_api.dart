import 'dart:io';
import 'package:expense/controllers/db_helper.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart';

class User {
  final Future<dynamic> name, date, type, amount;

  const User(
      {required this.name,
      required this.date,
      required this.type,
      required this.amount});
}

class PdfApi {
  DbHelper dbHelper = DbHelper();
  Future<File> generateTable() async {
    final pdf = Document();
    final headers = ['Name', 'Date', 'Type', 'Amount'];

    final users = [
      User(
          name: dbHelper.getName(),
          date: dbHelper.getDate(),
          type: dbHelper.getType(),
          amount: dbHelper.getAmount()),
    ];
    final data = users
        .map((user) => [user.name, user.date, user.type, user.amount])
        .toList();

    pdf.addPage(Page(
      build: (context) => Table.fromTextArray(
        headers: headers,
        data: data,
      ),
    ));

    return saveDocument(name: 'my_example.pdf', pdf: pdf);
  }

  static Future<File> saveDocument({
    required String name,
    required Document pdf,
  }) async {
    final bytes = await pdf.save();

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');

    await file.writeAsBytes(bytes);

    return file;
  }

  static Future openFile(File file) async {
    final url = file.path;

    await OpenFile.open(url);
  }
}
