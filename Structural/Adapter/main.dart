import 'dart:io';
import 'adapters/cisco_network_adapter.dart';
import 'adapters/hp_network_adapter.dart';
import 'adapters/juniper_network_adapter.dart';
import 'interfaces/network_information.dart';

/* This is the client class that uses the NetworkInformation interface to get the network information from the network devices.
 * It uses the adapter pattern to convert the network information from the network devices to the standardized data format.
 */
void main() {
  try {
    String choice = "1";

    while (choice != "5") {
      print("\n=== Network Monitoring System ===");
      print("1. Show Cisco Router Info");
      print("2. Show HP Router Info");
      print("3. Show Juniper Router Info");
      print("4. Show Overall Network Statistics");
      print("5. Exit");

      stdout.write("Enter your choice: ");
      choice = stdin.readLineSync() ?? "1";

      NetworkInformation networkInformation;
      switch (choice) {
        case "1":
          // Adapter pattern: Cisco router data converted to standard format
          networkInformation = CiscoNetworkAdapter();
          printRouterInfo("Cisco Router", networkInformation.getNetworkInfo());
          break;
        case "2":
          networkInformation = HpNetworkAdapter();
          printRouterInfo("HP Router", networkInformation.getNetworkInfo());
          break;
        case "3":
          networkInformation = JuniperNetworkAdapter();
          printRouterInfo(
            "Juniper Router",
            networkInformation.getNetworkInfo(),
          );
          break;
        case "4":
          showOverallStatistics();
          break;
        case "5":
          print("Exiting... Goodbye!");
          break;
        default:
          print("Invalid choice. Try again.");
      }
    }
  } catch (e) {
    print("Error in main: $e");
  }
}

// Display router information from standardized data format
void printRouterInfo(String name, Map<String, dynamic> routerInfo) {
  print("\n--- $name ---");
  routerInfo.forEach((key, value) {
    print("$key : $value");
  });
}

// Show all router statistics using adapter pattern
void showOverallStatistics() {
  try {
    print("\n=== Overall Network Statistics ===");

    NetworkInformation networkInformation = CiscoNetworkAdapter();
    printRouterInfo("Cisco Router", networkInformation.getNetworkInfo());

    networkInformation = HpNetworkAdapter();
    printRouterInfo("HP Router", networkInformation.getNetworkInfo());

    networkInformation = JuniperNetworkAdapter();
    printRouterInfo("Juniper Router", networkInformation.getNetworkInfo());
  } catch (e) {
    print("Error showing overall statistics: $e");
  }
}
