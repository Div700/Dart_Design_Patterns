# YouTube Observer Pattern - Dart Implementation

A simple demonstration of the Observer design pattern using a YouTube-like notification system built in Dart.

## Overview

This project implements the Observer pattern where YouTube channels act as **Subjects** that notify their **Subscribers** (Users) whenever new videos are uploaded. Users automatically receive notifications from all channels they've subscribed to.

## Pattern Components

- **Observer Interface**: Defines how subscribers receive notifications
- **Subject Interface**: Defines how channels manage subscribers and send notifications
- **YouTubeChannel (Subject)**: Manages subscribers and notifies them of new videos
- **User (Observer)**: Receives notifications from subscribed channels
- **Video**: Simple data model for video content

## Project Structure

```
lib/
├── models/
│   ├── video.dart           # Video data model
│   ├── user.dart           # User implementation (Observer)
│   └── youtube_channel.dart # Channel implementation (Subject)
├── observers/
│   └── observer.dart       # Observer interface
└── subjects/
    └── subject.dart        # Subject interface

example/
└── main.dart              # Demo application
```

## Key Features

- **Automatic Notifications**: Users get notified when subscribed channels upload videos
- **Dynamic Subscriptions**: Users can subscribe and unsubscribe from channels
- **Multiple Subscribers**: Channels can have multiple subscribers
- **Multiple Subscriptions**: Users can subscribe to multiple channels

## How It Works

1. **Create Channels**: YouTube channels are created as subjects
2. **Create Users**: Users are created as observers
3. **Subscribe**: Users subscribe to channels they're interested in
4. **Upload Video**: When a channel uploads a video, all subscribers are automatically notified
5. **Unsubscribe**: Users can unsubscribe to stop receiving notifications

## Running the Demo

```bash
dart run example/main.dart
```

## Sample Output

```
=== YOUTUBE OBSERVER PATTERN DEMO ===

--- SUBSCRIBING TO CHANNELS ---
New subscriber added to Tech Tutorials
New subscriber added to Tech Tutorials

--- UPLOADING VIDEOS ---
Channel "Tech Tutorials" uploaded: Flutter Tutorial for Beginners
Notifying 2 subscribers...
Alice received notification: New video "Flutter Tutorial for Beginners" uploaded on Tech Tutorials
Bob received notification: New video "Flutter Tutorial for Beginners" uploaded on Tech Tutorials
```

## Benefits of Observer Pattern

- **Loose Coupling**: Channels don't need to know specific details about their subscribers
- **Dynamic Relationships**: Subscribers can be added/removed at runtime
- **Broadcast Communication**: One event (video upload) notifies multiple observers
- **Extensibility**: Easy to add new types of observers or subjects

## Real-World Applications

This pattern is used in:
- Notification systems (YouTube, social media)
- Event handling in GUI frameworks
- Model-View architectures
- News feed systems
- Stock price monitoring systems

## Design Pattern Category

**Behavioral Pattern** - Defines how objects interact and communicate with each other.

## Getting Started

1. Clone the repository
2. Navigate to the project directory
3. Run the demo:
   ```bash
   dart run example/main.dart
   ```

## Requirements

- Dart SDK 2.17.0 or higher

## License

This project is for educational purposes to demonstrate the Observer design pattern.