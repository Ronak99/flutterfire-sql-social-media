part of movies_connector;

class GetAllPostsByMeVariablesBuilder {
  String authorId;

  
  FirebaseDataConnect _dataConnect;
  
  GetAllPostsByMeVariablesBuilder(this._dataConnect, {required String this.authorId,});
  Deserializer<GetAllPostsByMeData> dataDeserializer = (dynamic json)  => GetAllPostsByMeData.fromJson(jsonDecode(json));
  Serializer<GetAllPostsByMeVariables> varsSerializer = (GetAllPostsByMeVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<GetAllPostsByMeData, GetAllPostsByMeVariables>> execute() {
    return this.ref().execute();
  }
  QueryRef<GetAllPostsByMeData, GetAllPostsByMeVariables> ref() {
    GetAllPostsByMeVariables vars=GetAllPostsByMeVariables(authorId: authorId,);

    return _dataConnect.query("GetAllPostsByMe", dataDeserializer, varsSerializer, vars);
  }
}


  class GetAllPostsByMePosts {
  
   String id;

  
   String content;

  
   Timestamp createdAt;

  
   GetAllPostsByMePostsAuthor author;

  
   List<GetAllPostsByMePostsCommentsOnPost> comments_on_post;

  
  
    
    
    
    GetAllPostsByMePosts.fromJson(dynamic json):
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
 
    GetAllPostsByMePostsAuthor.fromJson(json['author'])
  

        
        ,
      
        comments_on_post = 
 
    
      (json['comments_on_post'] as List<dynamic>)
        .map((e) => GetAllPostsByMePostsCommentsOnPost.fromJson(e))
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
      
    
      
      json['comments_on_post'] = 
  
    
      comments_on_post.map((e) => e.toJson()).toList()
    
  
;
      
    
    return json;
  }

  GetAllPostsByMePosts({
    
      required this.id,
    
      required this.content,
    
      required this.createdAt,
    
      required this.author,
    
      required this.comments_on_post,
    
  });
}



  class GetAllPostsByMePostsAuthor {
  
   String id;

  
   String username;

  
   String picture;

  
  
    
    
    
    GetAllPostsByMePostsAuthor.fromJson(dynamic json):
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

  GetAllPostsByMePostsAuthor({
    
      required this.id,
    
      required this.username,
    
      required this.picture,
    
  });
}



  class GetAllPostsByMePostsCommentsOnPost {
  
   String content;

  
   GetAllPostsByMePostsCommentsOnPostAuthor author;

  
   Timestamp createdAt;

  
  
    
    
    
    GetAllPostsByMePostsCommentsOnPost.fromJson(dynamic json):
        content = 
 
    nativeFromJson<String>(json['content'])
  

        
        ,
      
        author = 
 
    GetAllPostsByMePostsCommentsOnPostAuthor.fromJson(json['author'])
  

        
        ,
      
        createdAt = 
 
    Timestamp.fromJson(json['createdAt'])
  

        
        
       {
      
        
      
        
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
      json['content'] = 
  
    nativeToJson<String>(content)
    
;
      
    
      
      json['author'] = 
  
      author.toJson()
  
;
      
    
      
      json['createdAt'] = 
  
      createdAt.toJson()
  
;
      
    
    return json;
  }

  GetAllPostsByMePostsCommentsOnPost({
    
      required this.content,
    
      required this.author,
    
      required this.createdAt,
    
  });
}



  class GetAllPostsByMePostsCommentsOnPostAuthor {
  
   String id;

  
   String username;

  
  
    
    
    
    GetAllPostsByMePostsCommentsOnPostAuthor.fromJson(dynamic json):
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

  GetAllPostsByMePostsCommentsOnPostAuthor({
    
      required this.id,
    
      required this.username,
    
  });
}



  class GetAllPostsByMeData {
  
   List<GetAllPostsByMePosts> posts;

  
  
    
    
    
    GetAllPostsByMeData.fromJson(dynamic json):
        posts = 
 
    
      (json['posts'] as List<dynamic>)
        .map((e) => GetAllPostsByMePosts.fromJson(e))
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

  GetAllPostsByMeData({
    
      required this.posts,
    
  });
}



  class GetAllPostsByMeVariables {
  
   String authorId;

  
  
    
    
     @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
    
    
    GetAllPostsByMeVariables.fromJson(Map<String, dynamic> json):
        authorId = 
 
    nativeFromJson<String>(json['authorId'])
  

        
        
       {
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
      json['authorId'] = 
  
    nativeToJson<String>(authorId)
    
;
      
    
    return json;
  }

  GetAllPostsByMeVariables({
    
      required this.authorId,
    
  });
}







