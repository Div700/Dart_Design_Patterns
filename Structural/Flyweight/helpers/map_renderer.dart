import '../map_icon_context.dart';
import '../flyweight_factory.dart';

class MapRenderer {
  final List<IconContext> _contexts = [];

  void addContext(IconContext context) {
    _contexts.add(context);
  }

  void renderAll() {
    print('\n🗺️  Rendering Map');
    print('=' * 50);
    
    for (final context in _contexts) {
      context.render(); // Context handles positioning
    }
    
    print('\n📊 Contexts: ${_contexts.length}');
    print('📊 Flyweights created: ${IconFactory.getFlyweightCount()}');
  }
}