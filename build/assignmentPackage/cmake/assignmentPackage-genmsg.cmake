# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "assignmentPackage: 1 messages, 1 services")

set(MSG_I_FLAGS "-IassignmentPackage:/root/assignmentWs/src/assignmentPackage/msg;-Iactionlib_msgs:/opt/ros/noetic/share/actionlib_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(assignmentPackage_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/root/assignmentWs/src/assignmentPackage/msg/my_msg.msg" NAME_WE)
add_custom_target(_assignmentPackage_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "assignmentPackage" "/root/assignmentWs/src/assignmentPackage/msg/my_msg.msg" ""
)

get_filename_component(_filename "/root/assignmentWs/src/assignmentPackage/srv/my_service.srv" NAME_WE)
add_custom_target(_assignmentPackage_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "assignmentPackage" "/root/assignmentWs/src/assignmentPackage/srv/my_service.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(assignmentPackage
  "/root/assignmentWs/src/assignmentPackage/msg/my_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/assignmentPackage
)

### Generating Services
_generate_srv_cpp(assignmentPackage
  "/root/assignmentWs/src/assignmentPackage/srv/my_service.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/assignmentPackage
)

### Generating Module File
_generate_module_cpp(assignmentPackage
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/assignmentPackage
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(assignmentPackage_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(assignmentPackage_generate_messages assignmentPackage_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/root/assignmentWs/src/assignmentPackage/msg/my_msg.msg" NAME_WE)
add_dependencies(assignmentPackage_generate_messages_cpp _assignmentPackage_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/assignmentWs/src/assignmentPackage/srv/my_service.srv" NAME_WE)
add_dependencies(assignmentPackage_generate_messages_cpp _assignmentPackage_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(assignmentPackage_gencpp)
add_dependencies(assignmentPackage_gencpp assignmentPackage_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS assignmentPackage_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(assignmentPackage
  "/root/assignmentWs/src/assignmentPackage/msg/my_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/assignmentPackage
)

### Generating Services
_generate_srv_eus(assignmentPackage
  "/root/assignmentWs/src/assignmentPackage/srv/my_service.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/assignmentPackage
)

### Generating Module File
_generate_module_eus(assignmentPackage
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/assignmentPackage
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(assignmentPackage_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(assignmentPackage_generate_messages assignmentPackage_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/root/assignmentWs/src/assignmentPackage/msg/my_msg.msg" NAME_WE)
add_dependencies(assignmentPackage_generate_messages_eus _assignmentPackage_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/assignmentWs/src/assignmentPackage/srv/my_service.srv" NAME_WE)
add_dependencies(assignmentPackage_generate_messages_eus _assignmentPackage_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(assignmentPackage_geneus)
add_dependencies(assignmentPackage_geneus assignmentPackage_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS assignmentPackage_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(assignmentPackage
  "/root/assignmentWs/src/assignmentPackage/msg/my_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/assignmentPackage
)

### Generating Services
_generate_srv_lisp(assignmentPackage
  "/root/assignmentWs/src/assignmentPackage/srv/my_service.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/assignmentPackage
)

### Generating Module File
_generate_module_lisp(assignmentPackage
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/assignmentPackage
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(assignmentPackage_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(assignmentPackage_generate_messages assignmentPackage_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/root/assignmentWs/src/assignmentPackage/msg/my_msg.msg" NAME_WE)
add_dependencies(assignmentPackage_generate_messages_lisp _assignmentPackage_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/assignmentWs/src/assignmentPackage/srv/my_service.srv" NAME_WE)
add_dependencies(assignmentPackage_generate_messages_lisp _assignmentPackage_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(assignmentPackage_genlisp)
add_dependencies(assignmentPackage_genlisp assignmentPackage_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS assignmentPackage_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(assignmentPackage
  "/root/assignmentWs/src/assignmentPackage/msg/my_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/assignmentPackage
)

### Generating Services
_generate_srv_nodejs(assignmentPackage
  "/root/assignmentWs/src/assignmentPackage/srv/my_service.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/assignmentPackage
)

### Generating Module File
_generate_module_nodejs(assignmentPackage
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/assignmentPackage
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(assignmentPackage_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(assignmentPackage_generate_messages assignmentPackage_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/root/assignmentWs/src/assignmentPackage/msg/my_msg.msg" NAME_WE)
add_dependencies(assignmentPackage_generate_messages_nodejs _assignmentPackage_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/assignmentWs/src/assignmentPackage/srv/my_service.srv" NAME_WE)
add_dependencies(assignmentPackage_generate_messages_nodejs _assignmentPackage_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(assignmentPackage_gennodejs)
add_dependencies(assignmentPackage_gennodejs assignmentPackage_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS assignmentPackage_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(assignmentPackage
  "/root/assignmentWs/src/assignmentPackage/msg/my_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/assignmentPackage
)

### Generating Services
_generate_srv_py(assignmentPackage
  "/root/assignmentWs/src/assignmentPackage/srv/my_service.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/assignmentPackage
)

### Generating Module File
_generate_module_py(assignmentPackage
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/assignmentPackage
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(assignmentPackage_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(assignmentPackage_generate_messages assignmentPackage_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/root/assignmentWs/src/assignmentPackage/msg/my_msg.msg" NAME_WE)
add_dependencies(assignmentPackage_generate_messages_py _assignmentPackage_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/assignmentWs/src/assignmentPackage/srv/my_service.srv" NAME_WE)
add_dependencies(assignmentPackage_generate_messages_py _assignmentPackage_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(assignmentPackage_genpy)
add_dependencies(assignmentPackage_genpy assignmentPackage_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS assignmentPackage_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/assignmentPackage)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/assignmentPackage
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_cpp)
  add_dependencies(assignmentPackage_generate_messages_cpp actionlib_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(assignmentPackage_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/assignmentPackage)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/assignmentPackage
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_eus)
  add_dependencies(assignmentPackage_generate_messages_eus actionlib_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(assignmentPackage_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/assignmentPackage)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/assignmentPackage
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_lisp)
  add_dependencies(assignmentPackage_generate_messages_lisp actionlib_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(assignmentPackage_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/assignmentPackage)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/assignmentPackage
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_nodejs)
  add_dependencies(assignmentPackage_generate_messages_nodejs actionlib_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(assignmentPackage_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/assignmentPackage)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/assignmentPackage\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/assignmentPackage
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_py)
  add_dependencies(assignmentPackage_generate_messages_py actionlib_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(assignmentPackage_generate_messages_py geometry_msgs_generate_messages_py)
endif()
