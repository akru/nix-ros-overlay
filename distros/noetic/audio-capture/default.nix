
# Copyright 2021 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, audio-common-msgs, catkin, gst_all_1, roscpp }:
buildRosPackage {
  pname = "ros-noetic-audio-capture";
  version = "0.3.9-r1";

  src = fetchurl {
    url = "https://github.com/ros-gbp/audio_common-release/archive/release/noetic/audio_capture/0.3.9-1.tar.gz";
    name = "0.3.9-1.tar.gz";
    sha256 = "47b4b6e36927059198adb20ac821b42891b98713c6b8cc9abd622b4ce5cee10e";
  };

  buildType = "catkin";
  propagatedBuildInputs = [ audio-common-msgs gst_all_1.gst-plugins-base gst_all_1.gst-plugins-good gst_all_1.gst-plugins-ugly gst_all_1.gstreamer roscpp ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Transports audio from a source to a destination. Audio sources can come
      from a microphone or file. The destination can play the audio or save it
      to an mp3 file.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
