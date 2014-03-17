import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
import QtQuick.XmlListModel 2.0
import QtMultimedia 5.0


Rectangle {

    width: 800
    height: 600


    ToolBar
    {
        id:toolBar
        RowLayout
        {
            width:parent.width;

            ToolButton{
                id:btnPlay
                iconSource: "play.png"
                onClicked:player.play();
            }
            ToolButton{
                id:btnPause
                iconSource: "pause.png"
                 onClicked:player.pause()
            }
            ToolButton{
                id:btnPrevious
                iconSource: "previous.png"
            }
            ToolButton{
                id:btnNext
                iconSource: "next.png"
            }
            Slider{
                id:sliderVolume;
                Layout.fillWidth: true

            }



        }
    }
    TableView {
       id:penisTable

       anchors { top:toolBar.bottom; right:lastfmArea.left; bottom:statusBar.top;left: parent.left}

       model: penisModel

       TableViewColumn{ role: "id"  ; title: "ID" ; width: 100 }

       TableViewColumn{ role: "artist"  ; title: "Artist" ; width: 100 }
       TableViewColumn{ role: "title" ; title: "Title" ; width: 200 }

       TableViewColumn{ role: "path"  ; title: "Path" ; width: 100 }

        onClicked:
        {
            player.source = penisModel.get(penisTable.currentRow).path
        }

    }

    Rectangle
    {
        id:lastfmArea
        width:20
        anchors {  right:parent.right; bottom:statusBar.top; top:toolBar.bottom}

        Rectangle
        {
            id:lastfmExpander
            anchors { left:parent.left; bottom:parent.bottom; top:parent.top; right:lastfmView.left }
            width:20

            Rectangle
            {
                anchors.fill: parent
                color:"grey"
            }
            Text
            {
                id:arrowText
                text: "<<"
            }

            MouseArea
            {
                anchors.fill: parent

                //Tee  toimimaan stateilla
                onClicked:
                           { if(lastfmArea.width==20)
                             {
                                lastfmArea.width = 250
                                arrowText.text = ">>"
                             }
                             else
                             {
                                lastfmArea.width = 20
                                arrowText.text = "<<"
                           }
                            }


            }


        }

        ListView
        {
            id: lastfmView
            model:lastfmModel
            anchors {left: lastfmExpander.right; right:parent.right; top:parent.top; bottom: parent.bottom}
            width: parent.width - lastfmExpander.width - penisTable.width
            delegate: lastfmDelegate





        }
    }
        Component{
                id:lastfmDelegate



                Item {

                         id:lastfmInfo
                         width:parent.width
                         anchors { top: parent.top; bottom: parent.bottom }


                         Text {
                                 text:"Times played: " + timesPlayed
                                 font.pointSize: 20
                              }




                        }


    }

    XmlListModel {
        id: penisModel
        source: "lista.xml"
        query: "/lista/song"

        XmlRole { name: "id"; query: "id/string()"}
        XmlRole { name: "artist"; query: "artist/string()"}
        XmlRole { name: "title"; query: "title/string()"}
        XmlRole { name: "path"; query: "path/string()" }
    }

    XmlListModel {
        id: lastfmModel

        source: "http://ws.audioscrobbler.com/2.0/?method=track.getInfo&api_key=08209a57cb2d3a9c389028797cc109c8&username=kindjall&artist="+penisModel.get(penisTable.currentRow).artist + "&track=" +penisModel.get(penisTable.currentRow).title

        query: "/lfm/track"

        XmlRole { name: "timesPlayed"; query:"userplaycount/string()"}

    }

    MediaPlayer {
           id: player
           source: penisModel.get(penisTable.currentRow).path;
           volume: sliderVolume.value



    }

    StatusBar
    {
        id:statusBar
        anchors {  left:parent.left; right:parent.right; bottom:parent.bottom }
        height:20

        Text
        {
            text: player.error
        }
    }


}



