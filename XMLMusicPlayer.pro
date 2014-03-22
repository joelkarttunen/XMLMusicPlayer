# Add more folders to ship with the application, here
folder_01.source = qml/XMLMusicPlayer
folder_01.target = qml
DEPLOYMENTFOLDERS = folder_01

# Additional import path used to resolve QML modules in Creator's code model
QML_IMPORT_PATH =

# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp \
<<<<<<< HEAD
    playlist.cpp
=======
    playlist.cpp \
    track.cpp
>>>>>>> 81648989aec5e138e4fc3d554d3de6db82227d19


# Installation path
# target.path =

# Please do not modify the following two lines. Required for deployment.
include(qtquick2applicationviewer/qtquick2applicationviewer.pri)
qtcAddDeployment()

OTHER_FILES +=

HEADERS += \
<<<<<<< HEAD
    playlist.h
=======
    playlist.h \
    track.h
>>>>>>> 81648989aec5e138e4fc3d554d3de6db82227d19


