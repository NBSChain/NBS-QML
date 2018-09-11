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

    //height: 120*dp;

    leftPadding                                                 : 0*dp;
    rightPadding                                                : 0*dp;

    Rectangle {
        anchors.fill: parent;
        Layout.fillWidth: true;
        Layout.leftMargin: 15*dp;
        Layout.rightMargin:25*dp;
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
                    color: "white";
                    text : sendTime;
                    //horizontalAlignment: self ? Label.right : Label.left;
                }
                Label {
                    id              : contentLabelID;
                    Layout.fillWidth: true;
                    Layout.fillHeight: true;
                    color: "white";
                    text : content;
                    wrapMode: Text.Wrap;
                    //horizontalAlignment: self ? Label.right : Label.left;
                }
    //            Label{
    //                Layout.fillWidth: true;
    //                color: "red"
    //                text: root.height +"*" +root.width +";"+itemContentRowID.width+";L="+contentLabelID.width;
    //            }

            }


            Item    {
                id : rootAvatarIDR;
                Layout.minimumHeight: 36*dp;
                Layout.maximumHeight: 36*dp;
                Layout.preferredHeight: 36*dp;
                Layout.minimumWidth: 36*dp;
                Layout.maximumWidth: 36*dp;
                visible                 : false;//self ;
                Image   {
                    id  : avatarImageR;
                    source: avatar;
                    smooth: true;
                    sourceSize: Qt.size(rootAvatarIDR.width,rootAvatarIDR.height);
                    visible: false;
                }

                Rectangle {
                    id                  : avatarMaskR;
                    anchors.fill        : parent;
                    color               : "white";
                    radius              : rootAvatarIDR.height/2;
                    visible: false;
                }

                OpacityMask {
                    anchors.fill: rootAvatarIDR;
                    source: avatarImageR;
                    maskSource: avatarMaskR;
                }

            }

        }

    }
}
