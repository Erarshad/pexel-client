// To parse this JSON data, do
//
//     final imageSource = imageSourceFromJson(jsonString);

import 'dart:convert';

ImageSource imageSourceFromJson(String str) => ImageSource.fromJson(json.decode(str));

String imageSourceToJson(ImageSource data) => json.encode(data.toJson());

class ImageSource {
    ImageSource({
        this.page,
        this.perPage,
        this.photos,
        this.totalResults,
        this.nextPage,
        this.prevPage,
    });

    int ?page;
    int? perPage;
    List<Photo>? photos;
    int ?totalResults;
    String ?nextPage;
    String ?prevPage;

    factory ImageSource.fromJson(Map<String, dynamic> json) => ImageSource(
        page: json["page"],
        perPage: json["per_page"],
        photos: List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
        totalResults: json["total_results"],
        nextPage: json["next_page"],
        prevPage: json["prev_page"],
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "per_page": perPage,
        "photos": List<dynamic>.from(photos!.map((x) => x.toJson())),
        "total_results": totalResults,
        "next_page": nextPage,
        "prev_page": prevPage,
    };
}

class Photo {
    Photo({
        this.id,
        this.width,
        this.height,
        this.url,
        this.photographer,
        this.photographerUrl,
        this.photographerId,
        this.avgColor,
        this.src,
    });

    int? id;
    int ?width;
    int ?height;
    String ?url;
    String ?photographer;
    String ?photographerUrl;
    int ?photographerId;
    String? avgColor;
    Src ?src;

    factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        id: json["id"],
        width: json["width"],
        height: json["height"],
        url: json["url"],
        photographer: json["photographer"],
        photographerUrl: json["photographer_url"],
        photographerId: json["photographer_id"],
        avgColor: json["avg_color"],
        src: Src.fromJson(json["src"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "width": width,
        "height": height,
        "url": url,
        "photographer": photographer,
        "photographer_url": photographerUrl,
        "photographer_id": photographerId,
        "avg_color": avgColor,
        "src": src?.toJson(),
    };
}

class Src {
    Src({
        this.original,
        this.large2X,
        this.large,
        this.medium,
        this.small,
        this.portrait,
        this.landscape,
        this.tiny,
    });

    String? original;
    String ?large2X;
    String ?large;
    String ?medium;
    String ?small;
    String ?portrait;
    String ?landscape;
    String ?tiny;

    factory Src.fromJson(Map<String, dynamic> json) => Src(
        original: json["original"],
        large2X: json["large2x"],
        large: json["large"],
        medium: json["medium"],
        small: json["small"],
        portrait: json["portrait"],
        landscape: json["landscape"],
        tiny: json["tiny"],
    );

    Map<String, dynamic> toJson() => {
        "original": original,
        "large2x": large2X,
        "large": large,
        "medium": medium,
        "small": small,
        "portrait": portrait,
        "landscape": landscape,
        "tiny": tiny,
    };
}
