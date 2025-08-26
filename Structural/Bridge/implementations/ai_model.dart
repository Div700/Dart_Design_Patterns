/* This is the implementor (low level) class of the Bridge pattern.
 */
abstract class AIModel {
  Future<String> generateResponse(String prompt);
}
