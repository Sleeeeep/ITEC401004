cmake_minimum_required(VERSION 2.8.3)
project(jw)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  std_msgs
  cv_bridge
  message_generation
)

add_message_files(
  FILES
  projectMsg.msg
)

generate_messages(
  DEPENDENCIES
  std_msgs
)

catkin_package(
  INCLUDE_DIRS include
  LIBRARIES jw
  CATKIN_DEPENDS roscpp std_msgs
  DEPENDS system_lib
)

include_directories(  ${catkin_INCLUDE_DIRS})

#add_executable()
#add_dependencies( jw_generate_messages_cpp)
#target_link_libraries( ${catkin_LIBRARIES})
add_executable(projectMove src/projectMove.cpp)
add_dependencies(projectMove jw_generate_messages_cpp)
target_link_libraries(projectMove ${catkin_LIBRARIES})

add_executable(projectCamera src/projectCamera.cpp)
add_dependencies(projectCamera jw_generate_messages_cpp)
target_link_libraries(projectCamera ${catkin_LIBRARIES} ${OpenCV_LIBRARIES})

add_executable(hw1 src/hw1.cpp)
add_dependencies(hw1 jw_generate_messages_cpp)
target_link_libraries(hw1 ${catkin_LIBRARIES})

add_executable(hw1_1 src/hw1_1.cpp)
add_dependencies(hw1_1 jw_generate_messages_cpp)
target_link_libraries(hw1_1 ${catkin_LIBRARIES} ${OpenCV_LIBRARIES})

