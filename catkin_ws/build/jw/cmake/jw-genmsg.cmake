# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "jw: 1 messages, 0 services")

set(MSG_I_FLAGS "-Ijw:/home/jw/catkin_ws/src/jw/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(jw_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/jw/catkin_ws/src/jw/msg/projectMsg.msg" NAME_WE)
add_custom_target(_jw_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "jw" "/home/jw/catkin_ws/src/jw/msg/projectMsg.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(jw
  "/home/jw/catkin_ws/src/jw/msg/projectMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/jw
)

### Generating Services

### Generating Module File
_generate_module_cpp(jw
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/jw
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(jw_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(jw_generate_messages jw_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jw/catkin_ws/src/jw/msg/projectMsg.msg" NAME_WE)
add_dependencies(jw_generate_messages_cpp _jw_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(jw_gencpp)
add_dependencies(jw_gencpp jw_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS jw_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(jw
  "/home/jw/catkin_ws/src/jw/msg/projectMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/jw
)

### Generating Services

### Generating Module File
_generate_module_eus(jw
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/jw
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(jw_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(jw_generate_messages jw_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jw/catkin_ws/src/jw/msg/projectMsg.msg" NAME_WE)
add_dependencies(jw_generate_messages_eus _jw_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(jw_geneus)
add_dependencies(jw_geneus jw_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS jw_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(jw
  "/home/jw/catkin_ws/src/jw/msg/projectMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/jw
)

### Generating Services

### Generating Module File
_generate_module_lisp(jw
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/jw
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(jw_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(jw_generate_messages jw_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jw/catkin_ws/src/jw/msg/projectMsg.msg" NAME_WE)
add_dependencies(jw_generate_messages_lisp _jw_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(jw_genlisp)
add_dependencies(jw_genlisp jw_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS jw_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(jw
  "/home/jw/catkin_ws/src/jw/msg/projectMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/jw
)

### Generating Services

### Generating Module File
_generate_module_nodejs(jw
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/jw
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(jw_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(jw_generate_messages jw_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jw/catkin_ws/src/jw/msg/projectMsg.msg" NAME_WE)
add_dependencies(jw_generate_messages_nodejs _jw_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(jw_gennodejs)
add_dependencies(jw_gennodejs jw_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS jw_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(jw
  "/home/jw/catkin_ws/src/jw/msg/projectMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/jw
)

### Generating Services

### Generating Module File
_generate_module_py(jw
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/jw
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(jw_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(jw_generate_messages jw_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jw/catkin_ws/src/jw/msg/projectMsg.msg" NAME_WE)
add_dependencies(jw_generate_messages_py _jw_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(jw_genpy)
add_dependencies(jw_genpy jw_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS jw_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/jw)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/jw
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(jw_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/jw)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/jw
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(jw_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/jw)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/jw
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(jw_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/jw)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/jw
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(jw_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/jw)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/jw\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/jw
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(jw_generate_messages_py std_msgs_generate_messages_py)
endif()
