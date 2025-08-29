import '../models/post.dart';
import '../models/user.dart';

class PostManager {
  // simulation of a database
  Map<User, List<Post>> _users;

  // Thread-safe: initialized at class load time
  static final PostManager _instance = PostManager._('MongoDB');

  PostManager._(String dao) : _users = <User, List<Post>>{};

  static PostManager get instance => _instance;

  void createNewPost(User u, Post newPost) {
    print('Updating to the cloud storage');
    List<Post>? userPosts = _users[u];
    if (userPosts != null) {
      userPosts.add(newPost);
      print('Post uploaded successfully!!');
    }
  }

  List<Post>? getPosts(User u) => _users[u];
  void addUsers(User u) => _users[u] = <Post>[];
}
