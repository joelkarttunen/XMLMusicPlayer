#ifndef TRACK_H
#define TRACK_H

#include <QObject>

class track : public QObject
{
    Q_OBJECT
public:
    explicit track(QObject *parent = 0);
    QString tittle() const;
    void setName(const QString &tittle);
    QString artist() const;
    void setName(const QString &artist);
    QString album() const;
    void setName(const QString &album);
private:

    QString m_tittle;
    QString m_artist;
    QString m_album;
signals:

public slots:

};

#endif // TRACK_H
