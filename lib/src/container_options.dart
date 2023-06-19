/// Configuration options for the [Container].
/// The following example shows the typical usage of the [ContainerOptions] class.
/// ```
/// var container = Container();
///
/// container.registerSimple<ITimeProvider>(() => DefaultTimeProvider() );
///
/// // Use of ContainerOptions class here.
/// container.options.allowOverridingRegistrations = true;
///
/// // Replaces the previous registration of ITimeProvider
/// container.registerSimple<ITimeProvider>(() => CustomTimeProvider());
/// ```
class ContainerOptions {
  /// A value indicating whether the container allows overriding registrations.
  /// Default `false`.
  final bool allowOverridingRegistrations;

  bool get notAllowOverridingRegistrations => !allowOverridingRegistrations;

  const ContainerOptions({this.allowOverridingRegistrations = false});
}
