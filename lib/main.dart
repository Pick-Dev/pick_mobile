import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new RandomWords(),
      theme: new ThemeData(
        primaryColor: Colors.white
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  EnglishWordsState createState() => new EnglishWordsState();
}

class EnglishWordsState extends State<RandomWords> {
    final List<WordPair> _wordList = <WordPair>[];
    final Set<WordPair> _saved = new Set<WordPair>();
    final TextStyle _style = const TextStyle(fontSize: 18.0);

    @override
    Widget build(BuildContext context) {
      return new Scaffold(
        appBar: new AppBar(
          title: const Text('123'),
          actions: <Widget>[
//            new IconButton(icon: const Icon(Icons.notifications), onPressed: _getWordList)
            new IconButton(icon: const Icon(Icons.notifications_off), onPressed: _pushSaved)
          ],
        ),
        body: _getWordList(),
      );
    }

    void _pushSaved () {
      Navigator.of(context).push(
        new MaterialPageRoute<void>(
          builder: (BuildContext context) {
            final Iterable<ListTile> tiles = _saved.map(
              (WordPair pair) {
                return new ListTile(
                  title: new Text(
                    pair.asPascalCase,
                    style: _style,
                  ),
                );
              },
            );
            final List<Widget> divided = ListTile
              .divideTiles(
                context: context,
                tiles: tiles,
              )
              .toList();
              return new Scaffold(
                appBar: new AppBar(
                  title: const Text('faverate'),
                ),
                body: new ListView(children: divided),
              );
          },
          
        )
      );
    }
    Widget _getWordList() {
      return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (BuildContext _context, int i){
          if (i.isOdd) {
            return new Divider();
          }
          final int index = i ~/ 2;
          if (index >= _wordList.length) {
            _wordList.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_wordList[index]);
        },
      );
    }

    Widget _buildRow(WordPair pair) {
      final bool alreadySaved = _saved.contains(pair);
      return new ListTile(
        title: new Text(
          pair.asPascalCase,
          style: _style,
        ),
        trailing: new Icon(   // Add the lines from here... 
          alreadySaved ? Icons.favorite : Icons.favorite_border,
          color: alreadySaved ? Colors.blue[300] : null,
        ),    
        onTap: (){
          setState(() {
            if (alreadySaved) {
              _saved.remove(pair);
            } else {
              _saved.add(pair);
            }
          });
        },
      );
  }
}