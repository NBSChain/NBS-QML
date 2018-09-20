import QtQuick 2.11
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.2

import "../../Utils"

/**
 * @file    DappBaseConfigBoz.qml
 * @version 1.0
 * @brief
 * @date    2018-09-12
 * @author  lanbery
 * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
 */
GroupBox    {
    id                                      : dappGrpBoz;
    label: GrpBozLabel {
        anchors.left                        : parent.left;
        anchors.leftMargin                  : 15*dp;
        text                                : qsTr("Dapp 基本设置");
    }

    GridLayout {
        rows                                : 3;
        columns                             : 4;
        columnSpacing                       : 10*dp;
        TextLabelRight {
            Layout.preferredWidth           : 200*dp;
            text : "文件下载目录：";
        }

        TextLabelRight {
            id                              : downloadFolderLabel;
            Layout.preferredWidth           : 200*dp;
            Layout.fillWidth                : true;
            text                            : "F:///Downloads";
            Layout.columnSpan               : 2;
            isRight                         : false;
            color                           : "white";
        }
        Button {
            Layout.preferredWidth           : 60*dp;
            text: qsTr("更  改");
            font {
                family                      : aweFont.name;
                pixelSize                   : 12*dp;
            }
            onClicked   : {
                dappDlFolderDialog.open();
            }
        }

        FileDialog {
            id                              : dappDlFolderDialog;
            title                           : qsTr("文件下载路径选择");
            folder                          : shortcuts.documents;
            selectExisting                  : true;
            selectFolder                    : true;
            //fileUrl                         : downloadFolderLabel.text;
            selectMultiple                  : false;
            onAccepted                      : {
                downloadFolderLabel.text = dappDlFolderDialog.fileUrl;
            }
            onRejected                      : {

            }
        }

        /* row 2*/
        TextLabelRight {
            Layout.preferredWidth           : 200*dp;
            text                            : "Dapp接入NBS网络方式：";
        }
        Row {
            Layout.columnSpan               : 3;
            spacing                         : 20*dp;
            RadioButton {
                id                          : localNBSNode;
                checked                     : true;
                text                        : qsTr("本地 NBS 节点");
                 ButtonGroup.group:nbsInterGrp;
            }
            RadioButton {
                id                          : remoteNBSNode;
                text                        : qsTr("NBS 网络节点");
                ButtonGroup.group           : nbsInterGrp;
            }
        }

        /* row 3*/
        TextLabelRight {
            Layout.preferredWidth           : 200*dp;
            text                            : "API HOST：";
        }

        TextFieldBoz {
            id                              : apiHostVolID;
            text                            : qsTr("127.0.0.1");
            placeholderText                 : qsTr("请输入域名或IP");

        }
        TextLabelRight {
            Layout.preferredWidth           : 200*dp;
            text                            : "API HOST：";
        }
        Row {
            spacing                         : 5*dp;
            TextFieldBoz {
                id                          : apiPortVolID;
                text                        : qsTr("5001");
                placeholderText             : qsTr("请输入端口");
                validator                   : IntValidator{ bottom: 2000;top : 60000;}
            }

            Button {
                Layout.preferredWidth       : 60*dp;
                text                        : qsTr("测  试");
                font {
                    family                  : aweFont.name;
                    pixelSize               : 12*dp;
                }
            }

        }

        /* row 3*/
        TextLabelRight {
            Layout.preferredWidth           : 200*dp;
            text                            : "wrap-with-directory ：";
        }
        Row {
            Layout.columnSpan               : 3;
            spacing                         : 20*dp;
            RadioButton {
                id                          : defWarp;
                checked                     : true;
                text                        : qsTr("False");
                 ButtonGroup.group          : addFileWarpWithDirectory;
            }
            RadioButton {
                id                          : noWarp;
                text                        : qsTr("True");
                ButtonGroup.group           : addFileWarpWithDirectory;
            }
        }
    }
}
