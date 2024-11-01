part of movies_connector;

class GetUserVariablesBuilder {
  String id;

  
  FirebaseDataConnect _dataConnect;
  
  GetUserVariablesBuilder(this._dataConnect, {required String this.id,});
  Deserializer<GetUserData> dataDeserializer = (dynamic json)  => GetUserData.fromJson(jsonDecode(json));
  Serializer<GetUserVariables> varsSerializer = (GetUserVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<GetUserData, GetUserVariables>> execute() {
    return this.ref().execute();
  }
  QueryRef<GetUserData, GetUserVariables> ref() {
    GetUserVariables vars=GetUserVariables(id: id,);

    return _dataConnect.query("GetUser", dataDeserializer, varsSerializer, vars);
  }
}


  class GetUserUser {
  
   String id;

  
   String username;

  
   String picture;

  
  
    
    
    
    GetUserUser.fromJson(dynamic json):
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

  GetUserUser({
    
      required this.id,
    
      required this.username,
    
      required this.picture,
    
  });
}



  class GetUserData {
  
   GetUserUser? user;

  
  
    
    
    
    GetUserData.fromJson(dynamic json):
        user = json['user'] == null ? null : 
 
    GetUserUser.fromJson(json['user'])
  

        
        
       {
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
        if (user != null) {
          json['user'] = 
  
      user!.toJson()
  
;
        }
      
    
    return json;
  }

  GetUserData({
    
       this.user,
    
  });
}



  class GetUserVariables {
  
   String id;

  
  
    
    
     @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
    
    
    GetUserVariables.fromJson(Map<String, dynamic> json):
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

  GetUserVariables({
    
      required this.id,
    
  });
}







