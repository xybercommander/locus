import 'package:flutter/material.dart';
import 'package:locus/widgets/news_list_widgets.dart';

class SeeMoreNewsPage extends StatefulWidget {
  final String title;
  final dynamic newsData;
  const SeeMoreNewsPage({
    Key? key,
    required this.title,
    required this.newsData
  }) : super(key: key);

  @override
  _SeeMoreNewsPageState createState() => _SeeMoreNewsPageState();
}

class _SeeMoreNewsPageState extends State<SeeMoreNewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          widget.title,
          style: TextStyle(
            fontFamily: 'RobotoSlab-ExtraBold',
            color: Colors.grey[100],
            fontSize: 32
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: BigNewsBanner(
              newsData: widget.newsData[index],
              bannertag: 'big-banner-$index',
            ),
          ),
        ),
      ),
    );
  }
}