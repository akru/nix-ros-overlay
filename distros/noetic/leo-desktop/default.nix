
# Copyright 2020 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, leo, leo-viz }:
buildRosPackage {
  pname = "ros-noetic-leo-desktop";
  version = "0.2.2-r1";

  src = fetchurl {
    url = "https://github.com/fictionlab-gbp/leo_desktop-release/archive/release/noetic/leo_desktop/0.2.2-1.tar.gz";
    name = "0.2.2-1.tar.gz";
    sha256 = "77226b00005b341f4bd38cae6d56eb42c7f5413e3e70d04121067478d1ce18ee";
  };

  buildType = "catkin";
  propagatedBuildInputs = [ leo leo-viz ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Metapackage of software for operating Leo Rover from ROS desktop'';
    license = with lib.licenses; [ mit ];
  };
}
