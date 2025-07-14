// Singleton class for managing the fetching and updating of the posts
import '../models/post.dart';
import '../models/user.dart';

class PostManager {

  Map<User, List<Post>> _users;
  static PostManager? _instance;
  
  PostManager._(String dao)
      : _users = <User, List<Post>>{};
  
  factory PostManager.getPostManager([String? databaseType]) {
    if (_instance == null) {
      final dbType = databaseType ?? 'MongoDB'; // Default fallback
      _instance = PostManager._(dbType);
    }
    return _instance!;
  }
  
  void createNewPost(User u, Post newPost) {
    print('Updating to the cloud storage');
    List<Post>? userPosts = _users[u];
    if (userPosts != null) {
      userPosts.add(newPost);
      print('Post uploaded successfully!!');
    }
  }
  
  List<Post>? getPosts(User u) {
    return _users[u];
  }
  
  void addUsers(User u) {
    List<Post> userPosts = <Post>[];
    _users[u] = userPosts;
  }
}