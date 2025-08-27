import '../interfaces/observer.dart';
import '../interfaces/subject.dart';
import '../models/video.dart';

class YouTubeChannel implements Subject {
  final String channelName;
  final List<Observer> _subscribers = [];
  final List<Video> _videos = [];

  YouTubeChannel({required this.channelName});

  void uploadVideo(Video video) {
    _videos.add(video);
    print('Channel "$channelName" uploaded: ${video.title}');
    notifySubscribers(video.title);
  }

  @override
  void addSubscriber(Observer observer) {
    _subscribers.add(observer);
    print('New subscriber added to $channelName');
  }

  @override
  void removeSubscriber(Observer observer) {
    _subscribers.remove(observer);
    print('Subscriber removed from $channelName');
  }

  @override
  void notifySubscribers(String videoTitle) {
    print('Notifying ${_subscribers.length} subscribers...');
    for (final subscriber in _subscribers) {
      subscriber.update(channelName, videoTitle);
    }
  }

  int get subscriberCount => _subscribers.length;
  int get videoCount => _videos.length;

  @override
  String toString() => 'Channel: $channelName (${_subscribers.length} subscribers, ${_videos.length} videos)';
}