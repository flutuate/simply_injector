part of 'Container.dart';

mixin Container_Common {
  //@protected
  bool get isLocked => false; //TODO must be protected

  //@protected
  bool get hasRegistrations => false; //TODO must be protected

  @protected
  void throwWhenContainerIsLockedOrDisposed() {
    //TODO
  }
}
