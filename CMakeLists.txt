set(CMAKE_TOOLCHAIN_FILE ${CMAKE_SOURCE_DIR}/toolchain.cmake)
set(CMAKE_C_COMPILER_WORKS 1)
cmake_minimum_required(VERSION 3.14)

project (yos LANGUAGES C ASM)

set(OS_NAME yos)
set(BUILD_IMAGE ON)

set(DEFAULT_HOST i686-unknown-elf)
set(TARGET_ARCH_NAME i386)

add_subdirectory(libc)
add_subdirectory(kernel)

if (${BUILD_IMAGE})
    message("Building ${OS_NAME}.img image...")
    add_custom_command(OUTPUT ${OS_NAME}.img
        COMMAND ${CMAKE_LINKER} -m elf_${TARGET_ARCH_NAME} -T ${CMAKE_SOURCE_DIR}/kernel/linker.ld -o ${CMAKE_BINARY_DIR}/${OS_NAME}.img
                                                              ${CMAKE_BINARY_DIR}/kernel/libkernel.a ${CMAKE_BINARY_DIR}/libc/libk.a)
    add_custom_target(run ALL DEPENDS ${OS_NAME}.img)

endif()
