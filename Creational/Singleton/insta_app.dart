import 'dart:io';
import 'models/post.dart';
import 'models/user.dart';
import 'database/post_manager.dart';

void main() async {
  // HashMap to store the users objects
  Map<String, User> users = <String, User>{};

  PostManager.getPostManager('MongoDB');

  print("Create different users: ");
  int choice = 1;
  int photos = 0;
  String name;

  // Looping till user does not exit
  while (choice != 0) {
    try {
      print(
        "Enter 1 to create a new user\n"
        " Enter 2 to create post for a user\n"
        " Enter 3 to follow a new user\n"
        " Enter 4 to view profile\n"
        " Enter 0 to exit program",
      );

      String? input = stdin.readLineSync();
      choice = int.tryParse(input ?? '') ?? 0;

      switch (choice) {
        case 1:
          // Creating a new user
          print("Enter new user id: ");
          name = stdin.readLineSync() ?? '';
          while (users.containsKey(name)) {
            print("Username already exists, please provide another username: ");
            name = stdin.readLineSync() ?? '';
          }
          User clientUser = User(name);
          // Adding user in the map
          users[name] = clientUser;
          break;

        case 2:
          print("Enter your userid to create post for: ");
          name = stdin.readLineSync() ?? '';
          // Checking if the user exists
          User? u = users[name];
          if (u == null) {
            throw Exception("User not found.");
          }
          // Creating a new post for the user
          print("Enter the number of photos in the post: ");
          String? photosInput = stdin.readLineSync();
          photos = int.parse(photosInput ?? '0');
          u.post(photos);
          break;

        case 3:
          print("Enter your username: ");
          name = stdin.readLineSync() ?? '';
          User? currentUser = users[name];
          // Checking if the user exists
          if (currentUser == null) {
            throw Exception("User not found.");
          }
          // Following a new user
          print("Enter the username to follow");
          name = stdin.readLineSync() ?? '';
          User? u = users[name];
          // Checking if the user to be followed exists
          if (u == null) {
            throw Exception("User to follow not found.");
          }
          currentUser.follow(u);
          break;

        case 4:
          // Viewing the profile for a user
          print("Enter your username: ");
          name = stdin.readLineSync() ?? '';
          User? currentUser = users[name];
          if (currentUser == null) {
            throw Exception("User not found.");
          }
          print("Enter the username profile you want to see: ");
          name = stdin.readLineSync() ?? '';
          User? u = users[name];
          if (u == null) {
            throw Exception("Profile not found.");
          }
          List<Post>? posts = currentUser.viewProfile(u);
          if (posts != null && posts.isNotEmpty) {
            print(posts);
            // Liking any post
            print("Enter 1 if you want to like any post");
            String? likeInput = stdin.readLineSync();
            int do_like = int.parse(likeInput ?? '0');
            if (do_like == 1) {
              print("Enter the post id you want to like");
              String? postIdInput = stdin.readLineSync();
              int postid = int.parse(postIdInput ?? '0');
              posts[postid - 1].likePost(currentUser);
            }
            // Commenting on a post
            print("Enter 2 if you want to add a comment to any post");
            String? commentChoiceInput = stdin.readLineSync();
            int do_comment = int.parse(commentChoiceInput ?? '0');
            if (do_comment == 2) {
              print("Enter the post id you want to add comment to");
              String? postIdInput = stdin.readLineSync();
              final postid = int.parse(postIdInput ?? '0');
              print("Enter the comment");
              String comment = stdin.readLineSync() ?? '';
              posts[postid - 1].addComment(currentUser, comment);
            }
            print("Updated posts");
            print(posts);
          } else {
            print("No posts available");
          }
          break;

        case 0:
          print("Exiting program...");
          break;

        default:
          print("Please pick a correct choice");
      }
    } on FormatException {
      print("Invalid input. Please enter a valid number.");
    } on RangeError {
      print("Invalid post ID entered.");
    } catch (e) {
      print("Error: ${e.toString()}");
    }
  }
}
