import 'user.dart';

class Post {
  int _postId; // id of the post
  User _instaId;
  int _noLikes;
  int _photos; // parameter for number of photos in the post
  Map<User, String> _comments; // parameter for adding comments in the post
  List<User> _likedUsers; // storing the liked users

  Post(int photos, User userId, int postId)
      : _postId = postId,
        _instaId = userId,
        _photos = photos,
        _comments = <User, String>{},
        _likedUsers = <User>[],
        _noLikes = 0;

  // Function to add a comment
  void addComment(User user, String comment) {
    _comments[user] = comment;
  }

  // Function to like a post
  void likePost(User user) {
    _likedUsers.add(user);
    _noLikes++;
  }

  // Getters
  int get postId => _postId;
  User get instaId => _instaId;
  int get photos => _photos;
  int get noLikes => _noLikes;
  Map<User, String> get comments => _comments;
  List<User> get likedUsers => _likedUsers;

  // Setters
  set instaId(User instaId) => _instaId = instaId;
  set photos(int photos) => _photos = photos;
  set noLikes(int noLikes) => _noLikes = noLikes;
  set comments(Map<User, String> comments) => _comments = comments;
  set likedUsers(List<User> likedUsers) => _likedUsers = likedUsers;

  @override
  String toString() {
    return 'Post{postId: $_postId, photoCount: $_photos, likes: $_noLikes, comments: $_comments}';
  }
}