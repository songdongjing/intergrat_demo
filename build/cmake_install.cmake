# Install script for directory: /home/ubuntu/autoware/intergrat_demo/src

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/ubuntu/autoware/intergrat_demo/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "RelWithDebInfo")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
        file(MAKE_DIRECTORY "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
      endif()
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin")
        file(WRITE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin" "")
      endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/ubuntu/autoware/intergrat_demo/install/_setup_util.py")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/ubuntu/autoware/intergrat_demo/install" TYPE PROGRAM FILES "/home/ubuntu/autoware/intergrat_demo/build/catkin_generated/installspace/_setup_util.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/ubuntu/autoware/intergrat_demo/install/env.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/ubuntu/autoware/intergrat_demo/install" TYPE PROGRAM FILES "/home/ubuntu/autoware/intergrat_demo/build/catkin_generated/installspace/env.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/ubuntu/autoware/intergrat_demo/install/setup.bash;/home/ubuntu/autoware/intergrat_demo/install/local_setup.bash")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/ubuntu/autoware/intergrat_demo/install" TYPE FILE FILES
    "/home/ubuntu/autoware/intergrat_demo/build/catkin_generated/installspace/setup.bash"
    "/home/ubuntu/autoware/intergrat_demo/build/catkin_generated/installspace/local_setup.bash"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/ubuntu/autoware/intergrat_demo/install/setup.sh;/home/ubuntu/autoware/intergrat_demo/install/local_setup.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/ubuntu/autoware/intergrat_demo/install" TYPE FILE FILES
    "/home/ubuntu/autoware/intergrat_demo/build/catkin_generated/installspace/setup.sh"
    "/home/ubuntu/autoware/intergrat_demo/build/catkin_generated/installspace/local_setup.sh"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/ubuntu/autoware/intergrat_demo/install/setup.zsh;/home/ubuntu/autoware/intergrat_demo/install/local_setup.zsh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/ubuntu/autoware/intergrat_demo/install" TYPE FILE FILES
    "/home/ubuntu/autoware/intergrat_demo/build/catkin_generated/installspace/setup.zsh"
    "/home/ubuntu/autoware/intergrat_demo/build/catkin_generated/installspace/local_setup.zsh"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/ubuntu/autoware/intergrat_demo/install/.rosinstall")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/ubuntu/autoware/intergrat_demo/install" TYPE FILE FILES "/home/ubuntu/autoware/intergrat_demo/build/catkin_generated/installspace/.rosinstall")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/ubuntu/autoware/intergrat_demo/build/gtest/cmake_install.cmake")
  include("/home/ubuntu/autoware/intergrat_demo/build/nav/cmake_install.cmake")
  include("/home/ubuntu/autoware/intergrat_demo/build/navigation-melodic/navigation/cmake_install.cmake")
  include("/home/ubuntu/autoware/intergrat_demo/build/slam_gmapping/cmake_install.cmake")
  include("/home/ubuntu/autoware/intergrat_demo/build/key_contral/cmake_install.cmake")
  include("/home/ubuntu/autoware/intergrat_demo/build/navigation-melodic/map_server/cmake_install.cmake")
  include("/home/ubuntu/autoware/intergrat_demo/build/IMU_DRIVER/imu_ah100b/cmake_install.cmake")
  include("/home/ubuntu/autoware/intergrat_demo/build/qfrtk_t3/cmake_install.cmake")
  include("/home/ubuntu/autoware/intergrat_demo/build/rslidar_sdk/cmake_install.cmake")
  include("/home/ubuntu/autoware/intergrat_demo/build/autolabor_pro1_driver/cmake_install.cmake")
  include("/home/ubuntu/autoware/intergrat_demo/build/gmapping/cmake_install.cmake")
  include("/home/ubuntu/autoware/intergrat_demo/build/navigation-melodic/amcl/cmake_install.cmake")
  include("/home/ubuntu/autoware/intergrat_demo/build/navigation-melodic/fake_localization/cmake_install.cmake")
  include("/home/ubuntu/autoware/intergrat_demo/build/pointcloud_to_laserscan/cmake_install.cmake")
  include("/home/ubuntu/autoware/intergrat_demo/build/navigation-melodic/voxel_grid/cmake_install.cmake")
  include("/home/ubuntu/autoware/intergrat_demo/build/navigation-melodic/costmap_2d/cmake_install.cmake")
  include("/home/ubuntu/autoware/intergrat_demo/build/navigation-melodic/nav_core/cmake_install.cmake")
  include("/home/ubuntu/autoware/intergrat_demo/build/navigation-melodic/base_local_planner/cmake_install.cmake")
  include("/home/ubuntu/autoware/intergrat_demo/build/navigation-melodic/carrot_planner/cmake_install.cmake")
  include("/home/ubuntu/autoware/intergrat_demo/build/navigation-melodic/clear_costmap_recovery/cmake_install.cmake")
  include("/home/ubuntu/autoware/intergrat_demo/build/navigation-melodic/dwa_local_planner/cmake_install.cmake")
  include("/home/ubuntu/autoware/intergrat_demo/build/navigation-melodic/move_slow_and_clear/cmake_install.cmake")
  include("/home/ubuntu/autoware/intergrat_demo/build/navigation-melodic/navfn/cmake_install.cmake")
  include("/home/ubuntu/autoware/intergrat_demo/build/navigation-melodic/global_planner/cmake_install.cmake")
  include("/home/ubuntu/autoware/intergrat_demo/build/navigation-melodic/rotate_recovery/cmake_install.cmake")
  include("/home/ubuntu/autoware/intergrat_demo/build/navigation-melodic/move_base/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/ubuntu/autoware/intergrat_demo/build/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
