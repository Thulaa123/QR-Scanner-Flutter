

import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../generated/lib/base/core/events.g.dart';

@Riverpod(keepAlive: true)
Events events(EventsRef ref) => Events();

class Events {
}
