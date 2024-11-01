part of movies_connector;

class DeletePostVariablesBuilder {
  String id;

  
  FirebaseDataConnect _dataConnect;
  
  DeletePostVariablesBuilder(this._dataConnect, {required String this.id,});
  Deserializer<DeletePostData> dataDeserializer = (dynamic json)  => DeletePostData.fromJson(jsonDecode(json));
  Serializer<DeletePostVariables> varsSerializer = (DeletePostVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<DeletePostData, DeletePostVariables>> execute() {
    return this.ref().execute();
  }
  MutationRef<DeletePostData, DeletePostVariables> ref() {
    DeletePostVariables vars=DeletePostVariables(id: id,);

    return _dataConnect.mutation("DeletePost", dataDeserializer, varsSerializer, vars);
  }
}


  class DeletePostPostDelete {
  
   String id;

  
  
    
    
    
    DeletePostPostDelete.fromJson(dynamic json):
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

  DeletePostPostDelete({
    
      required this.id,
    
  });
}



  class DeletePostData {
  
   DeletePostPostDelete? post_delete;

  
  
    
    
    
    DeletePostData.fromJson(dynamic json):
        post_delete = json['post_delete'] == null ? null : 
 
    DeletePostPostDelete.fromJson(json['post_delete'])
  

        
        
       {
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
        if (post_delete != null) {
          json['post_delete'] = 
  
      post_delete!.toJson()
  
;
        }
      
    
    return json;
  }

  DeletePostData({
    
       this.post_delete,
    
  });
}



  class DeletePostVariables {
  
   String id;

  
  
    
    
     @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
    
    
    DeletePostVariables.fromJson(Map<String, dynamic> json):
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

  DeletePostVariables({
    
      required this.id,
    
  });
}







