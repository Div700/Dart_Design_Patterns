import '../adaptees/juniper_router.dart';
import '../constants/network_constants.dart';
import '../interfaces/network_information.dart';

/* This is the adapter class that implements the NetworkInformation interface. It uses the JuniperRouter class (adaptee)
 * to get the network information and then adapts it to the target interface.
 */
class JuniperNetworkAdapter implements NetworkInformation {
  final JuniperRouter juniperRouter = JuniperRouter();

  @override
  Map<String, dynamic> getNetworkInfo() {
    try {
      Map<String, dynamic> juniperInfo = juniperRouter.fetchNetworkStatistics();

      // Map vendor-specific keys to the standard keys
      return {
        'Router_Id': juniperInfo['Router'],
        'Bandwidth_Available': juniperInfo['Bandwidth'],
        'SecurityStatus': juniperInfo['Security'],
        'Network_Health': juniperInfo['Health'],
      };
    } catch (e) {
      print("Error parsing Juniper network information: $e");
      return {
        'Router_Id': NetworkConstants.UNREACHABLE,
        'Bandwidth_Available': NetworkConstants.UNKNOWN,
        'SecurityStatus': NetworkConstants.UNKNOWN,
        'Network_Health': NetworkConstants.UNKNOWN,
      };
    }
  }
}
