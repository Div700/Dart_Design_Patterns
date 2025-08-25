/* This is the target interface that the client expects to use. It consists of a function names
 * getNetworkInfo() that returns a map of network information.
 */
abstract class NetworkInformation {
  Map<String, dynamic> getNetworkInfo(); //method to get the network information from a network device
}
