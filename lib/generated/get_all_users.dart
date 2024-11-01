part of movies_connector;

class GetAllUsersVariablesBuilder {
  
  
  FirebaseDataConnect _dataConnect;
  
  GetAllUsersVariablesBuilder(this._dataConnect, );
  Deserializer<GetAllUsersData> dataDeserializer = (dynamic json)  => GetAllUsersData.fromJson(jsonDecode(json));
  
  Future<QueryResult<GetAllUsersData, void>> execute() {
    return this.ref().execute();
  }
  QueryRef<GetAllUsersData, void> ref() {
    
    return _dataConnect.query("GetAllUsers", dataDeserializer, emptySerializer, null);
  }
}


  class GetAllUsersUsers {
  
   String id;

  
   String username;

  
   String picture;

  
  
    
    
    
    GetAllUsersUsers.fromJson(dynamic json):
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

  GetAllUsersUsers({
    
      required this.id,
    
      required this.username,
    
      required this.picture,
    
  });
}



  class GetAllUsersData {
  
   List<GetAllUsersUsers> users;

  
  
    
    
    
    GetAllUsersData.fromJson(dynamic json):
        users = 
 
    
      (json['users'] as List<dynamic>)
        .map((e) => GetAllUsersUsers.fromJson(e))
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

  GetAllUsersData({
    
      required this.users,
    
  });
}







