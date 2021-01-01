
# Copyright 2021 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, cmake, python3, python3Packages, ros-environment }:
buildRosPackage {
  pname = "ros-foxy-mavlink";
  version = "2020.12.12-r1";

  src = fetchurl {
    url = "https://github.com/mavlink/mavlink-gbp-release/archive/release/foxy/mavlink/2020.12.12-1.tar.gz";
    name = "2020.12.12-1.tar.gz";
    sha256 = "9ead7c4821012db54bc936d98ce2e6b6cb749095b0e1489785102eb3085d3d7f";
  };

  buildType = "cmake";
  buildInputs = [ python3 python3Packages.future python3Packages.lxml ];
  nativeBuildInputs = [ ament-cmake cmake ros-environment ];

  meta = {
    description = ''MAVLink message marshaling library.
  This package provides C-headers and C++11 library
  for both 1.0 and 2.0 versions of protocol.

  For pymavlink use separate install via rosdep (python-pymavlink).'';
    license = with lib.licenses; [ lgpl2 ];
  };
}
