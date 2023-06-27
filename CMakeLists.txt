cmake_minimum_required(VERSION 3.16)

project(DAG_Canvas VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 COMPONENTS Quick QuickControls2 REQUIRED)
#find_package(QT NAMES Qt6 COMPONENTS Core Gui QuickControls2 Widgets REQUIRED)
#find_package(Qt${QT_VERSION_MAJOR} COMPONENTS Core Gui QuickControls2 Widgets REQUIRED)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
include_directories( ${Qt6Quick_INCLUDE_DIRS} )
include_directories( ${CMAKE_CURRENT_SOURCE_DIR} "../../src" )

include_directories( ${Qt6Quick_INCLUDE_DIRS} )


message("Qt6Quick_INCLUDE_DIRS:${Qt6Quick_INCLUDE_DIRS}  --------")

qt_add_executable(appDAG_Canvas
    main.cpp
)

qt_add_qml_module(appDAG_Canvas
    URI DAG_Canvas
    VERSION 1.0
    QML_FILES main.qml 
)

set_target_properties(appDAG_Canvas PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appDAG_Canvas
    PRIVATE Qt6::Quick Qt6::QuickControls2)

install(TARGETS appDAG_Canvas
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
