#ifndef PLAYLIST_H
#define PLAYLIST_H

#include <QObject>
#include <QDir>
#include <QXmlStreamWriter>
#include <QFile>

#include <QtMultimedia/QMediaPlayer>

class Playlist : public QObject
{
    Q_OBJECT


public:
    explicit Playlist(QObject *parent = 0);
    Q_INVOKABLE void createPlaylist( QString filepath);

signals:

public slots:

private:
    QStringList listFiles(QDir dir);
};

#endif // PLAYLIST_H
