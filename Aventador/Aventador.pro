# lanbery
QT += qml quick \
    opengl \

#    concurrent \
#    3dcore 3drender 3dinput \
#    3dextras \
#    3dquick 3dquickrender 3dquickinput 3dquickextras \

#    network

CONFIG += c++11 \
    qml_debug \
#    resources_big


# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += main.cpp \
#    cpp/networkcontroller.cpp \

RESOURCES += qml.qrc \
    res.qrc \
#    Planets/planets.qrc \
#    Planets/planets-res.qrc
    canvas3d/nbs-planets.qrc \
    canvas3d/nbs-planets-res.qrc


# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

#Set Icon
RC_ICONS = logo.ico
# OS icon
ICON = nbs.icns

DISTFILES += \
    images/logo.png \

include(../../SortFilterProxyModel/SortFilterProxyModel.pri)

HEADERS += \
#    cpp/networkcontroller.h \

OTHER_FILES += UI/*.qml \
            UI/PageViews/*.qml \
            UI/AddFile/*.qml \
            canvas3d/*.qml \
            canvas3d/controls/*.qml \
            canvas3d/planet.js \
            canvas3d/images/*

#win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../libs/QtCanvas3D/ -lqtcanvas3d
#else:win32:CONFIG(debug|release): LIBS += -L$$PWD/../../libs/QtCanvas3D/ -lqtcanvas3dd
#else:unix: LIBS += -L$$PWD/../../libs/QtCanvas3D/ -lqtcanvas3d

#INCLUDEPATH += $$PWD/../../libs/QtCanvas3D
#DEPENDPATH += $$PWD/../../libs/QtCanvas3D

