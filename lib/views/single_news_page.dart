import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SingleNewsPage extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String content;
  final String heroBannerTag;
  const SingleNewsPage({ 
    Key? key, 
    required this.imageUrl, 
    required this.title, 
    required this.description,
    required this.content,
    required this.heroBannerTag 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Hero(
                tag: heroBannerTag,
                child: Container(              
                  alignment: Alignment.topCenter,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width / 1.5,              
                  decoration: BoxDecoration(                
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(imageUrl),
                      fit: BoxFit.contain
                    )
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(16),
                  width: MediaQuery.of(context).size.width,
                  height: double.infinity,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontFamily: 'RobotoSlab-Bold',
                          fontSize: 32
                        ),
                      ),
                      SizedBox(height: 16,),
                      Text(
                        description,
                        style: TextStyle(
                          fontFamily: 'Nunito-SemiBold',
                          fontSize: 20
                        ),
                      ),
                      // SizedBox(height: 16,),                      
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}