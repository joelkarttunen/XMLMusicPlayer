#include <QtGui/QGuiApplication>
#include "qtquick2applicationviewer.h"
#include "playlist.h"
#include <QQmlContext>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QtQuick2ApplicationViewer viewer;
    Playlist* playlist = new Playlist();

    viewer.setMainQmlFile(QStringLiteral("qml/XMLMusicPlayer/main.qml"));

    viewer.rootContext()->setContextProperty("playlistCreator", playlist);
    viewer.showExpanded();



    return app.exec();
}
