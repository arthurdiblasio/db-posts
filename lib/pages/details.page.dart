import 'package:blog_arthur/models/comment.model.dart';
import 'package:blog_arthur/models/post.model.dart';
import 'package:blog_arthur/repositories/post.repository.dart';
import 'package:blog_arthur/util/app_colors.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final Post post;
  final repository = new PostRepository();
  List<Comment> comments;

  DetailsPage({@required this.post});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: AppColors.darkBlueCustom,
        child: SafeArea(
          bottom: false,
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: AppColors.darkBlueCustom,
              title: Text("DB POSTS"),
            ),
            body: Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                child: Stack(
                  children: <Widget>[
                    SingleChildScrollView(
                        child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            width: MediaQuery.of(context).size.width,
                            child: Column(children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(bottom: 20),
                                width: MediaQuery.of(context).size.width,
                                child: Text(post.title,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16.0)),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: Text(post.body,
                                    maxLines: 9999,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.black87, fontSize: 14.5)),
                              ),
                            ])),
                        Padding(
                          padding: EdgeInsets.only(top: 25),
                          child: Text(
                            'Comentários',
                            style: TextStyle(
                                color: Colors.black45, fontSize: 12.0),
                          ),
                        ),
                        Flexible(
                          child: FutureBuilder(
                              future: repository.getPostIdComment(post.id),
                              builder: (ctx, snp) {
                                if (snp.hasData) {
                                  comments = snp.data;
                                  return Column(
                                      children: comments
                                          .map((comment) => Card(
                                              elevation: 0,
                                              margin: EdgeInsets.all(0),
                                              // shape: Border(
                                              //     bottom: BorderSide(
                                              //         width: 1, color: Colors.grey[200])),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 10),
                                                child: Column(
                                                  children: <Widget>[
                                                    Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                bottom: 5),
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        child: Row(
                                                            children: <Widget>[
                                                              Flexible(
                                                                  flex: 1,
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsets.only(
                                                                        right:
                                                                            10),
                                                                    child: Text(
                                                                        comment
                                                                            .name,
                                                                        maxLines:
                                                                            1,
                                                                        overflow:
                                                                            TextOverflow
                                                                                .ellipsis,
                                                                        style: TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            color: Colors.black87,
                                                                            fontSize: 13.0)),
                                                                  )),
                                                              Flexible(
                                                                flex: 1,
                                                                child: Text(
                                                                    comment
                                                                        .email,
                                                                    maxLines: 1,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black54,
                                                                        fontSize:
                                                                            12.0)),
                                                              )
                                                            ])),
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          left: 10),
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      child: Text(comment.body,
                                                          maxLines: 9999,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black87,
                                                              fontSize: 13.0)),
                                                    )
                                                  ],
                                                ),
                                              )))
                                          .toList());
                                } else {
                                  return Padding(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Text(
                                        'Carregando...',
                                        style: TextStyle(
                                            color: Colors.black45,
                                            fontSize: 11.0),
                                      ));
                                }
                              }),
                        ),
                        // Tentei implementar a funcionalidade de adicionar um comentário, mas não consegui.
                        // Container(
                        //     color: Colors.white,
                        //     width: MediaQuery.of(context).size.width,
                        //     child: Row(
                        //       children: <Widget>[
                        //         Flexible(
                        //           child: TextFormField(
                        //             controller: _commentController,
                        //             autocorrect: false,
                        //             autovalidate: true,
                        //             obscureText: false,
                        //             onChanged: (text) {
                        //               // setState(() {
                        //               var textoSemEspaco = text.trim();

                        //               if (text == "" ||
                        //                   text == null ||
                        //                   textoSemEspaco == '') {
                        //                 // _isButtonDisabled = true;
                        //               } else {
                        //                 // _isButtonDisabled = false;
                        //               }
                        //               // });
                        //             },
                        //             keyboardType: TextInputType.text,
                        //             decoration: InputDecoration(
                        //               border: InputBorder.none,
                        //               hintStyle: TextStyle(
                        //                 color: Colors.black54,
                        //                 fontSize: 14.0,
                        //               ),
                        //               hintText: 'Adicione um comentário...',
                        //               fillColor: Colors.black54,
                        //               enabled: true,
                        //             ),
                        //           ),
                        //         ),
                        //         GestureDetector(
                        //           onTap: () async {
                        //             var resp =
                        //                 await repository.createComment(
                        //                     _commentController.text,
                        //                     post.id);
                        //             print(' RESP =>>>$resp');
                        //           },
                        //           child: Image.asset(
                        //             _imgEnable,
                        //             width: 24,
                        //           ),
                        //         )
                        //       ],
                        //     ))
                      ],
                    )),
                  ],
                )),
          ),
        ));
  }
}
