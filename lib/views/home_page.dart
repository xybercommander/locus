import 'package:flutter/material.dart';
import 'package:locus/modules/news_topics.dart';
import 'package:locus/views/news_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100]!,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(            
              expandedHeight: 80,
              backgroundColor: Colors.black,
              pinned: true,        
              elevation: 0,              
              title: Text(
                'Locus',
                style: TextStyle(
                  fontFamily: 'RobotoSlab-ExtraBold',
                  color: Colors.grey[100],
                  fontSize: 32
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: InkWell(
                    onTap: () {
                      
                    },
                    child: Icon(Icons.dark_mode, color: Colors.grey[100],)
                  ),
                )
              ],
              flexibleSpace: FlexibleSpaceBar(              
                background: Container(
                  color: Colors.grey[100],
                ),
                title: Row(                  
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Locus',
                      style: TextStyle(
                        fontFamily: 'RobotoSlab-ExtraBold',
                        color: Colors.black,
                        fontSize: 32
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        print(TopHeadLines.topHeadLinesData);
                      },
                      child: Icon(Icons.dark_mode, color: Colors.black,)
                    )
                  ],
                ),
                titlePadding: EdgeInsets.symmetric(horizontal: 32),                
              ),
            ),
          ];
        },
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            NewsList(category: 'Top Headlines', topic: TopHeadLines.topHeadLinesData,),
            NewsList(category: 'Nation', topic: NationNews.nationNewsData,),
            NewsList(category: 'Global', topic: WorldNews.worldNewsData,),            
            // NewsList(category: 'Business'),            
            // NewsList(category: 'Entertainment'),
            // NewsList(category: 'Sports'),
            // NewsList(category: 'Science'),
            // NewsList(category: 'Health'),
          ],
        ),
      )
    );
  }
}