import QtQuick 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import QtGraphicalEffects 1.0

/**
 * @file    SearcherBar.qml
 * @version 1.0
 * @brief   摘要
 *
 * @date    2018-09-12
 * @author  lanbery
 * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
 */
Pane {
    property bool   filterStorage                   : false;
    property alias  text                            : searchTextField.text;

    property color  normalBgColor                   : settings.grigioLynxColor;

    Material.elevation                              : 1;
    Material.background                             : Qt.lighter(settings.neroHeleneColor);

    background  : Rectangle {
        anchors.fill                                : parent;
        color                                       : normalBgColor;
    }

    RowLayout {
        id                                          : rowlayoutId;
        anchors.fill                                : parent;
        spacing                                     : 0;

        Label   {
            Layout.fillWidth                            : true;
            Layout.preferredWidth                       : 30*dp;
            Layout.maximumWidth                         : 30*dp;
            Layout.minimumWidth                         : 30*dp;
            text                                        : qsTr("\uf002");
            font    {
                family                                  : aweFont.name;
                pixelSize                               : 12*dp;
            }
            horizontalAlignment                         : Label.AlignHCenter;
            verticalAlignment                           : Label.AlignVCenter;
            color                                       : foregroundColor;
            background                                  : Rectangle {
                anchors.fill                            : parent;
                color                                   : normalBgColor;
            }
        }

        TextField   {
            id                                          : searchTextField;
            Layout.fillWidth                            : true;
            topPadding                                  : 0;
            bottomPadding                               : 0;
            focus                                       : true;
            selectByMouse                               : true;
            color                                       : foregroundColor;
            background                                  : Rectangle{
                anchors.fill                            : parent;
                color                                   : normalBgColor;
            }
            placeholderText                             : qsTr("<font color=\"#B0B0AE\">节点hash58...</font>");
            font {
                family                                  : aweFont.name;
                pixelSize                               : 12*dp;
            }
        }

        Label   {
            id                                          : storageIcon;
            Layout.fillWidth                            : true;
            Layout.minimumWidth                         : 26*dp;
            Layout.preferredWidth                       : 26*dp;
            horizontalAlignment                         : Label.AlignHCenter;
            verticalAlignment                           : Label.AlignVCenter;
            color                                       : filterStorage ? foregroundColor : Qt.lighter(bgColor,1.2);
            background                                  : Rectangle {
                id                                      : storageIconBGID;
                anchors.fill                            : parent;
                color                                   : normalBgColor;
            }
            font {
                family                                  : aweFont.name;
                pixelSize                               : 12*dp;
            }
            text                                        : qsTr("\uf1b2") ;//filterStorage ?  : qsTr("\uf006");

            MouseArea   {
                anchors.fill                            : parent;
                hoverEnabled                            : true;
                cursorShape                             : Qt.PointingHandCursor;

                onEntered   : {
                    if(!filterStorage){
                        //storageIcon.text = qsTr("\uf005");

                    }
                }

                onExited    : {
                    if(!filterStorage){
                        //storageIcon.text = qsTr("\uf006");
                    }
                }

                onClicked   : {
                    if(!filterStorage){
                        filterStorage = true;
                        //storageIcon.text = qsTr("\uf005");
                    }else{
                        filterStorage = false;
                        //storageIcon.text = qsTr("\uf006");
                    }
                }
            }
        }


     }
}
