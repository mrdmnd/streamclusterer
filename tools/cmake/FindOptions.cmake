macro(append var string)
    set(${var} "${${var}} ${string}")
endmacro(append)

set(SANITIZE_FLAGS "")
if (BUILD_SANITIZE)
    set(SANITIZE_FLAGS "-fsanitize=address -fno-omit-frame-pointer")
    if (CMAKE_COMPILER_IS_GNUCC)
        # Ubuntu bug for GCC 5.0+ (safe for all versions)
        append(CMAKE_EXE_LINKER_FLAGS "-fuse-ld=gold")
        append(CMAKE_SHARED_LINKER_FLAGS "-fuse-ld=gold")
    endif ()
endif ()

set(OPT_FLAGS "-march=native")

if (FORCE_AVX) # some compilers like clang do not automagically define __AVX3__ and __BMI2__ even when the hardware supports it
    set(OPT_FLAGS "${OPT_FLAGS} -mavx2 -mbmi2")
endif ()

set(STD_FLAGS "-std=c11 -fPIC")
set(CXXSTD_FLAGS "-std=c++11 -fPIC")

set(WARNING_FLAGS "-Wall -Winline -Wshadow -Wextra -pedantic")

set(CMAKE_C_FLAGS_DEBUG "-ggdb")
set(CMAKE_C_FLAGS_RELEASE "-O3")
set(CMAKE_C_FLAGS "${STD_FLAGS} ${OPT_FLAGS} ${INCLUDE_FLAGS} ${WARNING_FLAGS} ${SANITIZE_FLAGS} ")

set(CMAKE_CXX_FLAGS_DEBUG "-ggdb")
set(CMAKE_CXX_FLAGS_RELEASE "-O3")
set(CMAKE_CXX_FLAGS "${CXXSTD_FLAGS} ${OPT_FLAGS} ${INCLUDE_FLAGS} ${WARNING_FLAGS} ${SANITIZE_FLAGS} ")