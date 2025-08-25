
/* This is the adaptee class that provides the network information. This class is a 3rd party or vendor specific library
exposed by the HP Router to get its network information. */
class HpRouter {
  String getHpNetworkInformation() {
    String hp_info = '''
    <HpRouterInfo>
      <Hp_Router_Id>Hp123</Hp_Router_Id>
      <Hp_Bandwidth_Available>123Mbps</Hp_Bandwidth_Available>
      <Hp_SecurityStatus>High</Hp_SecurityStatus>
      <Hp_Network_Health>95%</Hp_Network_Health>
    </HpRouterInfo>
    ''';
    return hp_info;
  }
}
