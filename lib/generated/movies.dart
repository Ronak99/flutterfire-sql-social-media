library movies_connector;
import 'package:firebase_data_connect/firebase_data_connect.dart';
import 'dart:convert';

part 'create_user.dart';

part 'create_post.dart';

part 'delete_post.dart';

part 'delete_user.dart';

part 'create_comment.dart';

part 'get_user.dart';

part 'get_user_via_username.dart';

part 'get_all_users.dart';

part 'get_all_posts.dart';

part 'get_all_posts_by_me.dart';







class MoviesConnector {
  
  
  CreateUserVariablesBuilder createUser ({required String username,required String picture,}) {
    return CreateUserVariablesBuilder(dataConnect, username: username,picture: picture,);
  }
  
  
  CreatePostVariablesBuilder createPost ({required String authorId,required String content,}) {
    return CreatePostVariablesBuilder(dataConnect, authorId: authorId,content: content,);
  }
  
  
  DeletePostVariablesBuilder deletePost ({required String id,}) {
    return DeletePostVariablesBuilder(dataConnect, id: id,);
  }
  
  
  DeleteUserVariablesBuilder deleteUser ({required String uid,}) {
    return DeleteUserVariablesBuilder(dataConnect, uid: uid,);
  }
  
  
  CreateCommentVariablesBuilder createComment ({required String authorId,required String postId,required String content,}) {
    return CreateCommentVariablesBuilder(dataConnect, authorId: authorId,postId: postId,content: content,);
  }
  
  
  GetUserVariablesBuilder getUser ({required String id,}) {
    return GetUserVariablesBuilder(dataConnect, id: id,);
  }
  
  
  GetUserViaUsernameVariablesBuilder getUserViaUsername ({required String username,}) {
    return GetUserViaUsernameVariablesBuilder(dataConnect, username: username,);
  }
  
  
  GetAllUsersVariablesBuilder getAllUsers () {
    return GetAllUsersVariablesBuilder(dataConnect, );
  }
  
  
  GetAllPostsVariablesBuilder getAllPosts () {
    return GetAllPostsVariablesBuilder(dataConnect, );
  }
  
  
  GetAllPostsByMeVariablesBuilder getAllPostsByMe ({required String authorId,}) {
    return GetAllPostsByMeVariablesBuilder(dataConnect, authorId: authorId,);
  }
  

  static ConnectorConfig connectorConfig = ConnectorConfig(
    'asia-south1',
    'movies',
    'my-data-connect',
  );

  MoviesConnector({required this.dataConnect});
  static MoviesConnector get instance {
    return MoviesConnector(
        dataConnect: FirebaseDataConnect.instanceFor(
            connectorConfig: connectorConfig,
            sdkType: CallerSDKType.generated));
  }

  FirebaseDataConnect dataConnect;
}

