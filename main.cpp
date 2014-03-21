#include <QtGui/QGuiApplication>
#include "qtquick2applicationviewer.h"
#include <QtMultimedia>


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QtQuick2ApplicationViewer viewer;
    viewer.setMainQmlFile(QStringLiteral("qml/XMLMusicPlayer/main.qml"));
    viewer.showExpanded();



    return app.exec();
}
