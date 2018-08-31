/**
 * @file    nbs-qml
 * @version 1.0
 * @brief
 * @date    2018-08-29
 * @author  lanbery
 * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
 */
import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0

Rectangle   {

    ColumnLayout    {
        anchors.fill                            : parent

        Rectangle   {
            Layout.fillWidth                    : true
            Layout.fillHeight                   : 120
            color                               : "#060608"

            Image {
                anchors.fill                    : parent
                source                          : "qrc:///nbs_header.png"
                fillMode                        : Image.PreserveAspectFit
            }
        }
    }

}
