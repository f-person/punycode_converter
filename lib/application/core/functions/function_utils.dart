/// `constF0` is a function which always evaluates to `val`.
T Function() constF0<T>(T val) => () => val;
