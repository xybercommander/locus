import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:locus/views/single_news_page.dart';
import 'package:page_transition/page_transition.dart';

class BigNewsBanner extends StatelessWidget {
  final dynamic newsData;
  final String bannertag;
  const BigNewsBanner({ 
    Key? key, 
    required this.newsData,      
    required this.bannertag,      
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, PageTransition(
          child: SingleNewsPage(
            title: newsData['title'],
            imageUrl: newsData['image'],
            description: newsData['description'],
            content: newsData['content'],
            heroBannerTag: 'banner-image-0-${newsData['title']}',
          ),
          type: PageTransitionType.rightToLeft,
          duration: Duration(milliseconds: 200)
        ));
      },
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            width: MediaQuery.of(context).size.width,
            height: 310,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),                    
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  newsData['title'],
                  style: TextStyle(
                    fontFamily: 'RobotoSlab-Medium',
                    fontSize: 18
                  ),
                ),
                SizedBox(height: 12,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '7 mins read',
                      style: TextStyle(
                        fontFamily: 'Nunito-Regular',
                        fontSize: 14
                      ),
                    ),
                    Text(
                      '17 Jul, 2021',
                      style: TextStyle(
                        fontFamily: 'Nunito-Regular',
                        fontSize: 14
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Hero(
            tag: '$bannertag',
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(            
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(newsData['image']),
                  fit: BoxFit.cover
                ),
                // boxShadow: 
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class SmallNewsBanner extends StatelessWidget {
  final dynamic newsData;
  final int index;   
  const SmallNewsBanner({ 
    Key? key, 
    required this.newsData,
    required this.index,      
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, PageTransition(
          child: SingleNewsPage(
            title: newsData['title'],
            imageUrl: newsData['image'],
            description: newsData['description'],
            content: newsData['content'],
            heroBannerTag: 'banner-image-$index-${newsData['title']}',
          ),
          type: PageTransitionType.rightToLeft,
          duration: Duration(milliseconds: 200)
        ));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        margin: EdgeInsets.symmetric(vertical: 4),
        width: MediaQuery.of(context).size.width,
        height: 110,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          children: [
            Hero(
              tag: 'banner-image-$index',
              child: Container(
                width: 90,
                height: 80,
                decoration: BoxDecoration(            
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(newsData['image']),
                    fit: BoxFit.cover
                  ),
                  // boxShadow: 
                ),
              ),
            ),
            SizedBox(width: 16,),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      newsData['title'],
                      style: TextStyle(
                        fontFamily: 'RobotoSlab-Medium',
                        fontSize: 16
                      ),
                    )
                  ),
                  SizedBox(height: 8,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                      '7 mins read',
                      style: TextStyle(
                        fontFamily: 'Nunito-Regular',
                        fontSize: 12
                      ),
                    ),
                    Text(
                      '17 Jul, 2021',
                      style: TextStyle(
                        fontFamily: 'Nunito-Regular',
                        fontSize: 12
                      ),
                    ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}