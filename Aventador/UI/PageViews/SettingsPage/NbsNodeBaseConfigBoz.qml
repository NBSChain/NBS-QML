import QtQuick 2.11
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

import "../../Utils"
/**
 * @file    NbsNodeBaseConfigBoz.qml
 * @version 1.0
 * @brief
 * @date    2018-09-12
 * @author  lanbery
 * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
 */
GroupBox    {
    property bool   editabled               : false;   //
    id                                      : root;
    label: GrpBozLabel {

        anchors.left                        : parent.left;
        anchors.leftMargin                  : 15*dp;
        text                                : qsTr("NBS NODE 设置");
    }

    GridLayout {
        rows                                : 3;
        columns                             : 3;
        columnSpacing                       : 10*dp;
        TextLabelRight {
            Layout.preferredWidth           : 200*dp;
            text                            : "StorageMax :";
        }

        TextFieldBoz {
            Layout.preferredWidth           : 200*dp;
            id                              : nodeStorageMaxId;
            text                            : qsTr("10");
            placeholderText                 : qsTr("请输入数值");
            horizontalAlignment             : Qt.AlignHCenter;
        }
        TextLabelRight {
            Layout.preferredWidth           : 10*dp;
            text                            : "GB";
            isRight                         : false;
        }
        /* row 2*/
        TextLabelRight {
            Layout.preferredWidth           : 200*dp;
            text                            : "Datastore.GCPeriod :";
        }
        TextFieldBoz {
            Layout.preferredWidth           : 200*dp;
            id                              : nodeStorageGCPeriodID;
            text                            : qsTr("1");
            placeholderText                 : qsTr("请输入数值");
            horizontalAlignment             : Qt.AlignHCenter;
        }

        TextLabelRight {
            Layout.preferredWidth           : 10*dp;
            text                            : "H";
            isRight                         : false;
        }
    }
}

