import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:rajsthan_studio/api/models/video_sources.dart';
import 'package:rajsthan_studio/api/api.dart';
import 'package:rajsthan_studio/components/detail.dart';
import 'package:rajsthan_studio/components/loader.dart';
import 'package:rajsthan_studio/center/theme.dart';

class videos extends StatefulWidget {
  @override
  _videosState createState() => _videosState();
}

class _videosState extends State<videos> {
  Future<VideoSource?>? video_data;
  @override
  void initState() {
    handle_request("https://api.pexels.com/v1/videos/search/?%3Fpage=2&page=1&per_page=7&query=car");
    super.initState();
  }

  void handle_request(String url) {
    if (this.mounted) {
      setState(() {
        video_data = apis.videos(url,context);
      });
    }
   
  }

   @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        //--
        Flexible(
            fit: FlexFit.tight,
            child: Container(
                child: FutureBuilder(
                    future: video_data,
                    builder: (BuildContext context,
                        AsyncSnapshot<VideoSource?> snapshot) {
                      if (snapshot.connectionState != ConnectionState.done) {
                        return Center(child: loader());
                      }else if(snapshot.data==null){
                         return Center(child: loader());

                      }
                       else {
                        return Column(
                          children: [
                            Expanded(
                                child: Container(
                              // height: 500.0,
                              margin: EdgeInsets.all(12),
                              child: new StaggeredGridView.countBuilder(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 12,
                                  mainAxisSpacing: 12,
                                  itemCount: snapshot.data?.videos?.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12))),
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12)),
                                          child: Container(
                                              color: theme.base,
                                              child: GestureDetector(
                                                  onTap: () {
                                                     showModalBottomSheet(
                                                        isScrollControlled:
                                                            false,
                                                        context: context,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        builder:
                                                            (context) => detail(
                                                              is_video: true,
                                                                  height: snapshot
                                                                      .data!
                                                                      .videos![
                                                                          index]
                                                                      .height,
                                                                  width: snapshot
                                                                      .data!
                                                                      .videos![
                                                                          index]
                                                                      .width,
                                                                  id: snapshot
                                                                      .data!
                                                                      .videos![
                                                                          index]
                                                                      .id,
                                                                  photo_grapher_name: snapshot
                                                                      .data!
                                                                      .videos![
                                                                          index]
                                                                      .user!.name,
                                                                  url: snapshot
                                                                      .data!
                                                                      .videos![
                                                                          index]
                                                                      .videoFiles![0].link
                                                                      
                                                                ));
                                                  },
                                                  child: Image.network(
                                                    snapshot
                                                        .data!
                                                        .videos![index]
                                                        .image!,
                                                       
                                                    fit: BoxFit.cover,
                                                  )))),
                                    );
                                  },
                                  staggeredTileBuilder: (index) {
                                    return new StaggeredTile.count(
                                        1, index.isEven ? 1.2 : 1.8);
                                  }),
                            )),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                snapshot.data!.page != 1
                                    ? IconButton(
                                        onPressed: () {
                                          handle_request(
                                              snapshot.data!.prevpage!);
                                        },
                                        icon: Icon(Icons.arrow_back_ios),
                                        tooltip: "Previous",
                                      )
                                    : new Container(
                                        height: 0.0,
                                        width: 0.0,
                                      ),
                                IconButton(
                                  onPressed: () {
                                    handle_request(snapshot.data!.nextPage!);
                                  },
                                  icon: Icon(
                                    Icons.arrow_forward_ios,
                                  ),
                                  tooltip: "Next",
                                )
                              ],
                            )
                          ],
                        );
                        //--

                      }
                    })
                //---
                )
            //---
            )
      ],
    );
  }
}
