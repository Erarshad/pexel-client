import 'package:flutter/material.dart';
import 'package:rajsthan_studio/center/theme.dart';
import 'package:rajsthan_studio/components/video_player.dart';
import 'package:shared_preferences/shared_preferences.dart';

class detail extends StatefulWidget {
  final bool? is_video;
  final int? id;
  final int? width;
  final int? height;
  final String? photo_grapher_name;
  final String? url;
  const detail(
      {Key? key,
      this.id,
      this.width,
      this.height,
      this.photo_grapher_name,
      this.url,
      this.is_video
      })
      : super(key: key);

  @override
  _detailState createState() => _detailState(
      height: height,
      width: width,
      photo_grapher_name: photo_grapher_name,
      url: url,
      id: id,
      is_video: is_video
      );
}

class _detailState extends State<detail> {
  final int? id;
  final int? width;
  final int? height;
  final String? photo_grapher_name;
  final String? url;
  final bool? is_video;
  _detailState(
      {@required this.id,
      @required this.width,
      @required this.height,
      @required this.photo_grapher_name,
      @required this.url,
      @required this.is_video
      });

  List<String> fav = List.filled(1, "", growable: true);

  void put_favourite() async {
    SharedPreferences pf = await SharedPreferences.getInstance();
    pf.setStringList("fav_list", fav);
  }

  void get_favourite() async {
    SharedPreferences pf = await SharedPreferences.getInstance();
    if (this.mounted) {
      setState(() {
        fav = pf.getStringList("fav_list")!;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    get_favourite();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SafeArea(
            top: false,
            child: Container(
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              Expanded(
                  child:is_video==false? Image.network(
                url!,
                fit: BoxFit.cover,
              ):
              media_stream(file_name: url,)
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    id.toString(),
                    style: TextStyle(
                        color: Colors.black, fontStyle: FontStyle.italic),
                  ),
                  Text(
                    photo_grapher_name!,
                    style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {
                      if (fav.contains(id.toString()) == false) {
                        if (this.mounted) {
                          setState(() {
                            fav.add(id.toString());
                          });
                        }
                        put_favourite();
                        get_favourite();
                      } else {
                        if (this.mounted) {
                          setState(() {
                            fav.remove(id.toString());
                          });
                        }
                        put_favourite();
                        get_favourite();
                      }
                    },
                    icon: fav.contains(id.toString())
                        ? Icon(
                            Icons.favorite,
                            color: theme.base,
                          )
                        : Icon(
                            Icons.favorite_border,
                          ),
                    tooltip: "Add to favorite",
                  )
                ],
              ),
            ]))));
  }
}
