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
    width                                       : 400*dp;
    height                                      : 450*dp;
    anchors.verticalCenter                      : parent.verticalCenter;
    property color  fontColor                   : foregroundColor;
    property alias  planet                      : planetText.planet;  // 名称 name
    property alias  hash58                      : infoText.hash58;    //
    property alias  nickName                    : infoText.nickName;
    property alias  locations                   : infoText.locations; //位置
    property alias  storageSize                 : infoText.storageSize; //
    property alias  descriptions                : infoText.descriptions; //sys
    property alias  onlineNums                  : infoText.onlineNums;  //在线节点数
    property alias  gcperiod                    : infoText.gcperiod;  //回收周期




    Behavior on opacity {
        PropertyAnimation {}
    }

    Text {
        id: planetText
        anchors.top: parent.top
        anchors.topMargin: 20
        anchors.horizontalCenter: parent.horizontalCenter

        property string planet: ""

        font.family: "Helvetica"
        font.pixelSize: 32
        font.weight: Font.Light
        color: "white"

        text: "<p>" + planet + "</p>"
    }

    Text {
        id: infoText
        anchors.top: planetText.bottom
        anchors.horizontalCenter: parent.horizontalCenter

        property string storageSize: ""
        property string locations: ""
        property string onlineNums: ""
        property string hash58 : ""
        property string nickName : ""
        property string descriptions: "";
        property string gcperiod: ""

        font.family: "Helvetica"
        font.pixelSize: 18
        font.weight: Font.Light
        lineHeight: 1.625 * 18
        lineHeightMode: Text.FixedHeight
        color: "white"

        text: {
            if (planet == "NBS Chain") {
                "<p>" + descriptions + "</p>"
            } else if (planet == "Core") {
                "<h1><font color=\"blue\">NBS Chain Core Network</font></h1></br>"
                + "<p>总容量: " + storageSize + "</p></br>"
                + "<p>节点数量: " + onlineNums + "</p>"
                + "<p>" + descriptions + "</p>"
            } else {
                "<p>HASH :</p>" + hash58 + "</p></br>"
                + "<p>容量 :" + storageSize + "</p></br>"
                + "<p>位置 :" + locations + "</p></br>"
                + "<p>回收周期: " + gcperiod + "</p></br>"
                + "<p>" + descriptions + "</p>"
            }
        }

        onLinkActivated: Qt.openUrlExternally(link)
    }

}
