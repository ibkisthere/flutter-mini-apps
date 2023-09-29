import 'package:hooks_riverpod/hooks_riverpod.dart';

Duration duration = const Duration();

final timer = StreamProvider.autoDispose(
    (ref) => Stream.periodic(Duration(seconds: 1), (_) => addTimer(ref)));

final addSeconds = StateProvider((ref) => 1);

void addTimer(ref) {
  final seconds = ref.watch(addSeconds.notifier).state + duration.inSeconds;
  duration = Duration(seconds: seconds);
}

