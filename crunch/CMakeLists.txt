set(CRUNCH_SOURCES
    crunch.cpp
    corpus_gen.cpp
    corpus_test.cpp
)

add_executable(crunch
    ${CRUNCH_SOURCES}
)

target_link_libraries(crunch
    crnlib
)

target_include_directories(crunch
    PUBLIC
        ${CRUNCH_INCLUDE_DIRS}
)
