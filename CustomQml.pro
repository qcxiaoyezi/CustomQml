TEMPLATE = app

QT += qml quick widgets

SOURCES += main.cpp \
    cursor.cpp

RESOURCES += \
    qmlResource.qrc \
    imageResource.qrc

RC_FILE = appicon.rc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

OTHER_FILES +=

HEADERS += \
    cursor.h


