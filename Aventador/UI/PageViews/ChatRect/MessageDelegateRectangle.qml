import QtQuick 2.11
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0

/**
 * @file    MessageDelegateRectangle.qml
 * @version 1.0
 * @brief   Delegate消息
 * @date    2018-09-11
 * @author  lanbery
 * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
 */
ItemDelegate {
    property color      bgColor                                 : settings.silingBarBgColor;
    property bool       self                                    : false;
    property string     msgid;
    property string     avatarUrl;
    property string     content;
    property string     sendTime;
    id                                                          : root;

    height                                                      : 80*dp;

    leftPadding                                                 : 0*dp;
    rightPadding                                                : 0*dp;
    Layout.fillWidth: true;

    Rectangle {
        anchors.fill: parent;
        Layout.fillWidth: true;
        anchors.right: parent.right;
        color: "white";
        border.color: "red"
        RowLayout  {
            id                                                      : itemContentRowID;
            //anchors.centerIn                                            : parent;
            anchors.margins                                         : 5*dp;
            spacing                                                 : 10*dp;

            layoutDirection                                         : self ? Qt.RightToLeft : Qt.LeftToRight;

            Item    {
                id : rootAvatarIDL;
                Layout.minimumHeight: 36*dp;
                Layout.maximumHeight: 36*dp;
                Layout.preferredHeight: 36*dp;
                Layout.minimumWidth: 36*dp;
                Layout.maximumWidth: 36*dp;
                Layout.leftMargin: 10*dp;
                Layout.rightMargin: 10*dp;
                //Layout.alignment: parent.right;
                //visible : self ? false : true;

                Image   {
                    id  : avatarImage;
                    source: avatar;
                    smooth: true;
                    sourceSize: Qt.size(rootAvatarIDL.width,rootAvatarIDL.height);
                    visible: false;
                }

                Rectangle {
                    id                  : avatarMask;
                    anchors.fill        : parent;
                    color               : "white";
                    radius              : rootAvatarIDL.height/2;
                    visible: false;
                }

                OpacityMask {
                    anchors.fill: rootAvatarIDL;
                    source: avatarImage;
                    maskSource: avatarMask;
                }

            }


            ColumnLayout    {
                Layout.fillWidth    : true;
                Layout.fillHeight   : true;

                spacing: 4*dp;

                Label {
                    id              : timeLabelID;
                    Layout.fillWidth: true;
                    Layout.leftMargin: self ? 65*dp : 0;
                    Layout.rightMargin: self ? 0:10*dp;
                    color: "white";
                    font{
                        family: aweFont.name;
                        pixelSize           : 10*dp;
                    }

                    text : sendTime;
                    horizontalAlignment: self ? Text.AlignRight: Text.AlignLeft;
                }

                Label {
                    id              : contentLabelID;
                    Layout.fillWidth: true;
                    Layout.fillHeight: true;
                    Layout.leftMargin: self ? 65*dp : 0 ;
                    Layout.rightMargin: self ? 0 : 10*dp;
                    color: "white";
                    text : content;
                    wrapMode: Text.Wrap;
                    horizontalAlignment: self ? Text.AlignRight: Text.AlignLeft;
                }


            }

        }

    }
}
