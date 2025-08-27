# Mediator Design Pattern

## What is it?
The Mediator pattern defines how objects interact with each other. Instead of objects communicating directly, they communicate through a central mediator object.

## Structure

```
Mediator/
├── interfaces/
│   ├── mediator.dart          # Mediator interface
│   └── colleague.dart         # Colleague base class
├── mediator/
│   └── traffic_control_mediator.dart  # Concrete mediator
├── colleagues/
│   ├── bus.dart              # Bus colleague
│   ├── ambulance.dart        # Ambulance colleague
│   └── fire_truck.dart       # FireTruck colleague
├── main.dart                 # Demo
└── README.md                 # This file
```

## Key Components

- **Mediator Interface**: Defines communication contract
- **TrafficControlMediator**: Manages all vehicle communication
- **Colleague**: Base class for all vehicles
- **Bus, Ambulance, FireTruck**: Concrete vehicles that communicate through mediator

## How it works

1. All vehicles register with the traffic control mediator
2. When a vehicle needs to communicate, it sends message to mediator
3. Mediator forwards the message to appropriate vehicles
4. No direct communication between vehicles

```dart
// Create mediator and vehicles
final trafficControl = TrafficControlMediator();
final bus = Bus('City Bus 42', '5A');
final ambulance = Ambulance('Ambulance Alpha', 'Hospital');

// Register vehicles
trafficControl.addColleague(bus);
trafficControl.addColleague(ambulance);

// Vehicles communicate through mediator
ambulance.requestEmergencyClearance();
```

## Benefits

- **Decoupling**: Vehicles don't know about each other
- **Centralized Control**: All communication goes through one point
- **Extensibility**: Easy to add new vehicle types
- **Broadcasting**: Mediator can send messages to all participants
- **Coordination**: Complex interactions managed in one place

## Run

```bash
dart run main.dart
```
