import 'package:flutter/material.dart';
import 'database_helper.dart';

class DictionaryHomePage extends StatefulWidget {
  const DictionaryHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DictionaryHomePageState createState() => _DictionaryHomePageState();
}

class _DictionaryHomePageState extends State<DictionaryHomePage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchWord = '';
  String _turkishMeaning = '';

  void _searchTurkishMeaning() async {
    setState(() {
      _searchWord = _searchController.text;
    });
    final word = await DatabaseHelper.getWord(_searchWord);
    setState(() {
      _turkishMeaning = word != null ? word['turkish'] : 'Word not found';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dictionary : English to Turkish',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 95, 94, 94),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'write here ...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10), // Border radius
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 2.0,
                  ), // Border color
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _searchTurkishMeaning,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.grey, // Button color
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20), // Button padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(
                      color: Colors.grey), // Button border radius
                ),
                textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold), // Text style
              ),
              child: const Text('Search'),
            ),
            const SizedBox(height: 40),
            _searchWord.isNotEmpty
                ? const Text(
                    'the Turkish of meaning is :',
                    style: TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  )
                : const SizedBox(),
            _searchWord.isNotEmpty
                ? Text(
                    ' "$_turkishMeaning" ',
                    style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 210, 25, 12)),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
