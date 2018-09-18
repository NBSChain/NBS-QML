import QtQuick 2.0
import QtQuick.Layouts 1.3
/**
 * @file    InfoSheet.qml
 * @version 1.0
 * @brief   信息展示面板
 * @date    2018-09-18
 * @author  lanbery
 * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
 */
Item {
    id                                          : root;
    width                                       : 200*dp;
    height                                      : 450*dp;
    anchors.verticalCenter                      : parent.verticalCenter;
    property color  fontColor                   : foregroundColor;
    property alias  planet                      : planetText.planet;
    property alias  coreInfo                    : infoText.coreInfo;
    property alias  hash58                      : infoText.hash58;
    property alias  nickName                    : infoText.nickName;
    property alias  locations                   : infoText.locations;
    property alias  storageSize                 : infoText.storageSize;
    property alias  descriptions                : infoText.descriptions;
    property alias  onlineNums                  : infoText.objectName;



    Behavior on opacity {
        PropertyAnimation {}
    }

    ColumnLayout {
        anchors.fill                            : parent;
        spacing                                 : 10*dp;
        Text {
            property string     planet          : "";
            id                                  : planetText;
            Layout.fillWidth                    : true;
            Layout.topMargin                    : 20*dp;
            color                               : fontColor;

            font {
                family                          : aweFont.name;
                weight                          : Font.Light;
            }
            text                                : qsTr("<p>"+planet+"</p>");

        }

        Text {
            id                                  : infoText;
            Layout.fillWidth                    : true;
            Layout.fillHeight                   : true;
            property string     coreInfo        : "";
            property string     hash58          : "";
            property string     locations       : "unknow";
            property string     storageSize     : "";
            property string     nickName        : "";//
            property string     descriptions    : "";
            property string     onlineNums      : "";

            text    : {
                if(planet == "NBS Chain"){
                    "<p>NBS NET SYSTEM NODES :</p></br><p>"+onlineNums+"</p></br>"
                    + "<p>" + descriptions +"</p>";
                }else if(planet == "Sun"){
                    "<p>Node PeerID:</p><p>"+hash58+"</p></br>"
                    + "<p>NBS Core:</p><p>"+coreInfo+"</p></br>"
                    + "<p>Locations:</p><p>"+locations+"</p></br>"
                    + "<p>NBS Nodes :</p><p>"+onlineNums+"</p></br>";
                }else {
                    "<p>Node PeerID:</p><p>"+hash58+"</p></br>"
                    + "<p>name:  </p><p>"+nickName+"</p></br>"
                    + "<p>NBS Core:</p><p>"+coreInfo+"</p></br>"
                    + "<p>Locations:</p><p>"+locations+"</p></br>";
                }
            }

            onLinkActivated: Qt.openUrlExternally(link);
        }
    }

}
