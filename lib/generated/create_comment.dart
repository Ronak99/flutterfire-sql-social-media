part of movies_connector;

class CreateCommentVariablesBuilder {
  String authorId;
String postId;
String content;

  
  FirebaseDataConnect _dataConnect;
  
  CreateCommentVariablesBuilder(this._dataConnect, {required String this.authorId,required String this.postId,required String this.content,});
  Deserializer<CreateCommentData> dataDeserializer = (dynamic json)  => CreateCommentData.fromJson(jsonDecode(json));
  Serializer<CreateCommentVariables> varsSerializer = (CreateCommentVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<CreateCommentData, CreateCommentVariables>> execute() {
    return this.ref().execute();
  }
  MutationRef<CreateCommentData, CreateCommentVariables> ref() {
    CreateCommentVariables vars=CreateCommentVariables(authorId: authorId,postId: postId,content: content,);

    return _dataConnect.mutation("CreateComment", dataDeserializer, varsSerializer, vars);
  }
}


  class CreateCommentCommentInsert {
  
   String id;

  
  
    
    
    
    CreateCommentCommentInsert.fromJson(dynamic json):
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

  CreateCommentCommentInsert({
    
      required this.id,
    
  });
}



  class CreateCommentData {
  
   CreateCommentCommentInsert comment_insert;

  
  
    
    
    
    CreateCommentData.fromJson(dynamic json):
        comment_insert = 
 
    CreateCommentCommentInsert.fromJson(json['comment_insert'])
  

        
        
       {
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
      json['comment_insert'] = 
  
      comment_insert.toJson()
  
;
      
    
    return json;
  }

  CreateCommentData({
    
      required this.comment_insert,
    
  });
}



  class CreateCommentVariables {
  
   String authorId;

  
   String postId;

  
   String content;

  
  
    
    
     @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
    
    
    CreateCommentVariables.fromJson(Map<String, dynamic> json):
        authorId = 
 
    nativeFromJson<String>(json['authorId'])
  

        
        ,
      
        postId = 
 
    nativeFromJson<String>(json['postId'])
  

        
        ,
      
        content = 
 
    nativeFromJson<String>(json['content'])
  

        
        
       {
      
        
      
        
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
      json['authorId'] = 
  
    nativeToJson<String>(authorId)
    
;
      
    
      
      json['postId'] = 
  
    nativeToJson<String>(postId)
    
;
      
    
      
      json['content'] = 
  
    nativeToJson<String>(content)
    
;
      
    
    return json;
  }

  CreateCommentVariables({
    
      required this.authorId,
    
      required this.postId,
    
      required this.content,
    
  });
}







