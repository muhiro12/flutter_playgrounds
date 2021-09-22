// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:flutter_playgrounds/presentation/model/bottom_tab_item.dart';

final bottomTabProvider = StateProvider((_) => BottomTabItem.home);
