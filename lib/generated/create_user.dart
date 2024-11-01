part of movies_connector;

class CreateUserVariablesBuilder {
  String username;
String picture;

  
  FirebaseDataConnect _dataConnect;
  
  CreateUserVariablesBuilder(this._dataConnect, {required String this.username,required String this.picture,});
  Deserializer<CreateUserData> dataDeserializer = (dynamic json)  => CreateUserData.fromJson(jsonDecode(json));
  Serializer<CreateUserVariables> varsSerializer = (CreateUserVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<CreateUserData, CreateUserVariables>> execute() {
    return this.ref().execute();
  }
  MutationRef<CreateUserData, CreateUserVariables> ref() {
    CreateUserVariables vars=CreateUserVariables(username: username,picture: picture,);

    return _dataConnect.mutation("CreateUser", dataDeserializer, varsSerializer, vars);
  }
}


  class CreateUserUserInsert {
  
   String id;

  
  
    
    
    
    CreateUserUserInsert.fromJson(dynamic json):
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

  CreateUserUserInsert({
    
      required this.id,
    
  });
}



  class CreateUserData {
  
   CreateUserUserInsert user_insert;

  
  
    
    
    
    CreateUserData.fromJson(dynamic json):
        user_insert = 
 
    CreateUserUserInsert.fromJson(json['user_insert'])
  

        
        
       {
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
      json['user_insert'] = 
  
      user_insert.toJson()
  
;
      
    
    return json;
  }

  CreateUserData({
    
      required this.user_insert,
    
  });
}



  class CreateUserVariables {
  
   String username;

  
   String picture;

  
  
    
    
     @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
    
    
    CreateUserVariables.fromJson(Map<String, dynamic> json):
        username = 
 
    nativeFromJson<String>(json['username'])
  

        
        ,
      
        picture = 
 
    nativeFromJson<String>(json['picture'])
  

        
        
       {
      
        
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
      json['username'] = 
  
    nativeToJson<String>(username)
    
;
      
    
      
      json['picture'] = 
  
    nativeToJson<String>(picture)
    
;
      
    
    return json;
  }

  CreateUserVariables({
    
      required this.username,
    
      required this.picture,
    
  });
}







