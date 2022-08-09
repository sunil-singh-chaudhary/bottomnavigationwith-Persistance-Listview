import 'package:flutter/material.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: const Center(child: Text("Blog Page")),
        ),
        body: ListView.builder(
            shrinkWrap: true,
            itemCount: 400,
            itemBuilder: (context, index) => Card(
                  child: Card(
                    color: index % 2 == 0 ? Colors.teal : null,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text(
                            "Title of blog ${index}",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          Text("body of blog Lorem Ipsum Lorem Ipsum is here"),
                        ],
                      ),
                    ),
                  ),
                )));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
