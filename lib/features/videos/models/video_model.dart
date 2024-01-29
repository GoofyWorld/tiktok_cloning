class VideoModel {
  final String title;
  final String description;
  final String fileUrl;
  final String thumbnailUrl;
  final int likes;
  final int comments;
  final String creatorUid;
  final String creator;
  final int createdAt;
  final String id;

  VideoModel({
    required this.title,
    required this.description,
    required this.fileUrl,
    required this.thumbnailUrl,
    required this.likes,
    required this.comments,
    required this.creatorUid,
    required this.creator,
    required this.createdAt,
    required this.id,
  });

  VideoModel.fromJson(
      {required Map<String, dynamic> json, required String videoId})
      : title = json["title"],
        description = json["description"],
        fileUrl = json["fileUrl"],
        thumbnailUrl = json["thumbnailUrl"],
        likes = json["likes"],
        comments = json["comments"],
        creatorUid = json["creatorUid"],
        creator = json["creator"],
        createdAt = json["createdAt"],
        id = videoId;

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
      "fileUrl": fileUrl,
      "thumbnailUrl": thumbnailUrl,
      "likes": likes,
      "comments": comments,
      "creatorUid": creatorUid,
      "creator": creator,
      "createdAt": createdAt,
      "id": id,
    };
  }
}
