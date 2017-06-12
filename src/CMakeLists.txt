set(STREAMGEO_SRC
  hello.c
)

add_executable(streamclusterer ${STREAMGEO_SRC})
set_target_properties(streamclusterer PROPERTIES RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin")

