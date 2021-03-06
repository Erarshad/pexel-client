// To parse this JSON data, do
//
//     final videoSource = videoSourceFromJson(jsonString);

import 'dart:convert';

VideoSource videoSourceFromJson(String str) =>
    VideoSource.fromJson(json.decode(str));

String videoSourceToJson(VideoSource data) => json.encode(data.toJson());

class VideoSource {
  VideoSource({
    this.page,
    this.perPage,
    this.videos,
    this.totalResults,
    this.nextPage,
    this.url,
    this.prevpage
  });

  int? page;
  int? perPage;
  List<Video>? videos;
  int? totalResults;
  String? prevpage;
  String? nextPage;
  String? url;

  factory VideoSource.fromJson(Map<String, dynamic> json) => VideoSource(
        page: json["page"],
        perPage: json["per_page"],
        videos: List<Video>.from(json["videos"].map((x) => Video.fromJson(x))),
        totalResults: json["total_results"],
        nextPage: json["next_page"],
        prevpage:json["prev_page"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "per_page": perPage,
        "videos": List<dynamic>.from(videos!.map((x) => x.toJson())),
        "total_results": totalResults,
        "next_page": nextPage,
        "prev_page":prevpage,
        "url": url,
      };
}

class Video {
  Video({
    this.id,
    this.width,
    this.height,
    this.duration,
    this.fullRes,
    this.tags,
    this.url,
    this.image,
    this.avgColor,
    this.user,
    this.videoFiles,
    this.videoPictures,
  });

  int? id;
  int? width;
  int? height;
  int? duration;
  dynamic fullRes;
  List<dynamic>? tags;
  String? url;
  String? image;
  dynamic avgColor;
  User? user;
  List<VideoFile>? videoFiles;
  List<VideoPicture>? videoPictures;

  factory Video.fromJson(Map<String, dynamic> json) => Video(
        id: json["id"],
        width: json["width"],
        height: json["height"],
        duration: json["duration"],
        fullRes: json["full_res"],
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
        url: json["url"],
        image: json["image"],
        avgColor: json["avg_color"],
        user: User.fromJson(json["user"]),
        videoFiles: List<VideoFile>.from(
            json["video_files"].map((x) => VideoFile.fromJson(x))),
        videoPictures: List<VideoPicture>.from(
            json["video_pictures"].map((x) => VideoPicture.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "width": width,
        "height": height,
        "duration": duration,
        "full_res": fullRes,
        "tags": List<dynamic>.from(tags!.map((x) => x)),
        "url": url,
        "image": image,
        "avg_color": avgColor,
        "user": user!.toJson(),
        "video_files": List<dynamic>.from(videoFiles!.map((x) => x.toJson())),
        "video_pictures":
            List<dynamic>.from(videoPictures!.map((x) => x.toJson())),
      };
}

class User {
  User({
    this.id,
    this.name,
    this.url,
  });

  int? id;
  String? name;
  String? url;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "url": url,
      };
}

class VideoFile {
  VideoFile({
    this.id,
    this.quality,
    this.fileType,
    this.width,
    this.height,
    this.link,
  });

  int? id;
  Quality? quality;
  FileType? fileType;
  int? width;
  int? height;
  String? link;

  factory VideoFile.fromJson(Map<String, dynamic> json) => VideoFile(
        id: json["id"],
        quality: qualityValues.map![json["quality"]],
        fileType: fileTypeValues.map![json["file_type"]],
        width: json["width"] == null ? null : json["width"],
        height: json["height"] == null ? null : json["height"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "quality": qualityValues.reverse![quality],
        "file_type": fileTypeValues.reverse![fileType],
        "width": width == null ? null : width,
        "height": height == null ? null : height,
        "link": link,
      };
}

enum FileType { VIDEO_MP4 }

final fileTypeValues = EnumValues({"video/mp4": FileType.VIDEO_MP4});

enum Quality { SD, HD, HLS }

final qualityValues =
    EnumValues({"hd": Quality.HD, "hls": Quality.HLS, "sd": Quality.SD});

class VideoPicture {
  VideoPicture({
    this.id,
    this.nr,
    this.picture,
  });

  int? id;
  int? nr;
  String? picture;

  factory VideoPicture.fromJson(Map<String, dynamic> json) => VideoPicture(
        id: json["id"],
        nr: json["nr"],
        picture: json["picture"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nr": nr,
        "picture": picture,
      };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
