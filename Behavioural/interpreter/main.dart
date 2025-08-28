import 'expressions/add_expression.dart';
import 'expressions/multiply_expression.dart';
import 'expressions/number_expression.dart';
import 'expressions/subtract_expression.dart';
import 'interfaces/expression.dart';

void main() {
  // Create expression: (5 + 3) * 2 - 4
  print('Creating expression: (5 + 3) * 2 - 4');
  Expression expression = Subtract(
    Multiply(
      Add(Number(5), Number(3)), // 5 + 3 = 8
      Number(2), // 8 * 2 = 16
    ),
    Number(4), // 16 - 4 = 12
  );

  int result = expression.interpret();
  print('Result: $result'); // Output: Result: 12

  // Create another expression: 10 - 3 + 2
  print('Creating expression: 10 - 3 + 2');
  Expression expression2 = Add(
    Subtract(Number(10), Number(3)), // 10 - 3 = 7
    Number(2), // 7 + 2 = 9
  );

  int result2 = expression2.interpret();
  print('Result: $result2'); // Output: Result: 9

  // Simple expression: 6 * 4
  print('Creating expression: 6 * 4');
  Expression expression3 = Multiply(Number(6), Number(4));
  int result3 = expression3.interpret();
  print('Result: $result3'); // Output: Result: 24
}
