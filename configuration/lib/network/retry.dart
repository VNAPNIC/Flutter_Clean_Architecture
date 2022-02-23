import 'dart:async';
import 'dart:math' as math;

final _rand = math.Random.secure();

class RetryOptions {
  /// Delay factor to double after every attempt.
  ///
  /// Defaults to 200 ms, which results in the following delays:
  ///
  ///  1. 400 ms
  ///  2. 800 ms
  ///  3. 1600 ms
  ///  4. 3200 ms
  ///  5. 6400 ms
  ///  6. 12800 ms
  ///  7. 25600 ms
  ///
  /// Before application of [randomizationFactor].
  final Duration delayFactor;

  /// Percentage the delay should be randomized, given as fraction between
  /// 0 and 1.
  ///
  /// If [randomizationFactor] is `0.25` (default) this indicates 25 % of the
  /// delay should be increased or decreased by 25 %.
  final double randomizationFactor;

  /// Maximum delay between retries, defaults to 30 seconds.
  final Duration maxDelay;

  /// Maximum number of attempts before giving up, defaults to 8.
  final int maxAttempts;

  ///  1. 400 ms +/- 25%
  ///  2. 800 ms +/- 25%
  ///  3. 1600 ms +/- 25%
  ///  4. 3200 ms +/- 25%
  ///  5. 6400 ms +/- 25%
  ///  6. 12800 ms +/- 25%
  ///  7. 25600 ms +/- 25%
  const RetryOptions({
    this.delayFactor = const Duration(milliseconds: 200),
    this.randomizationFactor = 0.25,
    this.maxDelay = const Duration(seconds: 30),
    this.maxAttempts = 8,
  });

  Duration delay(int attempt) {
    assert(attempt >= 0, 'attempt cannot be negative');
    if (attempt <= 0) {
      return Duration.zero;
    }
    final rf = (randomizationFactor * (_rand.nextDouble() * 2 - 1) + 1);
    final exp = math.min(attempt, 31); // prevent overflows.
    final delay = (delayFactor * math.pow(2.0, exp) * rf);
    return delay < maxDelay ? delay : maxDelay;
  }

  Future<T> retry<T>(
      FutureOr<T> Function() fn, {
        FutureOr<bool> Function(Exception)? retryIf,
        FutureOr<void> Function(Exception)? onRetry,
      }) async {
    var attempt = 0;
    // ignore: literal_only_boolean_expressions
    while (true) {
      attempt++; // first invocation is the first attempt
      try {
        return await fn();
      } on Exception catch (e) {
        if (attempt >= maxAttempts ||
            (retryIf != null && !(await retryIf(e)))) {
          rethrow;
        }
        if (onRetry != null) {
          await onRetry(e);
        }
      }

      // Sleep for a delay
      await Future.delayed(delay(attempt));
    }
  }
}

Future<T> retry<T>(
    FutureOr<T> Function() fn, {
      Duration delayFactor = const Duration(milliseconds: 200),
      double randomizationFactor = 0.25,
      Duration maxDelay = const Duration(seconds: 30),
      int maxAttempts = 8,
      FutureOr<bool> Function(Exception)? retryIf,
      FutureOr<void> Function(Exception)? onRetry,
    }) =>
    RetryOptions(
      delayFactor: delayFactor,
      randomizationFactor: randomizationFactor,
      maxDelay: maxDelay,
      maxAttempts: maxAttempts,
    ).retry(fn, retryIf: retryIf, onRetry: onRetry);