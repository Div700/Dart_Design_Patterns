import '../interfaces/expression.dart';

//This is a terminal expression, as this can not be defined further into smaller expression
class Number implements Expression {
  final int value;
  
  Number(this.value);
  
  @override
  int interpret() {
    return value;
  }
}