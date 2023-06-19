/// Produces instances for a given registration.
abstract interface class InstanceProducer<TService> {
  TService create();
}
