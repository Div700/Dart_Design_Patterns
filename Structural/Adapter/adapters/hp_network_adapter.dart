// adapters/hp_network_adapter.dart
import '../adaptees/hp_router.dart';
import '../constants/network_constants.dart';
import '../interfaces/network_information.dart';
import 'package:xml/xml.dart'; // for parsing XML

/* This is the adapter class that implements the NetworkInformation interface. It uses the HpRouter class (adaptee)
 * to get the network information and then adapts it to the target interface.
 */
class HpNetworkAdapter implements NetworkInformation {
  final HpRouter hpRouter = HpRouter();

  @override
  Map<String, dynamic> getNetworkInfo() {
    try {
      String hpInfo = hpRouter.getHpNetworkInformation();
      final document = XmlDocument.parse(hpInfo);
      return {
        'Router_Id': document.findAllElements('Hp_Router_Id').first.innerText,
        'Bandwidth_Available': document
            .findAllElements('Hp_Bandwidth_Available')
            .first
            .innerText,
        'SecurityStatus': document
            .findAllElements('Hp_SecurityStatus')
            .first
            .innerText,
        'Network_Health': document
            .findAllElements('Hp_Network_Health')
            .first
            .innerText,
      };
    } catch (e) {
      print("Error parsing HP network information: $e");
      return {
        'Router_Id': NetworkConstants.UNREACHABLE,
        'Bandwidth_Available': NetworkConstants.UNKNOWN,
        'SecurityStatus': NetworkConstants.UNKNOWN,
        'Network_Health': NetworkConstants.UNKNOWN,
      };
    }
  }
}
