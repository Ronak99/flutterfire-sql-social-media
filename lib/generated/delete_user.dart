part of movies_connector;

class DeleteUserVariablesBuilder {
  String uid;

  
  FirebaseDataConnect _dataConnect;
  
  DeleteUserVariablesBuilder(this._dataConnect, {required String this.uid,});
  Deserializer<DeleteUserData> dataDeserializer = (dynamic json)  => DeleteUserData.fromJson(jsonDecode(json));
  Serializer<DeleteUserVariables> varsSerializer = (DeleteUserVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<DeleteUserData, DeleteUserVariables>> execute() {
    return this.ref().execute();
  }
  MutationRef<DeleteUserData, DeleteUserVariables> ref() {
    DeleteUserVariables vars=DeleteUserVariables(uid: uid,);

    return _dataConnect.mutation("DeleteUser", dataDeserializer, varsSerializer, vars);
  }
}


  class DeleteUserUserDelete {
  
   String id;

  
  
    
    
    
    DeleteUserUserDelete.fromJson(dynamic json):
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

  DeleteUserUserDelete({
    
      required this.id,
    
  });
}



  class DeleteUserData {
  
   DeleteUserUserDelete? user_delete;

  
  
    
    
    
    DeleteUserData.fromJson(dynamic json):
        user_delete = json['user_delete'] == null ? null : 
 
    DeleteUserUserDelete.fromJson(json['user_delete'])
  

        
        
       {
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
        if (user_delete != null) {
          json['user_delete'] = 
  
      user_delete!.toJson()
  
;
        }
      
    
    return json;
  }

  DeleteUserData({
    
       this.user_delete,
    
  });
}



  class DeleteUserVariables {
  
   String uid;

  
  
    
    
     @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
    
    
    DeleteUserVariables.fromJson(Map<String, dynamic> json):
        uid = 
 
    nativeFromJson<String>(json['uid'])
  

        
        
       {
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
      json['uid'] = 
  
    nativeToJson<String>(uid)
    
;
      
    
    return json;
  }

  DeleteUserVariables({
    
      required this.uid,
    
  });
}







