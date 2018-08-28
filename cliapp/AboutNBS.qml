import QtQuick 2.2
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

Page {
    header          : NavigationBar {
        title           : qsTr("关于")
    }

    contentItem     : Flickable {
        clip            : true
        contentWidth    : width
        contentHeight   : item.height

        //top distance 20
        Item    {
            id          : item
            width       : parent.width
            height      : childrenRect.height

            Column      {
                id          : layout
                width       : parent.width
                spacing     : 20

                //top distance 20
                Item    {
                    width   : 20;
                    height  : 20;
                }

                Image   {
                    anchors.horizontalCenter    : parent.horizontalCenter
                    source                      : "qrc:/logo.png"
                    fillMode                    : Image.PreserveAspectFit
                    height                      : 40
                    width                       : 40
                }

                Label   {
                    anchors.horizontalCenter    : parent.horizontalCenter
                    font.pixelSize              : 15
                    text                        : qsTr("NBS 客户端")
                }

                //Current Version
                Label   {
                    anchors.horizontalCenter    : parent.horizontalCenter
                    font.pixelSize              : 15
                    text                        : qsTr("当前版本：1.0.0α")
                }

                //
                Item    {
                    width   : 20;
                    height  : 20;
                }

                Row     {
                    Rectangle   {
                        width   : 20;
                        height  : 20;
                    }
                    Label       {
                        anchors.leftMargin  : 20
                        font.pixelSize      : 20
                        text                : qsTr("NBS Chian")
                    }
                }
            }
        }

    }

    Component.onCompleted       : {
        height = parent.height - 1;
        height = parent.height
    }

}
