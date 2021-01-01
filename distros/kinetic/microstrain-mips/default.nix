
# Copyright 2021 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cmake-modules, diagnostic-aggregator, diagnostic-updater, geometry-msgs, message-generation, message-runtime, nav-msgs, roscpp, roslint, sensor-msgs, std-msgs, std-srvs, tf2, tf2-ros }:
buildRosPackage {
  pname = "ros-kinetic-microstrain-mips";
  version = "0.0.3-r1";

  src = fetchurl {
    url = "https://github.com/ros-drivers-gbp/microstrain_mips-release/archive/release/kinetic/microstrain_mips/0.0.3-1.tar.gz";
    name = "0.0.3-1.tar.gz";
    sha256 = "d6c4c251c76eaef3097568610e88debec4dd7805ba9dd49358c677abcc7d80ab";
  };

  buildType = "catkin";
  buildInputs = [ message-generation roslint ];
  propagatedBuildInputs = [ cmake-modules diagnostic-aggregator diagnostic-updater geometry-msgs message-runtime nav-msgs roscpp sensor-msgs std-msgs std-srvs tf2 tf2-ros ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The microstrain_mips package provides a driver for the LORD/Microstrain 3DM_GX5_XX GPS-aided IMU sensor.'';
    license = with lib.licenses; [ gpl1 ];
  };
}
