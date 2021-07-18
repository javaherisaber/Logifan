extension ObjectExtensions<T> on T {
  R let<R>(R Function(T it) op) => op(this);

  T also(void Function(T it) block) {
    block(this);
    return this;
  }
}
