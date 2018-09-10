import QtQuick 2.11
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import QtQuick.Layouts 1.3

/**
 * @file    RightChatRect.qml
 * @version 1.0
 * @brief   聊天窗口
 * @date    2018-09-10
 * @author  lanbery
 * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
 * fa-smile-o \f118;fa-scissors \f0c4;fa-folder-o \f114;
 * fa-history \f1da;fa-phone \f095;
 */
ColumnLayout {

    id                                              : root;
    anchors.fill                                    : parent;

//    ListView {
//        id                                          : msgListView;
//        Layout.fillHeight                           : true;
//        Layout.fillWidth                            : true;


//    }
    Rectangle {
        id  : upP;
        Layout.fillHeight                           : true;
        Layout.fillWidth                            : true;

        color: "#762200";
    }

    ColumnLayout {
        id                                          : editPane;
        Layout.fillHeight                           : true;
        Layout.fillWidth                            : true;
        Layout.minimumHeight                        : 192*dp;
        Layout.maximumHeight                        : 192*dp;
        Layout.preferredHeight                      : 192*dp;

        /**/
        RowLayout {
            id                                      : operatorPane;
            Layout.fillWidth                        : true;
            Layout.preferredHeight                  : 32*dp;
            Layout.minimumHeight                    : 32*dp;
            Layout.maximumHeight                    : 32*dp;
            spacing : 1*dp;
            Text {
                id                                  : emojiIcon;
                height                              : parent.height;
                Layout.fillHeight                   : true;
                color       : "white";
                font {
                    family              : aweFont.name;
                    pixelSize           : 20*dp;
                }

                text    : qsTr("\uf118");
            }
            Text {
                id                                  : folderIcon;
                height                              : parent.height;
                Layout.fillHeight                   : true;
                color       : "white";
                font {
                    family              : aweFont.name;
                    pixelSize           : 20*dp;
                }

                text    : qsTr("\uf114");
            }
            Text {
                id                                  : cutIcon;
                height                              : parent.height;
                Layout.fillHeight                   : true;
                color       : "white";
                font {
                    family              : aweFont.name;
                    pixelSize           : 20*dp;
                }

                text    : qsTr("\uf0c4");
            }
        }



    }


}
