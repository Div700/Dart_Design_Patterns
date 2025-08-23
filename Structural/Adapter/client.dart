// client.dart
import 'dart:io';

import 'adapters/cisco_network_adapter.dart';
import 'adapters/hp_network_adapter.dart';
import 'adapters/juniper_network_adapter.dart';
import 'interface/network_information.dart';

void main() {
  NetworkInformation networkInformation;

  while (true) {
    print("\n=== Network Monitoring System ===");
    print("1. Show Cisco Router Info");
    print("2. Show HP Router Info");
    print("3. Show Juniper Router Info");
    print("4. Show Overall Network Statistics");
    print("5. Exit");
    stdout.write("Enter your choice: ");

    String? choice = stdin.readLineSync();

    switch (choice) {
      case "1":
        networkInformation = CiscoNetworkAdapter();
        printRouterInfo("Cisco Router", networkInformation);
        break;
      case "2":
        networkInformation = HpNetworkAdapter();
        printRouterInfo("HP Router", networkInformation);
        break;
      case "3":
        networkInformation = JuniperNetworkAdapter();
        printRouterInfo("Juniper Router", networkInformation);
        break;
      case "4":
        showOverallStatistics();
        break;
      case "5":
        print("Exiting... Goodbye!");
        return;
      default:
        print("Invalid choice. Try again.");
    }
  }
}

void printRouterInfo(String name, NetworkInformation router) {
  print("\n--- $name ---");
  router.getNetworkInfo().forEach((key, value) {
    print("$key : $value");
  });
}

void showOverallStatistics() {
  print("\n=== Overall Network Statistics ===");

  List<NetworkInformation> routers = [
    CiscoNetworkAdapter(),
    HpNetworkAdapter(),
    JuniperNetworkAdapter(),
  ];

  for (var router in routers) {
    String routerName =
        router.getNetworkInfo()['Router_Id'] ?? "Unknown Router";
    printRouterInfo(routerName, router);
  }
}
