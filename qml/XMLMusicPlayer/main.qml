import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
Rectangle {
    width: 800
    height: 600


    ToolBar
    {
        RowLayout
        {
            width:parent.width;



            ToolButton{
                id:btnPlay
                iconSource: "play.png"
            }

            ToolButton{
                id:btnPause
                iconSource: "pause.png"
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
                Layout.fillWidth: true;
            }


        }
    }




}
