part of movies_connector;

class GetAllPostsVariablesBuilder {
  
  
  FirebaseDataConnect _dataConnect;
  
  GetAllPostsVariablesBuilder(this._dataConnect, );
  Deserializer<GetAllPostsData> dataDeserializer = (dynamic json)  => GetAllPostsData.fromJson(jsonDecode(json));
  
  Future<QueryResult<GetAllPostsData, void>> execute() {
    return this.ref().execute();
  }
  QueryRef<GetAllPostsData, void> ref() {
    
    return _dataConnect.query("GetAllPosts", dataDeserializer, emptySerializer, null);
  }
}


  class GetAllPostsPosts {
  
   String id;

  
   String content;

  
   Timestamp createdAt;

  
   GetAllPostsPostsAuthor author;

  
   List<GetAllPostsPostsLikesOnPost> likes_on_post;

  
   List<GetAllPostsPostsCommentsOnPost> comments_on_post;

  
  
    
    
    
    GetAllPostsPosts.fromJson(dynamic json):
        id = 
 
    nativeFromJson<String>(json['id'])
  

        
        ,
      
        content = 
 
    nativeFromJson<String>(json['content'])
  

        
        ,
      
        createdAt = 
 
    Timestamp.fromJson(json['createdAt'])
  

        
        ,
      
        author = 
 
    GetAllPostsPostsAuthor.fromJson(json['author'])
  

        
        ,
      
        likes_on_post = 
 
    
      (json['likes_on_post'] as List<dynamic>)
        .map((e) => GetAllPostsPostsLikesOnPost.fromJson(e))
        .toList()
    
  

        
        ,
      
        comments_on_post = 
 
    
      (json['comments_on_post'] as List<dynamic>)
        .map((e) => GetAllPostsPostsCommentsOnPost.fromJson(e))
        .toList()
    
  

        
        
       {
      
        
      
        
      
        
      
        
      
        
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
      json['id'] = 
  
    nativeToJson<String>(id)
    
;
      
    
      
      json['content'] = 
  
    nativeToJson<String>(content)
    
;
      
    
      
      json['createdAt'] = 
  
      createdAt.toJson()
  
;
      
    
      
      json['author'] = 
  
      author.toJson()
  
;
      
    
      
      json['likes_on_post'] = 
  
    
      likes_on_post.map((e) => e.toJson()).toList()
    
  
;
      
    
      
      json['comments_on_post'] = 
  
    
      comments_on_post.map((e) => e.toJson()).toList()
    
  
;
      
    
    return json;
  }

  GetAllPostsPosts({
    
      required this.id,
    
      required this.content,
    
      required this.createdAt,
    
      required this.author,
    
      required this.likes_on_post,
    
      required this.comments_on_post,
    
  });
}



  class GetAllPostsPostsAuthor {
  
   String id;

  
   String username;

  
   String picture;

  
  
    
    
    
    GetAllPostsPostsAuthor.fromJson(dynamic json):
        id = 
 
    nativeFromJson<String>(json['id'])
  

        
        ,
      
        username = 
 
    nativeFromJson<String>(json['username'])
  

        
        ,
      
        picture = 
 
    nativeFromJson<String>(json['picture'])
  

        
        
       {
      
        
      
        
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
      json['id'] = 
  
    nativeToJson<String>(id)
    
;
      
    
      
      json['username'] = 
  
    nativeToJson<String>(username)
    
;
      
    
      
      json['picture'] = 
  
    nativeToJson<String>(picture)
    
;
      
    
    return json;
  }

  GetAllPostsPostsAuthor({
    
      required this.id,
    
      required this.username,
    
      required this.picture,
    
  });
}



  class GetAllPostsPostsLikesOnPost {
  
   String id;

  
   GetAllPostsPostsLikesOnPostUser user;

  
  
    
    
    
    GetAllPostsPostsLikesOnPost.fromJson(dynamic json):
        id = 
 
    nativeFromJson<String>(json['id'])
  

        
        ,
      
        user = 
 
    GetAllPostsPostsLikesOnPostUser.fromJson(json['user'])
  

        
        
       {
      
        
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
      json['id'] = 
  
    nativeToJson<String>(id)
    
;
      
    
      
      json['user'] = 
  
      user.toJson()
  
;
      
    
    return json;
  }

  GetAllPostsPostsLikesOnPost({
    
      required this.id,
    
      required this.user,
    
  });
}



  class GetAllPostsPostsLikesOnPostUser {
  
   String id;

  
   String username;

  
  
    
    
    
    GetAllPostsPostsLikesOnPostUser.fromJson(dynamic json):
        id = 
 
    nativeFromJson<String>(json['id'])
  

        
        ,
      
        username = 
 
    nativeFromJson<String>(json['username'])
  

        
        
       {
      
        
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
      json['id'] = 
  
    nativeToJson<String>(id)
    
;
      
    
      
      json['username'] = 
  
    nativeToJson<String>(username)
    
;
      
    
    return json;
  }

  GetAllPostsPostsLikesOnPostUser({
    
      required this.id,
    
      required this.username,
    
  });
}



  class GetAllPostsPostsCommentsOnPost {
  
   String id;

  
   String content;

  
   GetAllPostsPostsCommentsOnPostAuthor author;

  
  
    
    
    
    GetAllPostsPostsCommentsOnPost.fromJson(dynamic json):
        id = 
 
    nativeFromJson<String>(json['id'])
  

        
        ,
      
        content = 
 
    nativeFromJson<String>(json['content'])
  

        
        ,
      
        author = 
 
    GetAllPostsPostsCommentsOnPostAuthor.fromJson(json['author'])
  

        
        
       {
      
        
      
        
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
      json['id'] = 
  
    nativeToJson<String>(id)
    
;
      
    
      
      json['content'] = 
  
    nativeToJson<String>(content)
    
;
      
    
      
      json['author'] = 
  
      author.toJson()
  
;
      
    
    return json;
  }

  GetAllPostsPostsCommentsOnPost({
    
      required this.id,
    
      required this.content,
    
      required this.author,
    
  });
}



  class GetAllPostsPostsCommentsOnPostAuthor {
  
   String id;

  
   String username;

  
   String picture;

  
  
    
    
    
    GetAllPostsPostsCommentsOnPostAuthor.fromJson(dynamic json):
        id = 
 
    nativeFromJson<String>(json['id'])
  

        
        ,
      
        username = 
 
    nativeFromJson<String>(json['username'])
  

        
        ,
      
        picture = 
 
    nativeFromJson<String>(json['picture'])
  

        
        
       {
      
        
      
        
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
      json['id'] = 
  
    nativeToJson<String>(id)
    
;
      
    
      
      json['username'] = 
  
    nativeToJson<String>(username)
    
;
      
    
      
      json['picture'] = 
  
    nativeToJson<String>(picture)
    
;
      
    
    return json;
  }

  GetAllPostsPostsCommentsOnPostAuthor({
    
      required this.id,
    
      required this.username,
    
      required this.picture,
    
  });
}



  class GetAllPostsData {
  
   List<GetAllPostsPosts> posts;

  
  
    
    
    
    GetAllPostsData.fromJson(dynamic json):
        posts = 
 
    
      (json['posts'] as List<dynamic>)
        .map((e) => GetAllPostsPosts.fromJson(e))
        .toList()
    
  

        
        
       {
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
      json['posts'] = 
  
    
      posts.map((e) => e.toJson()).toList()
    
  
;
      
    
    return json;
  }

  GetAllPostsData({
    
      required this.posts,
    
  });
}







