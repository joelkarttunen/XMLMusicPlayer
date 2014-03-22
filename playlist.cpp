#include "playlist.h"
#include <QDebug>
#include <QFileInfo>
#include <QtMultimedia/QMediaPlayer>
#include <QtMultimedia/QMediaMetaData>
Playlist::Playlist(QObject *parent) :
    QObject(parent)
{

}

void Playlist::createPlaylist( QString filepath)
{
    QStringList sl = filepath.split("file:///");

    QDir directory;
    directory.setPath(sl.at(1));
    if(directory.exists())
    {
        qDebug() << "Löytyy";

    }


    QFile file(QDir::currentPath() + "/qml/XMLMusicPlayer/lista.xml");

    QXmlStreamWriter writer(&file);
    if(file.open(QIODevice::WriteOnly))
    {
    QMediaPlayer player;
    writer.setAutoFormatting(true);
    writer.writeStartDocument();
    writer.writeStartElement("lista");

    qDebug() << directory.path();
    QStringList trackList = listFiles(directory);

    foreach(QString f, trackList)
    {
        player.setMedia(QMediaContent(QUrl(f)));

        writer.writeStartElement("track");
        qDebug() << "File path: " << f;



        qDebug() << "Opening file: " << player.metaData(QMediaMetaData::Title) << " - " << player.metaData("2").toString();
        writer.writeTextElement("title", player.metaData("0").toString());
        writer.writeTextElement("artist", player.metaData("2").toString() );
        writer.writeTextElement("path", f);

        writer.writeEndElement();
    }

    writer.writeEndElement();



    }

}

QStringList Playlist::listFiles(QDir dir)
{
    QStringList trackList;
    QString s = "mp3";
    QDir m_dir(dir);

    QFileInfoList list = m_dir.entryInfoList(QDir::Files | QDir::Dirs | QDir::NoDotAndDotDot);


    foreach(QFileInfo finfo, list) {

                    if (finfo.isDir()) {
                           trackList.append(listFiles(QDir(finfo.absoluteFilePath())));
                    }

                    if(s == finfo.suffix())
                    {

                        trackList.append(finfo.absoluteFilePath());
                    }



            }

    return trackList;
}
