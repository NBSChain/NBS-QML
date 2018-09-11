import QtQuick 2.11
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.2

import "../Components"

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
    property color      editorRectColor             : "#222222";
    id                                              : root;
    anchors.fill                                    : parent;
    spacing                                         : 0;

    Material.elevation                              : 1;
    Material.background                             : Qt.lighter(settings.neroHeleneColor);

    MsgScrollViewEx {
        id                                          : msgScrollRect;
        //anchors.fill: parent;
        Layout.fillHeight: true;
        Layout.fillWidth: true;
        color: editorRectColor;

    }

    /* 消息输入区 */
    Rectangle   {
        id                                          : midPanel;
        height                                      : 30*dp;
        Layout.fillWidth                            : true;
        color                                       : Qt.lighter(settings.silingBarBgColor);

        /* 编辑操作区 */
        Row   {
            id                                      : operatorPane;
            anchors.fill                            : parent;
            anchors.left                            : parent.left;
            anchors.leftMargin                      : 10*dp;
            spacing                                 : 10*dp;

            OperatedTextIcon    {
                id                                  : emojiIcon;
                text                                : qsTr("\uf118");
                normalColor                         : noramlFontColor;
                hoveredColor                        : foregroundColor;
            }
            OperatedTextIcon    {
                id                                  : folderIcon;
                text                                : qsTr("\uf114");
                normalColor                         : noramlFontColor;
                hoveredColor                        : foregroundColor;

            }
            OperatedTextIcon    {
                id                                  : cutIcon;
                text                                : qsTr("\uf0c4");
                normalColor                         : noramlFontColor;
                hoveredColor                        : foregroundColor;
            }
        }
    }

    /* */
    Rectangle   {
        id                                          : bottomEidtor;
        Layout.fillWidth                            : true;
        Layout.preferredHeight                      : 110*dp;
        Layout.minimumHeight                        : 110*dp;
        Layout.maximumHeight                        : 110*dp;
        color                                       : editorRectColor

        RowLayout {
            anchors.fill                                : parent;

            Rectangle   {
                id                                  : editorFrameID;
                Layout.fillWidth:true;
                Layout.fillHeight: true;
                //Layout.margins: 5*dp;
                color: bottomEidtor.color;

                TextEdit {
                    id                              : textEditID;
                    anchors.fill                    : parent;
                    width                           : parent.width - editScrollBar.width;
                    height                          : 90*dp;
                    wrapMode                        : TextEdit.Wrap;
                    y                               : -editScrollBar.position*textEditID.height;

                    color                           : "white";
                    focus                           : true;
                    selectByKeyboard                : true;
                    selectByMouse                   : true;


                    anchors {
                        leftMargin: 10*dp;
                        topMargin: 10*dp;
                        bottomMargin: 10*dp;
                        rightMargin: 10*dp;
                    }
                    font    {
                        family                      : aweFont.name;
                        pixelSize                   : 12*dp;
                    }
                }

                ScrollBar {
                    id              : editScrollBar;
                    hoverEnabled    : true;
                    active: hovered||pressed;
                    orientation: Qt.Vertical;
                    size : editorFrameID.height /textEditID.height;
                    width: 5*dp;

                    anchors {
                        top :parent.top;
                        right: parent.right;
                        bottom: parent.bottom;
                    }
                }

            }

            Rectangle   {
                //Layout.fillWidth:true;
                Layout.fillHeight: true;
                Layout.minimumWidth: 65*dp;
                Layout.preferredWidth: 65*dp;
                color: editorRectColor;

                Button {
                    text : qsTr("发  送");
                    anchors {
                        right: parent.right;
                        rightMargin:10*dp;
                        leftMargin: 5*dp;
                        bottom: parent.bottom;
                        bottomMargin: 20*dp;
                    }
                }
            }

        }




    }
}
