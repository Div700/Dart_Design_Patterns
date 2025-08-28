import '../database/post_manager.dart';
import 'post.dart';

class User {
  String _userName;
  List<User> _followers;
  List<User> _following;
  int _noFollowers;
  int _noPosts;
  int _noFollowing;

  User(String name)
    : _userName = name,
      _followers = <User>[],
      _following = <User>[],
      _noFollowers = 0,
      _noPosts = 0,
      _noFollowing = 0 {
    PostManager.getPostManager().addUsers(this);
  }

  // Function to follow a new user
  void follow(User newFollowing) {
    _following.add(newFollowing);
    _noFollowers++;
    newFollowing.addFollower(this);
  }

  // Function to add the user requesting to follow
  void addFollower(User newFollower) {
    _noFollowers++;
    _followers.add(newFollower);
  }

  // Function to make a new post
  void post(int photos) {
    Post newPost = Post(photos, this, _noPosts + 1);
    _noPosts = _noPosts + 1;
    PostManager manager = PostManager.getPostManager();
    manager.createNewPost(this, newPost);
  }

  // Function to get the posts for the user
  List<Post>? _getUserPosts(User u) {
    // Using singleton post manager to retrieve data
    PostManager manager = PostManager.getPostManager();
    return manager.getPosts(u);
  }

  // Function to view profile of the user
  List<Post>? viewProfile(User u) {
    if (u.getFollowers().contains(this)) {
      return _getUserPosts(u);
    }
    print("Not allowed to see posts without following");
    return null;
  }

  // Getters
  List<User> getFollowers() => _followers;
  List<User> getFollowing() => _following;
  int getNoFollowers() => _noFollowers;
  int getNoPosts() => _noPosts;
  int getNoFollowing() => _noFollowing;

  @override
  String toString() {
    return 'User{userName: $_userName, noFollowers: $_noFollowers, noPosts: $_noPosts, noFollowing: $_noFollowing}';
  }
}
