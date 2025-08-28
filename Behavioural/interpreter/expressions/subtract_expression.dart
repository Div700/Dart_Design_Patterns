import '../interfaces/expression.dart';

class Subtract implements Expression {
  final Expression left;
  final Expression right;
  
  Subtract(this.left, this.right);
  
  @override
  int interpret() {
    return left.interpret() - right.interpret();
  }
}