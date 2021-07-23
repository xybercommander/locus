import 'package:flutter/material.dart';
import 'package:locus/views/see_more_news_page.dart';
import 'package:locus/widgets/news_list_widgets.dart';
import 'package:page_transition/page_transition.dart';

class NewsList extends StatefulWidget {
  final String category;
  final dynamic topic;
  const NewsList({ Key? key, required this.category, required this.topic }) : super(key: key);

  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,        
        children: [          
          Text(
            widget.category,
            style: TextStyle(
              fontFamily: 'RobotoSlab-Bold',
              color: Colors.black,
              fontSize: 28
            ),
          ),
          SizedBox(height: 16,),          
          BigNewsBanner(
            newsData: widget.topic[0],
            bannertag: 'home-page-banner',
          ),
          SizedBox(height: 4,),
          for(int i = 1; i <= 3; i++)
            SmallNewsBanner(
              newsData: widget.topic[i],
              index: i,
            ),
          SizedBox(height: 8,),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, PageTransition(
                    child: SeeMoreNewsPage(title: widget.category, newsData: widget.topic),
                    type: PageTransitionType.rightToLeft,
                    duration: Duration(milliseconds: 200)
                  ));
                },
                child: Text(
                  'See More',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontFamily: 'RobotoSlab-Bold',                    
                  ),
                )
              ),
            ),
          )
        ],
      ),
    );
  }
}