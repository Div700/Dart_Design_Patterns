import 'flyweights/gas_station_flyweight.dart';
import 'flyweights/hote_icon_flyweight.dart';
import 'flyweights/restraunt_icon_flyweight.dart';
import 'interfaces/abstract_icon_flyweight.dart';

class IconFactory {
  static final Map<String, IconFlyweight> _flyweights = {};

  static IconFlyweight getFlyweight(String iconType) {
    if (!_flyweights.containsKey(iconType)) {
      switch (iconType) {
        case 'restaurant':
          _flyweights[iconType] = RestaurantIcon();
          print('Created RestaurantIcon flyweight (~10KB)');
          break;
        case 'gasstation':
          _flyweights[iconType] = GasStationIcon();
          print('Created GasStationIcon flyweight (~10KB)');
          break;
        case 'hotel':
          _flyweights[iconType] = HotelIcon();
          print('Created HotelIcon flyweight (~10KB)');
          break;
        default:
          throw Exception('Unknown icon type: $iconType');
      }
    }

    return _flyweights[iconType]!;
  }

  static int getFlyweightCount() => _flyweights.length;

  static Map<String, IconFlyweight> getAllFlyweights() => Map.from(_flyweights);
}
