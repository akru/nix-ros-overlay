# Top level package set
self:
# Distro package set
rosSelf: rosSuper: with rosSelf.lib; {
  cv-bridge = patchBoostPython rosSuper.cv-bridge;

  gazebo = self.gazebo_11;

  libphidget22 = patchVendorUrl rosSuper.libphidget22 {
    url = "https://www.phidgets.com/downloads/phidget22/libraries/linux/libphidget22/libphidget22-1.6.20200417.tar.gz";
    sha256 = "17xfc07bgllqr808jm779z98gwz01iik9skw2hcwpgg4j7kdxn5d";
  };

  pcl-ros = rosSuper.pcl-ros.overrideAttrs ({
    patches ? [], ...
  }: {
    patches = patches ++ [
      # Fix build with PCL >=1.11
      (self.fetchpatch {
        url = "https://github.com/ros-perception/perception_pcl/commit/e812d3cf1b67cc73841b41e690d53c74e5077a05.patch";
        sha256 = "0savdifw90ql34zh6rff53hx3cy6rlmrwqzw80fsihkirls84b3w";
        stripLen = 1;
      })
    ];
  });

  rosfmt = patchVendorUrl rosSuper.rosfmt {
    url = "https://github.com/fmtlib/fmt/releases/download/6.0.0/fmt-6.0.0.zip";
    sha256 = "0h148anbaqgch6n69pxsvs1c9wmykgd052wmzgdia7qpz8w6p8dl";
  };
}
