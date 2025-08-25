import '../adaptees/cisco_router.dart';
import '../constants/network_constants.dart';
import '../interfaces/network_information.dart';

/* This is the adapter class that implements the NetworkInformation interface. It uses the CiscoRouter class (adaptee)
 * to get the network information and then adapts it to the target interface.
 */
class CiscoNetworkAdapter implements NetworkInformation {
  final CiscoRouter ciscoRouter = CiscoRouter(); 
  
  @override
  Map<String, dynamic> getNetworkInfo() {
    try {
      Map<String, dynamic> ciscoInfo = ciscoRouter.getNetworkInfo();
      return {
        'Router_Id': ciscoInfo['Router_Id'],
        'Bandwidth_Available': ciscoInfo['Bandwidth_Available'],
        'SecurityStatus': ciscoInfo['SecurityStatus'],
        'Network_Health': ciscoInfo['Network_Health'],
      };
    } catch (e) {
      print("Error parsing Cisco network information: $e");
      return {
        'Router_Id': NetworkConstants.UNREACHABLE,
        'Bandwidth_Available': NetworkConstants.UNKNOWN,
        'SecurityStatus': NetworkConstants.UNKNOWN,
        'Network_Health': NetworkConstants.UNKNOWN,
      };
    }
  }
}
