// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:macrobenchmarks/common.dart';

import 'util.dart';

void main() {
  macroPerfTestE2E(
    'animated_complex_image_filtered_perf',
    kAnimatedComplexImageFilteredPerfRouteName,
    pageDelay: const Duration(seconds: 1),
    duration: const Duration(seconds: 10),
  );
}
