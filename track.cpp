#include "track.h"

track::track(QObject *parent) :
    QObject(parent)
{

}
QString track::tittle() const
{
    return m_tittle;
}
void track::setTittle(const QString &tittle)
{
    m_tittle = tittle;
}


QString track::artist() const
{
    return artist;
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


