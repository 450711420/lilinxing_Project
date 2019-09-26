# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "rosOpenCV: 1 messages, 0 services")

set(MSG_I_FLAGS "-IrosOpenCV:/home/lilinxing/catkin_ws/src/rosOpenCV/msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(rosOpenCV_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/lilinxing/catkin_ws/src/rosOpenCV/msg/RectMsg.msg" NAME_WE)
add_custom_target(_rosOpenCV_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rosOpenCV" "/home/lilinxing/catkin_ws/src/rosOpenCV/msg/RectMsg.msg" "std_msgs/Header"
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(rosOpenCV
  "/home/lilinxing/catkin_ws/src/rosOpenCV/msg/RectMsg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rosOpenCV
)

### Generating Services

### Generating Module File
_generate_module_cpp(rosOpenCV
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rosOpenCV
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(rosOpenCV_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(rosOpenCV_generate_messages rosOpenCV_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/lilinxing/catkin_ws/src/rosOpenCV/msg/RectMsg.msg" NAME_WE)
add_dependencies(rosOpenCV_generate_messages_cpp _rosOpenCV_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rosOpenCV_gencpp)
add_dependencies(rosOpenCV_gencpp rosOpenCV_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rosOpenCV_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(rosOpenCV
  "/home/lilinxing/catkin_ws/src/rosOpenCV/msg/RectMsg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rosOpenCV
)

### Generating Services

### Generating Module File
_generate_module_lisp(rosOpenCV
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rosOpenCV
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(rosOpenCV_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(rosOpenCV_generate_messages rosOpenCV_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/lilinxing/catkin_ws/src/rosOpenCV/msg/RectMsg.msg" NAME_WE)
add_dependencies(rosOpenCV_generate_messages_lisp _rosOpenCV_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rosOpenCV_genlisp)
add_dependencies(rosOpenCV_genlisp rosOpenCV_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rosOpenCV_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(rosOpenCV
  "/home/lilinxing/catkin_ws/src/rosOpenCV/msg/RectMsg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rosOpenCV
)

### Generating Services

### Generating Module File
_generate_module_py(rosOpenCV
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rosOpenCV
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(rosOpenCV_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(rosOpenCV_generate_messages rosOpenCV_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/lilinxing/catkin_ws/src/rosOpenCV/msg/RectMsg.msg" NAME_WE)
add_dependencies(rosOpenCV_generate_messages_py _rosOpenCV_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rosOpenCV_genpy)
add_dependencies(rosOpenCV_genpy rosOpenCV_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rosOpenCV_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rosOpenCV)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rosOpenCV
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(rosOpenCV_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rosOpenCV)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rosOpenCV
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(rosOpenCV_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rosOpenCV)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rosOpenCV\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rosOpenCV
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(rosOpenCV_generate_messages_py std_msgs_generate_messages_py)
endif()