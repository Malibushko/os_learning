project (${OS_NAME}_kernel LANGUAGES C ASM)

set(TARGET_NAME kernel)

set(TARGET_DIR ${CMAKE_CURRENT_SOURCE_DIR}/${TAGET_NAME}/kernel)
set(ARCH_DIR ${CMAKE_CURRENT_SOURCE_DIR}/arch/${TARGET_ARCH_NAME})
set(INCLUDE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/include)

set(CMAKE_C_FLAGS "-ffreestanding -Wall -Wextra")
set(CMAKE_CXX_FLAGS "-m32 -ffreestanding -fno-rtti -fno-exceptions -nostdlib -fno-stack-protector")
set(CMAKE_C_FLAGS "-m32 -ffreestanding -fno-exceptions -nostdlib -fno-stack-protector")
set(CMAKE_EXE_LINKER_FLAGS "-m elf_i386 -T${CMAKE_CURRENT_SOURCE_DIR}/linker.ld")
set(CMAKE_ASM_NASM_OBJECT_FORMAT "elf")

set(HEADERS
    ${INCLUDE_DIR}/${TARGET_NAME}/tty.h

    ${ARCH_DIR}/vga.h
)
set(CRT_SOURCES
    ${ARCH_DIR}/boot.S
    ${ARCH_DIR}/crti.S
    ${ARCH_DIR}/crtn.S
)

set(SOURCES
    ${ARCH_DIR}/tty.c

    ${TARGET_DIR}/kernel.c
)

add_library(${TARGET_NAME} STATIC ${HEADERS} ${CRT_SOURCES} ${SOURCES})
target_include_directories(${TARGET_NAME} PUBLIC ${INCLUDE_DIR})
target_link_libraries(${TARGET_NAME} PUBLIC -lk -lgcc)

