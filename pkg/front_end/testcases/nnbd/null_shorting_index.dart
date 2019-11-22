// Copyright (c) 2019, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

class Class1 {
  int operator [](int index) => index;
  void operator []=(int index, int value) {}
}

class Class2 {
  int field;
}

extension Extension on Class2 {
  int operator [](int index) => field;
  void operator []=(int index, int value) {
    field = value;
  }
}

main() {
  Class1? c1;
  c1?.[0];
  c1?.[0] = 1;
  c1?.[0] = 1 + c1[0];
  c1?.[0] += 1;
  c1?.[0] += 1 + c1[0];
  // TODO(johnniwinther): ++ should probably not be null-shorted, awaiting spec
  //  update.
  ++c1?.[0];
  c1?.[0]++;
  c1?.[0] ??= 1;
  c1?.[0] ??= 1 + c1[1];

  Class2? c2;
  c2?.[0];
  c2?.[0] = 1;
  c2?.[0] = 1 + c2[0];
  c2?.[0] += 1;
  c2?.[0] += 1 + c2[0];
  // TODO(johnniwinther): ++ should probably not be null-shorted, awaiting spec
  //  update.
  ++c2?.[0];
  c2?.[0]++;
  c2?.[0] ??= 1;
  c2?.[0] ??= 1 + c2[1];

  Extension(c2)?.[0];
  Extension(c2)?.[0] = 1;
  Extension(c2)?.[0] = 1 + Extension(c2)[0];
  Extension(c2)?.[0] += 1;
  Extension(c2)?.[0] += 1 + Extension(c2)[0];
  // TODO(johnniwinther): ++ should probably not be null-shorted, awaiting spec
  //  update.
  ++Extension(c2)?.[0];
  Extension(c2)?.[0]++;
  Extension(c2)?.[0] ??= 1;
  Extension(c2)?.[0] ??= 1 + Extension(c2)[1];
}