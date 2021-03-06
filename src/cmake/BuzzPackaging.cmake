#
# Project name
#
project(buzz)

#
# General CPack configuration
#
# Version information
if(NOT DEFINED CPACK_PACKAGE_VERSION_MAJOR)
  execute_process(
    COMMAND git describe --abbrev=0
    COMMAND cut -d. -f1
    COMMAND tr -d '\n'
    OUTPUT_VARIABLE CPACK_PACKAGE_VERSION_MAJOR)
endif(NOT DEFINED CPACK_PACKAGE_VERSION_MAJOR)
if(NOT DEFINED CPACK_PACKAGE_VERSION_MINOR)
  execute_process(
    COMMAND git describe --abbrev=0
    COMMAND cut -d. -f2
    COMMAND tr -d '\n'
    OUTPUT_VARIABLE CPACK_PACKAGE_VERSION_MINOR)
endif(NOT DEFINED CPACK_PACKAGE_VERSION_MINOR)
if(NOT DEFINED CPACK_PACKAGE_VERSION_PATCH)
  execute_process(
    COMMAND git describe --abbrev=0
    COMMAND cut -d. -f3
    COMMAND cut -d- -f1
    COMMAND tr -d '\n'
    OUTPUT_VARIABLE CPACK_PACKAGE_VERSION_PATCH)
endif(NOT DEFINED CPACK_PACKAGE_VERSION_PATCH)
if(NOT DEFINED CPACK_PACKAGE_RELEASE)
execute_process(
  COMMAND git describe --abbrev=0
  COMMAND cut -d- -f2
  COMMAND tr -d '\n'
  OUTPUT_VARIABLE CPACK_PACKAGE_RELEASE)
endif(NOT DEFINED CPACK_PACKAGE_RELEASE)
# Other stuff
set(CPACK_PACKAGE_DESCRIPTION "Buzz (programming language)
 Buzz is a programming language specifically designed for swarm robotics systems.")
set(CPACK_PACKAGE_HOMEPAGE "http://github.com/MISTLab/Buzz/")
set(CPACK_PACKAGE_MAINTAINER "Carlo Pinciroli <ilpincy@gmail.com>")
set(CPACK_PACKAGE_NAME "buzz")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "Programming language for robot swarms")
set(CPACK_PACKAGE_VERSION "${CPACK_PACKAGE_VERSION_MAJOR}.${CPACK_PACKAGE_VERSION_MINOR}.${CPACK_PACKAGE_VERSION_PATCH}")
set(CPACK_PACKAGING_INSTALL_PREFIX ${CMAKE_INSTALL_PREFIX})
set(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_SOURCE_DIR}/../LICENSE.txt")
set(CPACK_RESOURCE_FILE_README "${CMAKE_SOURCE_DIR}/../README.md")
set(CPACK_STRIP_FILES ON)
set(CPACK_PACKAGE_FILE_NAME "${CPACK_PACKAGE_NAME}-${CPACK_PACKAGE_VERSION}-${BUZZ_PROCESSOR_ARCH}-${CPACK_PACKAGE_RELEASE}")

#
# Configuration for the Debian generator
#
set(CPACK_DEBIAN_PACKAGE_DEPENDS "gcc (>= 4.3), g++ (>= 4.3), cmake (>= 2.8.3)")
set(CPACK_DEBIAN_PACKAGE_DESCRIPTION ${CPACK_PACKAGE_DESCRIPTION})
set(CPACK_DEBIAN_PACKAGE_HOMEPAGE ${CPACK_PACKAGE_HOMEPAGE})
set(CPACK_DEBIAN_PACKAGE_MAINTAINER ${CPACK_PACKAGE_MAINTAINER})
set(CPACK_DEBIAN_PACKAGE_SECTION "contrib/science")
#set(CPACK_DEBIAN_PACKAGE_CONTROL_EXTRA "${CMAKE_BINARY_DIR}/postinst;")

#
# Configuration for the RPM generator
#
set(CPACK_RPM_PACKAGE_DESCRIPTION ${CPACK_PACKAGE_DESCRIPTION})
set(CPACK_RPM_PACKAGE_URL ${CPACK_PACKAGE_HOMEPAGE})
set(CPACK_RPM_PACKAGE_GROUP "Development/Tools")
set(CPACK_RPM_PACKAGE_LICENSE "MIT")
set(CPACK_RPM_PACKAGE_REQUIRES "gcc >= 4.3, gcc-c++ >= 4.3, cmake >= 2.8.3")
set(CPACK_RPM_PACKAGE_URL ${CPACK_PACKAGE_HOMEPAGE})
set(CPACK_RPM_PACKAGE_RELEASE ${CPACK_PACKAGE_RELEASE})
#set(CPACK_RPM_POST_INSTALL_SCRIPT_FILE "${CMAKE_BINARY_DIR}/buzz_post_install.sh")

#
# Time to call CPack
#
include(CPack)
