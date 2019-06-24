part of 'Container.dart';

/// Common methods used by [Container]s.
mixin Container_Common {
  bool get isLocked => false; //TODO

  bool get hasRegistrations => false; //TODO

  @protected
  void throwWhenContainerIsLockedOrDisposed() {
    //TODO
  }
}
