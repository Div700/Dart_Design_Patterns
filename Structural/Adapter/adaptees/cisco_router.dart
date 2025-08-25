/* This is the adaptee class that provides the network information. This class is a 3rd party or vendor specific library
exposed by the Cisco Router to get its network information. */
class CiscoRouter {
  Map<String, dynamic> getNetworkInfo() {
    return {
      'Router_Id': 'Cisco123',
      'Bandwidth_Available': '123Mbps',
      'SecurityStatus': 'High',
      'Network_Health': "95%",
    };
  }
}
