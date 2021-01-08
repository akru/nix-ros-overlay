
# Copyright 2021 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-lint-auto, ament-lint-common, glfw3 }:
buildRosPackage {
  pname = "ros-foxy-embree-vendor";
  version = "0.0.5-r1";

  src = fetchurl {
    url = "https://github.com/OUXT-Polaris/embree_vendor-release/archive/release/foxy/embree_vendor/0.0.5-1.tar.gz";
    name = "0.0.5-1.tar.gz";
    sha256 = "4039450f7d25d23c6157cbaadd38a706ff59d633d56d9dabe32658e862cd109c";
  };

  buildType = "ament_cmake";
  checkInputs = [ ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ glfw3 ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''vendor packages for intel raytracing kernel library'';
    license = with lib.licenses; [ asl20 ];
  };
}
