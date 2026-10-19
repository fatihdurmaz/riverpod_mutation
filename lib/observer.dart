import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final class AppProviderObserver extends ProviderObserver {
  AppProviderObserver();

  final logger = Logger();

  String _providerName(ProviderObserverContext context) {
    final name = context.provider.name;
    return name == null || name.isEmpty
        ? context.provider.runtimeType.toString()
        : name;
  }

  @override
  void didAddProvider(ProviderObserverContext context, Object? value) {
    logger.d('[Riverpod][ADD] ${_providerName(context)} => $value');
  }

  @override
  void didUpdateProvider(
    ProviderObserverContext context,
    Object? previousValue,
    Object? newValue,
  ) {
    logger.d(
      '[Riverpod][UPDATE] ${_providerName(context)}: '
      '$previousValue -> $newValue',
    );
  }

  @override
  void didDisposeProvider(ProviderObserverContext context) {
    logger.d('[Riverpod][DISPOSE] ${_providerName(context)}');
  }

  @override
  void providerDidFail(
    ProviderObserverContext context,
    Object error,
    StackTrace stackTrace,
  ) {
    logger.e(
      '[Riverpod][ERROR] ${_providerName(context)}',
      error: error,
      stackTrace: stackTrace,
    );
  }
}
