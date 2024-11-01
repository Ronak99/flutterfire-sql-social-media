part of movies_connector;

class LikePostVariablesBuilder {
  String userId;
String postId;

  
  FirebaseDataConnect _dataConnect;
  
  LikePostVariablesBuilder(this._dataConnect, {required String this.userId,required String this.postId,});
  Deserializer<LikePostData> dataDeserializer = (dynamic json)  => LikePostData.fromJson(jsonDecode(json));
  Serializer<LikePostVariables> varsSerializer = (LikePostVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<LikePostData, LikePostVariables>> execute() {
    return this.ref().execute();
  }
  MutationRef<LikePostData, LikePostVariables> ref() {
    LikePostVariables vars=LikePostVariables(userId: userId,postId: postId,);

    return _dataConnect.mutation("LikePost", dataDeserializer, varsSerializer, vars);
  }
}


  class LikePostLikeInsert {
  
   String id;

  
  
    
    
    
    LikePostLikeInsert.fromJson(dynamic json):
        id = 
 
    nativeFromJson<String>(json['id'])
  

        
        
       {
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
      json['id'] = 
  
    nativeToJson<String>(id)
    
;
      
    
    return json;
  }

  LikePostLikeInsert({
    
      required this.id,
    
  });
}



  class LikePostData {
  
   LikePostLikeInsert like_insert;

  
  
    
    
    
    LikePostData.fromJson(dynamic json):
        like_insert = 
 
    LikePostLikeInsert.fromJson(json['like_insert'])
  

        
        
       {
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
      json['like_insert'] = 
  
      like_insert.toJson()
  
;
      
    
    return json;
  }

  LikePostData({
    
      required this.like_insert,
    
  });
}



  class LikePostVariables {
  
   String userId;

  
   String postId;

  
  
    
    
     @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
    
    
    LikePostVariables.fromJson(Map<String, dynamic> json):
        userId = 
 
    nativeFromJson<String>(json['userId'])
  

        
        ,
      
        postId = 
 
    nativeFromJson<String>(json['postId'])
  

        
        
       {
      
        
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
      json['userId'] = 
  
    nativeToJson<String>(userId)
    
;
      
    
      
      json['postId'] = 
  
    nativeToJson<String>(postId)
    
;
      
    
    return json;
  }

  LikePostVariables({
    
      required this.userId,
    
      required this.postId,
    
  });
}







