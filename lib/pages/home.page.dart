import 'package:blog_arthur/models/post.model.dart';
import 'package:blog_arthur/repositories/post.repository.dart';
import 'package:blog_arthur/util/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'details.page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var repository = new PostRepository();
  ScrollController _scrollController = new ScrollController();
  var user;
  List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return Material(
        color: AppColors.darkBlueCustom,
        child: SafeArea(
            bottom: false,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: AppColors.darkBlueCustom,
                title: Text("DB POSTS"),
                centerTitle: true,
              ),
              body: FutureBuilder(
                future: repository.getAllPosts(),
                builder: (context, snp) {
                  if (snp.hasData) {
                    posts = snp.data;
                    return Stack(
                      children: <Widget>[
                        RefreshIndicator(
                          onRefresh: _handleRefresh,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            controller: _scrollController,
                            itemCount: posts.length,
                            itemBuilder: (ctx, i) {
                              return Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: ListTile(
                                  title: Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.only(bottom: 10),
                                    child: Text(posts[i].title,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 15.0)),
                                  ),
                                  subtitle: Column(
                                    children: <Widget>[
                                      Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Text(posts[i].body,
                                              maxLines: 5,
                                              overflow: TextOverflow.ellipsis,
                                              style:
                                                  TextStyle(fontSize: 14.0))),
                                      Container(
                                          height: 30,
                                          child: FutureBuilder(
                                              future: repository
                                                  .getUsersId(posts[i].userId),
                                              builder: (ctx, snp) {
                                                if (snp.hasData) {
                                                  user = snp.data;
                                                  return Container(
                                                      padding: EdgeInsets.only(
                                                          top: 10),
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      child: Row(
                                                        children: <Widget>[
                                                          Flexible(
                                                              child: Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    right: 5),
                                                            child: Text(
                                                                user.username,
                                                                maxLines: 1,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        13.0)),
                                                          )),
                                                          Flexible(
                                                            child: Text(
                                                                user.email,
                                                                maxLines: 1,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black54,
                                                                    fontSize:
                                                                        13.0)),
                                                          ),
                                                        ],
                                                      ));
                                                } else {
                                                  return Text(
                                                      'Carregando usuário');
                                                }
                                              }))
                                    ],
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailsPage(
                                          post: posts[i],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                        Positioned(
                            bottom: 15,
                            right: 15,
                            child: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                    color: AppColors.darkBlueCustom,
                                    borderRadius: BorderRadius.circular(100)),
                                child: GestureDetector(
                                  onTap: () {
                                    _scrollController.animateTo(0.0,
                                        curve: Curves.easeOut,
                                        duration:
                                            const Duration(milliseconds: 10));
                                  },
                                  child: Icon(
                                    Icons.arrow_upward,
                                    color: Colors.white,
                                    size: 35,
                                  ),
                                )))
                      ],
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: AppColors.darkBlueCustom,
                      ),
                    );
                  }
                },
              ),
            )));
  }

  Future<Null> _handleRefresh() async {
    await new Future.delayed(new Duration(seconds: 3));
    setState(() {
      repository.getAllUsers();
    });

    return null;
  }
}
