#ifndef TRACK_H
#define TRACK_H

#include <QObject>

class track : public QObject
{
    Q_OBJECT
public:
    explicit track(QObject *parent = 0);
    QString title() const;
    void setTitle(const QString &title);
    QString artist() const;
    void setArtist(const QString &artist);
    QString album() const;
    void setAlbum(const QString &album);
private:

    QString m_title;
    QString m_artist;
    QString m_album;
signals:

public slots:

};

#endif // TRACK_H
