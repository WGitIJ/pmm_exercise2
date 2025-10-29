import 'package:flutter/material.dart';

class Cardpage extends StatelessWidget {
  const Cardpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Card Page')),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: [_cardTipus1(), SizedBox(height: 30.0), _cardTipus2()],
      ),
    );
  }
}

Widget _cardTipus1() {
  return Card(
    child: Column(
      children: [
        ListTile(
          leading: Icon(Icons.photo_album, color: Colors.blue),
          title: Text('Prova'),
          subtitle: Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque sit amet felis ex. Duis at erat eu libero ultricies pulvinar auctor eu odio. Vestibulum eleifend convallis leo, a rhoncus eros tincidunt pretium. Nam sapien ligula, mollis sed ipsum ac, commodo tincidunt massa. Aenean ante nunc, varius id nisl vitae, sollicitudin dapibus erat. Aliquam velit velit, porttitor a pharetra in, luctus sit amet nisi. Donec auctor, eros eu ultricies finibus, tellus augue consectetur dui, nec sagittis nisl augue nec tellus. Maecenas efficitur sollicitudin quam vitae pharetra. Sed vel dui dignissim, eleifend dui sed, pulvinar felis.",
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(onPressed: () {}, child: Text("OK")),
            TextButton(onPressed: () {}, child: Text("Cancel")),
          ],
        ),
      ],
    ),
  );
}

Widget _cardTipus2() {
  return Card(
    child: Column(
      children: [
        Image(
          image: NetworkImage(
            "https://fastly.picsum.photos/id/237/600/300.jpg?hmac=iRVPLLVQxFogSDvoPLrs3stJmz9g636YRQiWCDrU5MM",
          ),
        ),
        Container(
          child: Text("Image Title"),
          padding: EdgeInsets.all(10.0),
          ),
        ListTile(
          leading: Icon(Icons.photo_album, color: Colors.blue),
          title: Text("Image Description"),
          subtitle: Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque sit amet felis ex. Duis at erat eu libero ultricies pulvinar auctor eu odio. Vestibulum eleifend convallis leo, a rhoncus eros tincidunt pretium. Nam sapien ligula, mollis sed ipsum ac, commodo tincidunt massa. Aenean ante nunc, varius id nisl vitae, sollicitudin dapibus erat. Aliquam velit velit, porttitor a pharetra in, luctus sit amet nisi. Donec auctor, eros eu ultricies finibus, tellus augue consectetur dui, nec sagittis nisl augue nec tellus. Maecenas efficitur sollicitudin quam vitae pharetra. Sed vel dui dignissim, eleifend dui sed, pulvinar felis.",
          ),
        ),
      ],
    ),
  );
}
