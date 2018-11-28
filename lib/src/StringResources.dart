class StringResources {
  static String typeIsAmbiguous(Type serviceType) =>
      //TODO string.Format(CultureInfo.InvariantCulture,
      "You are trying to register $serviceType as a service type, but registering this type is not " +
      "allowed to be registered because the type is ambiguous. The registration of such a type " +
      "almost always indicates a flaw in the design of the application and is therefore not " +
      "allowed. Please change any component that depends on a dependency of this type. Ensure " +
      "that the container does not have to inject any dependencies of this type by injecting a " +
      "different type.";

  static String propertyCanNotBeChangedAfterTheFirstRegistration(
          String propertyName) =>
      "The $propertyName property cannot be changed after the first registration has " +
      "been made to the container.";

  static String theSuppliedRegistrationBelongsToADifferentContainer() =>
      "The supplied Registration belongs to a different container.";
}
