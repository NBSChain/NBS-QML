import QtQuick 2.11
import QtQuick.Controls 2.2
/**
 * @file    WindToolButton.qml
 * @version 1.0
 * @brief   App ToolButton
 * @date    2018-09-02
 * @author  lanbery
 * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
 */
BorderImage {
    id                          : root;

    source                      : "qrc:/images/toolBorderImg.png"
    width                       : 100*dp;
    height                      : 220*dp;
    border  {
        top                     : 2*dp;
        bottom                  : 10*dp;
        left                    : 10*dp;
        right                   : 10*dp;
    }

    horizontalTileMode          : BorderImage.Stretch;
    verticalTileMode            : BorderImage.Stretch;


}
