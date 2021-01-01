
# Copyright 2021 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, dynamic-reconfigure, mbf-abstract-nav, mbf-mesh-core, mesh-map, pluginlib, roscpp }:
buildRosPackage {
  pname = "ros-noetic-mbf-mesh-nav";
  version = "1.0.0-r1";

  src = fetchurl {
    url = "https://github.com/uos-gbp/mesh_navigation-release/archive/release/noetic/mbf_mesh_nav/1.0.0-1.tar.gz";
    name = "1.0.0-1.tar.gz";
    sha256 = "bf3f02873b9114b7fbff328a3c37e54865d3bfeac77fb2939528e109b2f89c65";
  };

  buildType = "catkin";
  propagatedBuildInputs = [ dynamic-reconfigure mbf-abstract-nav mbf-mesh-core mesh-map pluginlib roscpp ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The mbf_mesh_nav package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
