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
