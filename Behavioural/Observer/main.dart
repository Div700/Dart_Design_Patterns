import 'models/video.dart';
import 'observers/user.dart';
import 'subjects/youtube_channel.dart';

void main() {
  print('=== YOUTUBE OBSERVER PATTERN DEMO ===\n');

  // Create channels
  final techChannel = YouTubeChannel(channelName: 'Tech Tutorials');
  final cookingChannel = YouTubeChannel(channelName: 'Cooking Basics');

  // Create users
  final alice = User(name: 'Alice');
  final bob = User(name: 'Bob');
  final charlie = User(name: 'Charlie');

  print('--- SUBSCRIBING TO CHANNELS ---');
  
  // Users subscribe to channels
  techChannel.addSubscriber(alice);
  techChannel.addSubscriber(bob);
  
  cookingChannel.addSubscriber(alice);
  cookingChannel.addSubscriber(charlie);

  print('\nChannel Status:');
  print(techChannel);
  print(cookingChannel);

  print('\n--- UPLOADING VIDEOS ---');

  // Tech channel uploads a video
  techChannel.uploadVideo(Video(
    title: 'Flutter Tutorial for Beginners',
    description: 'Learn Flutter basics in 30 minutes',
  ));

  print('');

  // Cooking channel uploads a video
  cookingChannel.uploadVideo(Video(
    title: 'Easy Pasta Recipe',
    description: 'Make delicious pasta in 15 minutes',
  ));

  print('\n--- MORE SUBSCRIBERS ---');

  // Charlie subscribes to tech channel
  techChannel.addSubscriber(charlie);

  print('');

  // Tech channel uploads another video
  techChannel.uploadVideo(Video(
    title: 'Dart Design Patterns',
    description: 'Understanding Observer Pattern',
  ));

  print('\n--- UNSUBSCRIBING ---');

  // Bob unsubscribes from tech channel
  techChannel.removeSubscriber(bob);

  print('');

  // Tech channel uploads one more video
  techChannel.uploadVideo(Video(
    title: 'Advanced Flutter State Management',
    description: 'Provider, Bloc, and Riverpod explained',
  ));

  print('\nFinal Channel Status:');
  print(techChannel);
  print(cookingChannel);
}