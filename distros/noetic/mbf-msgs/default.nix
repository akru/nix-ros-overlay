
# Copyright 2020 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib-msgs, catkin, genmsg, geometry-msgs, message-generation, message-runtime, nav-msgs, std-msgs }:
buildRosPackage {
  pname = "ros-noetic-mbf-msgs";
  version = "0.3.3-r1";

  src = fetchurl {
    url = "https://github.com/uos-gbp/move_base_flex-release/archive/release/noetic/mbf_msgs/0.3.3-1.tar.gz";
    name = "0.3.3-1.tar.gz";
    sha256 = "2bc7138f1a804d6087793eefbf0c4da55880bb2e19f7958f531afb718e54a41a";
  };

  buildType = "catkin";
  buildInputs = [ genmsg message-generation ];
  propagatedBuildInputs = [ actionlib-msgs geometry-msgs message-runtime nav-msgs std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The move_base_flex messages package providing the action definition files for the action GetPath, ExePath, Recovery and MoveBase. The action servers providing these action are implemented in <a href="http://wiki.ros.org/mbf_abstract_nav">mbf_abstract_nav</a>.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
