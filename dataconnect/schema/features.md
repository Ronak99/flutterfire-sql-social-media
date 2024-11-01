# Main

One user can make multiple posts (user has one-to-many relation with posts)

user

- uid
- name
- username
- image
- created_on

One post can have multiple comments (posts has one-to-many relation with comments)
One post can have multiple likes

post

- id
- image
- caption
- user
- timestamp

One user can leave a single like on a single post

like

- id
- timestamp
- user
- post

comment

- id
- text
- user
- post
- timestamp

graphql

# Users

type User @table(name: "Users", singular: "user", plural: "users", key: ["id"]) {
id: UUID! @col(name: "user_id") @default(expr: "uuidV4()")
username: String! @col(name: "username", dataType: "varchar(30)")

# Generated from @ref in Post and Comment tables:

# posts_on_user

# comments_on_user

}

# Posts

type Post @table(name: "Posts", singular: "post", plural: "posts", key: ["id"]) {
id: UUID! @col(name: "post_id") @default(expr: "uuidV4()")
content: String!
author: User! @ref

# authorId: UUID! <- this is created by the above @ref

createdAt: Timestamp! @default(expr: "request.time")

# Generated from @ref in Comment and Like tables:

# comments_on_post

# likes_on_post

}

# Comments

type Comment @table(name: "Comments", singular: "comment", plural: "comments", key: ["id"]) {
id: UUID! @col(name: "comment_id") @default(expr: "uuidV4()")
content: String!
author: User! @ref

# authorId: UUID! <- this is created by the above @ref

post: Post! @ref

# postId: UUID! <- this is created by the above @ref

createdAt: Timestamp! @default(expr: "request.time")
}

# Likes

type Like @table(name: "Likes", key: ["user", "post"]) {
user: User! @ref

# userId: UUID! <- this is created by the above @ref

post: Post! @ref

# postId: UUID! <- this is created by the above @ref

type: String! @col(name: "like_type") # "like" or "dislike"
}
