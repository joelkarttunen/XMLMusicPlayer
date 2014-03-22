#include "track.h"

track::track(QObject *parent) :
    QObject(parent)
{

}
QString track::title() const
{
    return m_title;
}
void track::setTitle(const QString &title)
{
    m_title = title;
}


QString track::artist() const
{
    return m_artist;
}
void track::setArtist(const QString &artist)
{
    m_artist = artist;
}


QString track::album() const
{
    return m_album;
}
void track::setAlbum(const QString &album)
{
    m_album = album;
}


