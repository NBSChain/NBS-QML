import QtQuick 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import QtGraphicalEffects 1.0

/**
 * @file    NodeInFoDelegate.qml
 * @version 1.0
 * @brief   摘要
 *
 * @date    2018-09-12
 * @author  lanbery
 * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
 */
ItemDelegate {
    property color      bgColor                     : settings.silingBarBgColor;
    property color      normalbgColor               : settings.silingBarBgColor;
    property color      forceFontColor              : settings.itemBtnForceFontColor;
    property color      hoveredBGColor              : settings.hoveredBgColorGray;

    property var        materialColor               : [
        "Red","Pink","Purple","DeepPurple","Indigo","Blue","LightBlue","Cyan","Teal","Green",
        "LightGreen","Lime","Yellow","Amber","Orange","DeepOrange","Brown","Grey","BlueGrey"
    ];

    function randomColor (){
        var colorName = materialColor[Math.floor(Math.random()*materialColor.length)];
        return Qt.darker(Material.color(Material[colorName]),1.1);
    }

    Material.elevation                              : 1;
    Material.background                             : Qt.lighter(settings.neroHeleneColor);

    id                                              : delegate;
    text                                            : model.hash58;

    width                                           : parent ? parent.width : 0;
    leftPadding                                     : 10*dp;
    rightPadding                                    : 0*dp;

    contentItem : RowLayout {
        spacing                                     : 5*dp;

        Rectangle {
            id                                      : initialCircle;
            height                                  : delegate.height;
            width                                   : height;
            radius                                  : height/2;
            color                                   : randomColor();
            Label   {
                color: Qt.rgba(1,1,1,0.5);
                anchors.centerIn: parent;
                text                                : model.hash58 !== "" ? model.hash58[2] : "NA";
                font    {
                    family                          : aweFont.name;
                    pixelSize                       : 16*dp;
                }
            }
        }

        ColumnLayout {
            Layout.fillWidth                        : true;
            Layout.fillHeight                       : true;
            spacing                                 : 5*dp;

            Text    {
                id                                  : hash58Label;
                Layout.fillWidth                    : true;
                Layout.minimumHeight                : 12*dp;
                Layout.preferredHeight              : 12*dp;
                Layout.maximumWidth                 : 200*dp;
                color                               : forceFontColor
                elide                               : Text.ElideMiddle;
                wrapMode                            : Text.WrapAnywhere;
                text                                : model.hash58;
                font    {
                    family                          : aweFont.name;
                    pixelSize                       : 9*dp;
                }
            }

            Label   {
                id                                  : locationsLabel;
                text                                : model.locations === "" ? "unknow" : model.locations;
                Layout.topMargin                    : 10*dp;
                Layout.minimumHeight                : 14*dp;
                Layout.preferredHeight              : 14*dp;
                font    {
                    family                      : aweFont.name;
                    pixelSize                   : 12*dp;
                }
                verticalAlignment               : Label.AlignVCenter;
            }
        }

    }
}
