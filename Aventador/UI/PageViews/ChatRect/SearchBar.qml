import QtQuick 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import QtGraphicalEffects 1.0

/**
 * @file    SearchBar.qml
 * @version 1.0
 * @brief
 * @date    2018-09-09
 * @author  lanbery
 * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
 */
Pane {
    property bool       filterFavorite                  : false;
    property alias      text                            : searchTextField.text; //
    property color      normalBgColor                   : settings.grigioLynxColor;

    Material.elevation                                  : 1;
    Material.background                                 : Qt.lighter(settings.neroHeleneColor);

    leftPadding                                         : 0;
    topPadding                                          : 0;
    bottomPadding                                       : 0;
    rightPadding                                        : 0*dp;

    background  : Rectangle {
        anchors.fill                                    : parent;
        color                                           : normalBgColor;
    }

    RowLayout   {
        id                                              : rootRowLayoutID;
        anchors.fill                                    : parent;
        spacing                                         : 0*dp;

        Label {
            Layout.fillWidth                            : true;
            Layout.preferredWidth                       : 30*dp;
            Layout.maximumWidth                         : 30*dp;
            Layout.minimumWidth                         : 30*dp;
            Layout.minimumHeight                        : 32*dp;
            Layout.preferredHeight                      : 32*dp;
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
            Layout.minimumHeight                        : 32*dp;
            Layout.preferredHeight                      : 32*dp;
            topPadding                                  : 0;
            bottomPadding                               : 0;
            focus                                       : true;
            selectByMouse                               : true;
            color                                       : foregroundColor;
            background                                  : Rectangle{
                anchors.fill                            : parent;
                color                                   : normalBgColor;
            }
            placeholderText                             : qsTr("<font color=\"#B0B0AE\">节点昵称搜索...</font>");
            font {
                family                                  : aweFont.name;
                pixelSize                               : 12*dp;
            }
        }

        Label   {
            id                                          : favLabelIconID;
            Layout.fillWidth                            : true;
            Layout.minimumWidth                         : 26*dp;
            Layout.preferredWidth                       : 26*dp;
            Layout.preferredHeight                      : 32*dp;
            horizontalAlignment                         : Label.AlignHCenter;
            verticalAlignment                           : Label.AlignVCenter;
            color                                       : foregroundColor;
            background                                  : Rectangle {
                anchors.fill                            : parent;
                color                                   : normalBgColor;
            }
            font {
                family                                  : aweFont.name;
                pixelSize                               : 12*dp;
            }
            text                                        : filterFavorite ? qsTr("\uf005") : qsTr("\uf006");

            MouseArea   {
                anchors.fill                            : parent;
                hoverEnabled                            : true;
                cursorShape                             : Qt.PointingHandCursor;

                onEntered   : {
                    if(!filterFavorite){
                        favLabelIconID.text = qsTr("\uf005");
                    }
                }

                onExited    : {
                    if(!filterFavorite){
                        favLabelIconID.text = qsTr("\uf006");
                    }
                }

                onClicked   : {
                    if(!filterFavorite){
                        filterFavorite = true;
                        favLabelIconID.text = qsTr("\uf005");
                    }else{
                        filterFavorite = false;
                        favLabelIconID.text = qsTr("\uf006");
                    }
                }
            }
        }
    }

}
