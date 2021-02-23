project (${OS_NAME}_libc LANGUAGES C ASM)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(TARGET_NAME k)
set(TARGET_ARCH_NAME i386)

set(TARGET_DIR ${CMAKE_CURRENT_SOURCE_DIR}/${TAGET_NAME}/kernel)
set(ARCH_DIR ${CMAKE_CURRENT_SOURCE_DIR}/arch/${TARGET_ARCH_NAME})
set(INCLUDE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/include)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS}-ffreestanding -Wall -Wextra")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -D__is_libk")

set(HEADERS
    ${INCLUDE_DIR}/stdio.h
    ${INCLUDE_DIR}/stdlib.h
    ${INCLUDE_DIR}/string.h

    ${INCLUDE_DIR}/sys/cdefs.h
)
set(SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/stdio/printf.c
    ${CMAKE_CURRENT_SOURCE_DIR}/stdio/putchar.c

    ${CMAKE_CURRENT_SOURCE_DIR}/stdio/puts.c

    ${CMAKE_CURRENT_SOURCE_DIR}/string/memcmp.c
    ${CMAKE_CURRENT_SOURCE_DIR}/string/memcpy.c
    ${CMAKE_CURRENT_SOURCE_DIR}/string/memmove.c
    ${CMAKE_CURRENT_SOURCE_DIR}/string/memset.c
    ${CMAKE_CURRENT_SOURCE_DIR}/string/strlen.c
)

add_library(${TARGET_NAME} ${HEADERS} ${SOURCES})

target_include_directories(${TARGET_NAME} PUBLIC ${INCLUDE_DIR})

