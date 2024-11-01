import 'dart:developer';

import 'package:dataconnect/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_data_connect/firebase_data_connect.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_data_connect/firebase_data_connect.dart';
// generated queries and mutations from SDK
import 'generated/movies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  String localhost = '127.0.0.1';
  String mobilehost = '192.168.1.5';

  // MoviesConnector.instance.dataConnect.useDataConnectEmulator(localhost, 9399);

  runApp(const MyApp());
}

// some bugs and what the hell
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CreateUserPage(),
    );
  }
}

class CreateUserPage extends StatefulWidget {
  const CreateUserPage({super.key});

  @override
  State<CreateUserPage> createState() => _CreateUserPageState();
}

class _CreateUserPageState extends State<CreateUserPage> {
  String? _username;
  String? _picture;

  final _formKey = GlobalKey<FormState>();
  final _postFormKey = GlobalKey<FormState>();

  String? _userId;
  String? _postContent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Flexible(
              flex: 1,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Social Media',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 35,
                      ),
                    ),
                    const SizedBox(height: 120),
                    TextFormField(
                      decoration: const InputDecoration(hintText: "Username"),
                      validator: (value) => value == null || value.isEmpty
                          ? "Please provide a username"
                          : null,
                      onSaved: (value) {
                        _username = value;
                        // setState(() {
                        // });
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(hintText: "Picture"),
                      validator: (value) => value == null || value.isEmpty
                          ? "Please provide a picture."
                          : null,
                      onSaved: (value) {
                        _picture = value;
                        setState(() {});
                      },
                    ),
                    TextButton(
                      child: const Text('Sign In'),
                      onPressed: () async {
                        bool valid = _formKey.currentState!.validate();

                        if (!valid) return;

                        _formKey.currentState!.save();

                        log("Username: $_username, Picture: $_picture");

                        QueryResult<GetUserViaUsernameData,
                                GetUserViaUsernameVariables> getUser =
                            await MoviesConnector.instance
                                .getUserViaUsername(username: _username!)
                                .execute();

                        if (getUser.data.users.isEmpty) {
                          OperationResult<CreateUserData, CreateUserVariables>
                              result = await MoviesConnector.instance
                                  .createUser(
                                    username: _username!,
                                    picture: _picture!,
                                  )
                                  .execute();

                          _userId = result.data.user_insert.id;
                        } else {
                          _userId = getUser.data.users.first.id;
                        }

                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
            ),
            if (_userId != null)
              Expanded(
                child:
                    FutureBuilder<QueryResult<GetUserData, GetUserVariables>>(
                  future:
                      MoviesConnector.instance.getUser(id: _userId!).execute(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    GetUserUser user = snapshot.data!.data.user!;

                    return Container(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                ),
                              ],
                              border:
                                  Border.all(color: Colors.black26, width: .5),
                              color: Colors.white,
                            ),
                            padding: const EdgeInsets.all(12),
                            child: Form(
                              key: _postFormKey,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 16,
                                        backgroundImage: NetworkImage(
                                          user.picture,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        user.username,
                                        style: const TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                      const Spacer(),
                                      ElevatedButton.icon(
                                        onPressed: () {
                                          if (!_postFormKey.currentState!
                                              .validate()) {
                                            return;
                                          }

                                          _postFormKey.currentState!.save();

                                          MoviesConnector.instance
                                              .createPost(
                                                content: _postContent!,
                                                authorId: _userId!,
                                              )
                                              .execute();

                                          setState(() {});
                                        },
                                        icon: const Icon(Icons.post_add),
                                        label: const Text('Create Post'),
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              30,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Divider(),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      hintText: "What's on your mind?",
                                      border: InputBorder.none,
                                    ),
                                    minLines: 5,
                                    maxLines: 12,
                                    onSaved: (value) {
                                      _postContent = value;
                                    },
                                    validator: (value) {
                                      if (value == null) return "Invalid Valid";
                                      if (value.trim().isEmpty)
                                        return "Invalid Valid";
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'All Posts',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          const SizedBox(height: 12),
                          Expanded(
                            child: FutureBuilder<
                                QueryResult<GetAllPostsData, void>>(
                              future: MoviesConnector.instance
                                  .getAllPosts()
                                  .execute(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }

                                List<GetAllPostsPosts> allPosts =
                                    snapshot.data?.data.posts ?? [];

                                return ListView.builder(
                                  itemCount: allPosts.length,
                                  itemBuilder: (context, i) {
                                    GetAllPostsPosts post = allPosts[i];
                                    return PostView(
                                      post: post,
                                      user: user,
                                      onComment: () {
                                        setState(() {});
                                      },
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class PostView extends StatefulWidget {
  final GetAllPostsPosts post;
  final GetUserUser user;
  final VoidCallback onComment;

  const PostView({
    super.key,
    required this.post,
    required this.user,
    required this.onComment,
  });

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  final commentFormKey = GlobalKey<FormState>();

  String? _commentContent;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
          ),
        ],
        border: Border.all(color: Colors.black26, width: .5),
        color: Colors.white,
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 4,
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 12,
                backgroundImage: NetworkImage(
                  widget.post.author.picture,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                widget.post.author.username,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(widget.post.content),
          const SizedBox(height: 12),
          Container(
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.black26, width: .5),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Form(
              key: commentFormKey,
              child: Row(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 12,
                        backgroundImage: NetworkImage(
                          widget.user.picture,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        widget.user.username,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextFormField(
                      onSaved: (value) {
                        _commentContent = value;
                      },
                      validator: (value) {
                        if (value == null) return "Invalid comment.";
                        if (value.isEmpty) return "Invalid comment.";
                        return null;
                      },
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      if (!commentFormKey.currentState!.validate()) {
                        return;
                      }

                      commentFormKey.currentState!.save();

                      MoviesConnector.instance
                          .createComment(
                            content: _commentContent!,
                            authorId: widget.user.id,
                            postId: widget.post.id,
                          )
                          .execute();

                      widget.onComment();
                    },
                    icon: const Icon(Icons.post_add),
                    label: const Text('Comment'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 5),
          if (widget.post.comments_on_post.isNotEmpty)
            Text(
              'Comments',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.post.comments_on_post
                  .map((comment) => Container(
                      decoration: BoxDecoration(
                        border: Border.symmetric(
                          horizontal: BorderSide(
                            color: Colors.blue[50]!,
                          ),
                        ),
                        color: Colors.blue[50]!,
                      ),
                      margin: const EdgeInsets.only(bottom: 4),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 12,
                            backgroundImage: NetworkImage(
                              comment.author.picture,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            comment.author.username,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(width: 5),
                          const Text(
                            "says",
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: Text(
                              comment.content,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      )))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}


/*
https://plus.unsplash.com/premium_photo-1689530775582-83b8abdb5020?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cmFuZG9tJTIwcGVyc29ufGVufDB8fDB8fHww

firebase
https://firebase.google.com/static/images/brand-guidelines/logo-vertical.png

flutter
https://storage.googleapis.com/cms-storage-bucket/0dbfcc7a59cd1cf16282.png

*/