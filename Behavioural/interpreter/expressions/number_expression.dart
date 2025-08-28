import '../interfaces/expression.dart';

class Number implements Expression {
  final int value;
  
  Number(this.value);
  
  @override
  int interpret() {
    return value;
  }
}