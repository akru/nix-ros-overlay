
# Copyright 2021 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-cmake-gtest, ament-index-cpp, ament-lint-auto, ament-lint-common, behaviortree-cpp-v3, geometry-msgs, lifecycle-msgs, plansys2-domain-expert, plansys2-msgs, plansys2-pddl-parser, plansys2-planner, plansys2-problem-expert, popf, rclcpp, rclcpp-action, rclcpp-cascade-lifecycle, rclcpp-lifecycle, test-msgs }:
buildRosPackage {
  pname = "ros-foxy-plansys2-executor";
  version = "1.0.5-r1";

  src = fetchurl {
    url = "https://github.com/IntelligentRoboticsLabs/ros2_planning_system-release/archive/release/foxy/plansys2_executor/1.0.5-1.tar.gz";
    name = "1.0.5-1.tar.gz";
    sha256 = "97a6863376e2c19adbd6aa2525e17591522c124e47588328a1bbed1f43701444";
  };

  buildType = "ament_cmake";
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common geometry-msgs test-msgs ];
  propagatedBuildInputs = [ ament-index-cpp behaviortree-cpp-v3 lifecycle-msgs plansys2-domain-expert plansys2-msgs plansys2-pddl-parser plansys2-planner plansys2-problem-expert popf rclcpp rclcpp-action rclcpp-cascade-lifecycle rclcpp-lifecycle ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''This package contains the Executor module for the ROS2 Planning System'';
    license = with lib.licenses; [ asl20 ];
  };
}
