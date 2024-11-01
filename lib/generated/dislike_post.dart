part of movies_connector;

class DislikePostVariablesBuilder {
  String id;

  
  FirebaseDataConnect _dataConnect;
  
  DislikePostVariablesBuilder(this._dataConnect, {required String this.id,});
  Deserializer<DislikePostData> dataDeserializer = (dynamic json)  => DislikePostData.fromJson(jsonDecode(json));
  Serializer<DislikePostVariables> varsSerializer = (DislikePostVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<DislikePostData, DislikePostVariables>> execute() {
    return this.ref().execute();
  }
  MutationRef<DislikePostData, DislikePostVariables> ref() {
    DislikePostVariables vars=DislikePostVariables(id: id,);

    return _dataConnect.mutation("DislikePost", dataDeserializer, varsSerializer, vars);
  }
}


  class DislikePostLikeDelete {
  
   String id;

  
  
    
    
    
    DislikePostLikeDelete.fromJson(dynamic json):
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

  DislikePostLikeDelete({
    
      required this.id,
    
  });
}



  class DislikePostData {
  
   DislikePostLikeDelete? like_delete;

  
  
    
    
    
    DislikePostData.fromJson(dynamic json):
        like_delete = json['like_delete'] == null ? null : 
 
    DislikePostLikeDelete.fromJson(json['like_delete'])
  

        
        
       {
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
        if (like_delete != null) {
          json['like_delete'] = 
  
      like_delete!.toJson()
  
;
        }
      
    
    return json;
  }

  DislikePostData({
    
       this.like_delete,
    
  });
}



  class DislikePostVariables {
  
   String id;

  
  
    
    
     @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
    
    
    DislikePostVariables.fromJson(Map<String, dynamic> json):
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

  DislikePostVariables({
    
      required this.id,
    
  });
}







