import QtQuick 2.11
import QtQuick.Controls 2.2


BorderImage {
    id                                      : root;
    source                                  : "qrc:/images/toolBorderImg.png";
    width                                   : 220*dp;
    height                                  : 100*dp;                                  //
    border  {
        top                                 : 20*dp;
        bottom                              : 10*dp;
        left                                : 10*dp;
        right                               : 10*dp;
    }
    horizontalTileMode                      : BorderImage.Stretch;
    verticalTileMode                        : BorderImage.Stretch;

    /* 热搜开始 */
    Label   {
        id                                  : hotLab;
        anchors {
            top                             : parent.top;
            topMargin                       : 10*dp;
            leftMargin                      : 2*dp;
        }
        width                               : parent.width - 4*dp;
        padding                             : 5*dp;
        text                                : qsTr("热门搜索");
        font    {
            family                          : aweFont.name;
            pixelSize                       : 12*dp;
        }
        color                               : settings.itemBtnForceFontColor;
        verticalAlignment                   : Label.AlignVCenter;
        horizontalAlignment                 : Label.AlignLeft;
    }


}
