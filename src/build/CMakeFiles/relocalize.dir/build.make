# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

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
CMAKE_SOURCE_DIR = /home/pold/Documents/cpp-sift/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/pold/Documents/cpp-sift/src/build

# Include any dependencies generated for this target.
include CMakeFiles/relocalize.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/relocalize.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/relocalize.dir/flags.make

CMakeFiles/relocalize.dir/relocalize.cpp.o: CMakeFiles/relocalize.dir/flags.make
CMakeFiles/relocalize.dir/relocalize.cpp.o: ../relocalize.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/pold/Documents/cpp-sift/src/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/relocalize.dir/relocalize.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/relocalize.dir/relocalize.cpp.o -c /home/pold/Documents/cpp-sift/src/relocalize.cpp

CMakeFiles/relocalize.dir/relocalize.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/relocalize.dir/relocalize.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/pold/Documents/cpp-sift/src/relocalize.cpp > CMakeFiles/relocalize.dir/relocalize.cpp.i

CMakeFiles/relocalize.dir/relocalize.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/relocalize.dir/relocalize.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/pold/Documents/cpp-sift/src/relocalize.cpp -o CMakeFiles/relocalize.dir/relocalize.cpp.s

CMakeFiles/relocalize.dir/relocalize.cpp.o.requires:
.PHONY : CMakeFiles/relocalize.dir/relocalize.cpp.o.requires

CMakeFiles/relocalize.dir/relocalize.cpp.o.provides: CMakeFiles/relocalize.dir/relocalize.cpp.o.requires
	$(MAKE) -f CMakeFiles/relocalize.dir/build.make CMakeFiles/relocalize.dir/relocalize.cpp.o.provides.build
.PHONY : CMakeFiles/relocalize.dir/relocalize.cpp.o.provides

CMakeFiles/relocalize.dir/relocalize.cpp.o.provides.build: CMakeFiles/relocalize.dir/relocalize.cpp.o

# Object files for target relocalize
relocalize_OBJECTS = \
"CMakeFiles/relocalize.dir/relocalize.cpp.o"

# External object files for target relocalize
relocalize_EXTERNAL_OBJECTS =

relocalize.so: CMakeFiles/relocalize.dir/relocalize.cpp.o
relocalize.so: CMakeFiles/relocalize.dir/build.make
relocalize.so: /usr/lib/i386-linux-gnu/libboost_python.so
relocalize.so: /usr/lib/i386-linux-gnu/libpython2.7.so
relocalize.so: /usr/local/lib/libopencv_core.so.3.0.0
relocalize.so: /usr/local/lib/libopencv_imgproc.so.3.0.0
relocalize.so: /usr/local/lib/libopencv_highgui.so.3.0.0
relocalize.so: /usr/local/lib/libopencv_calib3d.so.3.0.0
relocalize.so: /usr/local/lib/libopencv_videostab.so.3.0.0
relocalize.so: /usr/local/lib/libopencv_xfeatures2d.so.3.0.0
relocalize.so: /usr/local/lib/libopencv_features2d.so.3.0.0
relocalize.so: /usr/local/lib/libopencv_photo.so.3.0.0
relocalize.so: /usr/local/lib/libopencv_calib3d.so.3.0.0
relocalize.so: /usr/local/lib/libopencv_features2d.so.3.0.0
relocalize.so: /usr/local/lib/libopencv_highgui.so.3.0.0
relocalize.so: /usr/local/lib/libopencv_flann.so.3.0.0
relocalize.so: /usr/local/lib/libopencv_ml.so.3.0.0
relocalize.so: /usr/local/lib/libopencv_videoio.so.3.0.0
relocalize.so: /usr/local/lib/libopencv_imgcodecs.so.3.0.0
relocalize.so: /usr/local/lib/libopencv_shape.so.3.0.0
relocalize.so: /usr/local/lib/libopencv_video.so.3.0.0
relocalize.so: /usr/local/lib/libopencv_imgproc.so.3.0.0
relocalize.so: /usr/local/lib/libopencv_core.so.3.0.0
relocalize.so: /usr/local/lib/libopencv_hal.a
relocalize.so: CMakeFiles/relocalize.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX shared module relocalize.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/relocalize.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/relocalize.dir/build: relocalize.so
.PHONY : CMakeFiles/relocalize.dir/build

CMakeFiles/relocalize.dir/requires: CMakeFiles/relocalize.dir/relocalize.cpp.o.requires
.PHONY : CMakeFiles/relocalize.dir/requires

CMakeFiles/relocalize.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/relocalize.dir/cmake_clean.cmake
.PHONY : CMakeFiles/relocalize.dir/clean

CMakeFiles/relocalize.dir/depend:
	cd /home/pold/Documents/cpp-sift/src/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pold/Documents/cpp-sift/src /home/pold/Documents/cpp-sift/src /home/pold/Documents/cpp-sift/src/build /home/pold/Documents/cpp-sift/src/build /home/pold/Documents/cpp-sift/src/build/CMakeFiles/relocalize.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/relocalize.dir/depend
