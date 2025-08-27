
import 'observer.dart';

abstract class Subject {
  void addSubscriber(Observer observer);
  void removeSubscriber(Observer observer);
  void notifySubscribers(String videoTitle);
}