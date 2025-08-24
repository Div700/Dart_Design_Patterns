enum GameState {
  stopped('stopped'),
  running('running');

  final String value;

  const GameState(this.value);
}
