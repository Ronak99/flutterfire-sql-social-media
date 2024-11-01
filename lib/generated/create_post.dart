part of movies_connector;

class CreatePostVariablesBuilder {
  String authorId;
String content;

  
  FirebaseDataConnect _dataConnect;
  
  CreatePostVariablesBuilder(this._dataConnect, {required String this.authorId,required String this.content,});
  Deserializer<CreatePostData> dataDeserializer = (dynamic json)  => CreatePostData.fromJson(jsonDecode(json));
  Serializer<CreatePostVariables> varsSerializer = (CreatePostVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<CreatePostData, CreatePostVariables>> execute() {
    return this.ref().execute();
  }
  MutationRef<CreatePostData, CreatePostVariables> ref() {
    CreatePostVariables vars=CreatePostVariables(authorId: authorId,content: content,);

    return _dataConnect.mutation("CreatePost", dataDeserializer, varsSerializer, vars);
  }
}


  class CreatePostPostInsert {
  
   String id;

  
  
    
    
    
    CreatePostPostInsert.fromJson(dynamic json):
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

  CreatePostPostInsert({
    
      required this.id,
    
  });
}



  class CreatePostData {
  
   CreatePostPostInsert post_insert;

  
  
    
    
    
    CreatePostData.fromJson(dynamic json):
        post_insert = 
 
    CreatePostPostInsert.fromJson(json['post_insert'])
  

        
        
       {
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
      json['post_insert'] = 
  
      post_insert.toJson()
  
;
      
    
    return json;
  }

  CreatePostData({
    
      required this.post_insert,
    
  });
}



  class CreatePostVariables {
  
   String authorId;

  
   String content;

  
  
    
    
     @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
    
    
    CreatePostVariables.fromJson(Map<String, dynamic> json):
        authorId = 
 
    nativeFromJson<String>(json['authorId'])
  

        
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
      
    
      
      json['content'] = 
  
    nativeToJson<String>(content)
    
;
      
    
    return json;
  }

  CreatePostVariables({
    
      required this.authorId,
    
      required this.content,
    
  });
}







