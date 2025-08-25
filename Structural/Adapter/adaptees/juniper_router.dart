
/* This is the adaptee class that provides the network information. This class is a 3rd party or vendor specific library
exposed by the Juniper Router to get its network information. */
class JuniperRouter {
  Map<String, dynamic> fetchNetworkStatistics() {
    return {
      'Router': 'Juniper123',
      'Bandwidth': '123Mbps',
      'Security': 'High',
      'Health': "95%",
    };
  }
}