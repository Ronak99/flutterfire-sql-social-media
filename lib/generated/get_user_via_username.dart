part of movies_connector;

class GetUserViaUsernameVariablesBuilder {
  String username;

  
  FirebaseDataConnect _dataConnect;
  
  GetUserViaUsernameVariablesBuilder(this._dataConnect, {required String this.username,});
  Deserializer<GetUserViaUsernameData> dataDeserializer = (dynamic json)  => GetUserViaUsernameData.fromJson(jsonDecode(json));
  Serializer<GetUserViaUsernameVariables> varsSerializer = (GetUserViaUsernameVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<GetUserViaUsernameData, GetUserViaUsernameVariables>> execute() {
    return this.ref().execute();
  }
  QueryRef<GetUserViaUsernameData, GetUserViaUsernameVariables> ref() {
    GetUserViaUsernameVariables vars=GetUserViaUsernameVariables(username: username,);

    return _dataConnect.query("GetUserViaUsername", dataDeserializer, varsSerializer, vars);
  }
}


  class GetUserViaUsernameUsers {
  
   String id;

  
   String username;

  
   String picture;

  
  
    
    
    
    GetUserViaUsernameUsers.fromJson(dynamic json):
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

  GetUserViaUsernameUsers({
    
      required this.id,
    
      required this.username,
    
      required this.picture,
    
  });
}



  class GetUserViaUsernameData {
  
   List<GetUserViaUsernameUsers> users;

  
  
    
    
    
    GetUserViaUsernameData.fromJson(dynamic json):
        users = 
 
    
      (json['users'] as List<dynamic>)
        .map((e) => GetUserViaUsernameUsers.fromJson(e))
        .toList()
    
  

        
        
       {
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
      json['users'] = 
  
    
      users.map((e) => e.toJson()).toList()
    
  
;
      
    
    return json;
  }

  GetUserViaUsernameData({
    
      required this.users,
    
  });
}



  class GetUserViaUsernameVariables {
  
   String username;

  
  
    
    
     @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
    
    
    GetUserViaUsernameVariables.fromJson(Map<String, dynamic> json):
        username = 
 
    nativeFromJson<String>(json['username'])
  

        
        
       {
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
      json['username'] = 
  
    nativeToJson<String>(username)
    
;
      
    
    return json;
  }

  GetUserViaUsernameVariables({
    
      required this.username,
    
  });
}







