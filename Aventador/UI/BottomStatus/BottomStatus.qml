import QtQuick 2.11
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

Rectangle {
    id                                          : root;
    width                                       : parent.width;
    height                                      : parent.height;
    anchors {
        right                                   : parent.right;
        rightMargin                             : 10*dp;
        verticalCenter                          : parent.verticalCenter;
    }
    color: "#112782";
    Label   {
        text    : "HHHHOK.....";
        anchors.fill: parent;
        color: "#952700";
    }

}
