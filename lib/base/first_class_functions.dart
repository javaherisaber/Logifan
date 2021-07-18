/// When there is no functionality for a given action eg. noOp
void doNothing() => () {};

/// Use this when you just want to track which places to implement later
@Deprecated('Implement your own code here')
void notImplemented() => () {
      print('Not implemented functionality');
    };

/// Uses this when you want to inform yourself about important functionality to be implemented
@Deprecated('Implement your own code here')
void shouldImplement() => () {
      throw Exception('This should be implemented');
    };

/// Run your operation with Kotlin run equivalent
T run<T>(T Function() operation) => operation();