/// Produces instances for a given registration
abstract class InstanceProducer<TService> {
  TService create();
}
