# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/jw/catkin_ws/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/jw/catkin_ws/build

# Include any dependencies generated for this target.
include jw/CMakeFiles/hw1.dir/depend.make

# Include the progress variables for this target.
include jw/CMakeFiles/hw1.dir/progress.make

# Include the compile flags for this target's objects.
include jw/CMakeFiles/hw1.dir/flags.make

jw/CMakeFiles/hw1.dir/src/hw1.cpp.o: jw/CMakeFiles/hw1.dir/flags.make
jw/CMakeFiles/hw1.dir/src/hw1.cpp.o: /home/jw/catkin_ws/src/jw/src/hw1.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jw/catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object jw/CMakeFiles/hw1.dir/src/hw1.cpp.o"
	cd /home/jw/catkin_ws/build/jw && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/hw1.dir/src/hw1.cpp.o -c /home/jw/catkin_ws/src/jw/src/hw1.cpp

jw/CMakeFiles/hw1.dir/src/hw1.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/hw1.dir/src/hw1.cpp.i"
	cd /home/jw/catkin_ws/build/jw && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/jw/catkin_ws/src/jw/src/hw1.cpp > CMakeFiles/hw1.dir/src/hw1.cpp.i

jw/CMakeFiles/hw1.dir/src/hw1.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/hw1.dir/src/hw1.cpp.s"
	cd /home/jw/catkin_ws/build/jw && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/jw/catkin_ws/src/jw/src/hw1.cpp -o CMakeFiles/hw1.dir/src/hw1.cpp.s

jw/CMakeFiles/hw1.dir/src/hw1.cpp.o.requires:

.PHONY : jw/CMakeFiles/hw1.dir/src/hw1.cpp.o.requires

jw/CMakeFiles/hw1.dir/src/hw1.cpp.o.provides: jw/CMakeFiles/hw1.dir/src/hw1.cpp.o.requires
	$(MAKE) -f jw/CMakeFiles/hw1.dir/build.make jw/CMakeFiles/hw1.dir/src/hw1.cpp.o.provides.build
.PHONY : jw/CMakeFiles/hw1.dir/src/hw1.cpp.o.provides

jw/CMakeFiles/hw1.dir/src/hw1.cpp.o.provides.build: jw/CMakeFiles/hw1.dir/src/hw1.cpp.o


# Object files for target hw1
hw1_OBJECTS = \
"CMakeFiles/hw1.dir/src/hw1.cpp.o"

# External object files for target hw1
hw1_EXTERNAL_OBJECTS =

/home/jw/catkin_ws/devel/lib/jw/hw1: jw/CMakeFiles/hw1.dir/src/hw1.cpp.o
/home/jw/catkin_ws/devel/lib/jw/hw1: jw/CMakeFiles/hw1.dir/build.make
/home/jw/catkin_ws/devel/lib/jw/hw1: /opt/ros/kinetic/lib/libroscpp.so
/home/jw/catkin_ws/devel/lib/jw/hw1: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
/home/jw/catkin_ws/devel/lib/jw/hw1: /usr/lib/x86_64-linux-gnu/libboost_signals.so
/home/jw/catkin_ws/devel/lib/jw/hw1: /opt/ros/kinetic/lib/libxmlrpcpp.so
/home/jw/catkin_ws/devel/lib/jw/hw1: /opt/ros/kinetic/lib/libcv_bridge.so
/home/jw/catkin_ws/devel/lib/jw/hw1: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_core3.so.3.3.1
/home/jw/catkin_ws/devel/lib/jw/hw1: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_imgproc3.so.3.3.1
/home/jw/catkin_ws/devel/lib/jw/hw1: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_imgcodecs3.so.3.3.1
/home/jw/catkin_ws/devel/lib/jw/hw1: /opt/ros/kinetic/lib/librosconsole.so
/home/jw/catkin_ws/devel/lib/jw/hw1: /opt/ros/kinetic/lib/librosconsole_log4cxx.so
/home/jw/catkin_ws/devel/lib/jw/hw1: /opt/ros/kinetic/lib/librosconsole_backend_interface.so
/home/jw/catkin_ws/devel/lib/jw/hw1: /usr/lib/x86_64-linux-gnu/liblog4cxx.so
/home/jw/catkin_ws/devel/lib/jw/hw1: /usr/lib/x86_64-linux-gnu/libboost_regex.so
/home/jw/catkin_ws/devel/lib/jw/hw1: /opt/ros/kinetic/lib/libroscpp_serialization.so
/home/jw/catkin_ws/devel/lib/jw/hw1: /opt/ros/kinetic/lib/librostime.so
/home/jw/catkin_ws/devel/lib/jw/hw1: /opt/ros/kinetic/lib/libcpp_common.so
/home/jw/catkin_ws/devel/lib/jw/hw1: /usr/lib/x86_64-linux-gnu/libboost_system.so
/home/jw/catkin_ws/devel/lib/jw/hw1: /usr/lib/x86_64-linux-gnu/libboost_thread.so
/home/jw/catkin_ws/devel/lib/jw/hw1: /usr/lib/x86_64-linux-gnu/libboost_chrono.so
/home/jw/catkin_ws/devel/lib/jw/hw1: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
/home/jw/catkin_ws/devel/lib/jw/hw1: /usr/lib/x86_64-linux-gnu/libboost_atomic.so
/home/jw/catkin_ws/devel/lib/jw/hw1: /usr/lib/x86_64-linux-gnu/libpthread.so
/home/jw/catkin_ws/devel/lib/jw/hw1: /usr/lib/x86_64-linux-gnu/libconsole_bridge.so
/home/jw/catkin_ws/devel/lib/jw/hw1: jw/CMakeFiles/hw1.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/jw/catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable /home/jw/catkin_ws/devel/lib/jw/hw1"
	cd /home/jw/catkin_ws/build/jw && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/hw1.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
jw/CMakeFiles/hw1.dir/build: /home/jw/catkin_ws/devel/lib/jw/hw1

.PHONY : jw/CMakeFiles/hw1.dir/build

jw/CMakeFiles/hw1.dir/requires: jw/CMakeFiles/hw1.dir/src/hw1.cpp.o.requires

.PHONY : jw/CMakeFiles/hw1.dir/requires

jw/CMakeFiles/hw1.dir/clean:
	cd /home/jw/catkin_ws/build/jw && $(CMAKE_COMMAND) -P CMakeFiles/hw1.dir/cmake_clean.cmake
.PHONY : jw/CMakeFiles/hw1.dir/clean

jw/CMakeFiles/hw1.dir/depend:
	cd /home/jw/catkin_ws/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/jw/catkin_ws/src /home/jw/catkin_ws/src/jw /home/jw/catkin_ws/build /home/jw/catkin_ws/build/jw /home/jw/catkin_ws/build/jw/CMakeFiles/hw1.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : jw/CMakeFiles/hw1.dir/depend

