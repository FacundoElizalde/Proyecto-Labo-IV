class PhotoInfo {
      String id;
      String createdAt;
      String updatedAt;
      String? promotedAt;
      int width;
      int height;
      String color;
      String blurHash;
      String? description;
      dynamic altDescription;
      Urls urls;    
      int likes;
      bool likedByUser;
      List<dynamic> currentUserCollections;           

      PhotoInfo({
          required this.id,
          required this.createdAt,
          required this.updatedAt,
          this.promotedAt,
          required this.width,
          required this.height,
          required this.color,
          required this.blurHash,
          this.description,
          this.altDescription,
          required this.urls,        
          required this.likes,
          required this.likedByUser,
          required this.currentUserCollections,                     
      });

      

      factory PhotoInfo.fromJson(Map<String, dynamic> json) => PhotoInfo(
          id: json["id"],
          createdAt: json["created_at"],
          updatedAt: json["updated_at"],
          promotedAt: json["promoted_at"] == null ? null : json["promoted_at"],
          width: json["width"],
          height: json["height"],
          color: json["color"],
          blurHash: json["blur_hash"],
          description: json["description"] == null ? null : json["description"],
          altDescription: json["alt_description"] == null ? null : json["alt_description"],
          urls: Urls.fromJson(json["urls"]),        
          likes: json["likes"],
          likedByUser: json["liked_by_user"],
          currentUserCollections: List<dynamic>.from(json["current_user_collections"].map((x) => x)),                
      );
      
  }





  class Urls {
      Urls({
          required this.raw,
          required this.full,
          required this.regular,
          required this.small,
          required this.thumb,
          required this.smallS3,
      });

      String raw;
      String full;
      String regular;
      String small;
      String thumb;
      String smallS3;

      factory Urls.fromJson(Map<String, dynamic> json) => Urls(
          raw: json["raw"],
          full: json["full"],
          regular: json["regular"],
          small: json["small"],
          thumb: json["thumb"],
          smallS3: json["small_s3"],
      );   
  }