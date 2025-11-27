# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/home/nuno-casaleiro/esp/esp-idf/components/bootloader/subproject"
  "/home/nuno-casaleiro/Documents/NunoPersonal/Caldeira/Boiler-Monitor/build/bootloader"
  "/home/nuno-casaleiro/Documents/NunoPersonal/Caldeira/Boiler-Monitor/build/bootloader-prefix"
  "/home/nuno-casaleiro/Documents/NunoPersonal/Caldeira/Boiler-Monitor/build/bootloader-prefix/tmp"
  "/home/nuno-casaleiro/Documents/NunoPersonal/Caldeira/Boiler-Monitor/build/bootloader-prefix/src/bootloader-stamp"
  "/home/nuno-casaleiro/Documents/NunoPersonal/Caldeira/Boiler-Monitor/build/bootloader-prefix/src"
  "/home/nuno-casaleiro/Documents/NunoPersonal/Caldeira/Boiler-Monitor/build/bootloader-prefix/src/bootloader-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/home/nuno-casaleiro/Documents/NunoPersonal/Caldeira/Boiler-Monitor/build/bootloader-prefix/src/bootloader-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/home/nuno-casaleiro/Documents/NunoPersonal/Caldeira/Boiler-Monitor/build/bootloader-prefix/src/bootloader-stamp${cfgdir}") # cfgdir has leading slash
endif()
