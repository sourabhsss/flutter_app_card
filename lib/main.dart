import 'package:flutter/material.dart';
import 'quote.dart';

void main() => runApp(MaterialApp(
  home: QuoteList(),
));

class QuoteList extends StatefulWidget {
  @override
  _QuoteListState createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {

  List<Quote> quotes = [
    Quote(author: 'qqqq', text: "Love For All, Hatred For None. – ..."),
    Quote(author: 'xxxx', text: "Change the world by being yourself. – ..."),
    Quote(author: 'zzzzz', text: "Every moment is a fresh beginning.")
  ];

  Widget quoteTemplate (quote){
    return QuoteCard(quote: quote);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('List App'),),
      body: Column(
            children: quotes.map((quote) => QuoteCard(
                quote: quote,
              delete:(){
                  setState(() {
                    quotes.remove(quote);
                  });
              }
            )).toList()),
//        children: quotes.map((quote) => quoteTemplate (quote)).toList()),
//          children: quotes.map((quote) => Text('${quote.text} -${quote.author}')).toList()),
//          children: quotes.map((quote) => Text(quote)).toList())
//        children: quotes.map((quote){
//          return Text(quote);
//        }).toList()),
    );
  }
}

class QuoteCard extends StatelessWidget {

  final Quote quote;
  final Function delete;
  QuoteCard({this.quote, this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16,16,16,0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text (quote.text,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[600],
              ),
            ),
                SizedBox(height: 5),
                Text (quote.author,
                 style: TextStyle(
                 fontSize: 18,
                   color: Colors.grey[800],
                 ),
                ),
            SizedBox(height: 8),
            FlatButton.icon(onPressed: delete, icon: Icon(Icons.delete), label: Text('Delete'))
          ],
        ),
      ),
    );
  }
}


