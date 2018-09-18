import QtQml.Models 2.3
/**
 * @file    NbsNetStarModel.qml
 * @version 1.0
 * @brief   NBS星际系统Model
 * @date    2018-09-18
 * @author  lanbery
 * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
 */
ListModel {
    ListElement {
        nnsType                 : "NBS Chain";
        avatarIamgeSource       : "";
        nnsNo                   : 100;
        descriptions            : "";
    }
    ListElement {
        nnsType                 : "Sun";
        avatarIamgeSource       : "qrc:/images/stars/sun.png";
        nnsNo                   : 0;
        nnsStorageCapacity      : "311.579TB";
        nnsNodesTotal           : 30972;
    }
    ListElement {
        nnsType                 : "Mercury";
        avatarIamgeSource       : "qrc:/images/stars/mercury.png";
        nnsNo                   : 1;
        storageSize             : "10GB";
        blockGCPeriod           : "1h";
        contributed             : "209 NBS";
        locations               : "Berlin, Germany";
    }
    ListElement {
        nnsType                 : "Venus";
        avatarIamgeSource       : "qrc:/images/stars/venus.png";
        nnsNo                   : 2;
        storageSize             : "4GB";
        blockGCPeriod           : "12h";
        contributed             : "87 NBS";
        locations               : "Japan Nagoya";
    }
    ListElement {
        nnsType                 : "Earth";
        avatarIamgeSource       : "qrc:/images/stars/earth.png";
        nnsNo                   : 3;
        storageSize             : "10GB";
        blockGCPeriod           : "24h";
        contributed             : "3109 NBS";
        locations               : "中国 北京";
    }
    ListElement {
        nnsType                 : "Mars";
        avatarIamgeSource       : "qrc:/images/stars/mars.png";
        nnsNo                   : 4;
        storageSize             : "10GB";
        blockGCPeriod           : "1h";
        contributed             : "29 NBS";
        locations               : "中国 北京";
    }
    ListElement {
        nnsType                 : "Jupiter";
        avatarIamgeSource       : "qrc:/images/stars/jupiter.png";
        nnsNo                   : 5;
        storageSize             : "100GB";
        blockGCPeriod           : "1h";
        contributed             : "2197 NBS";
        locations               : "unknow";
    }
    ListElement {
        nnsType                 : "Saturn";
        avatarIamgeSource       : "qrc:/images/stars/saturn.png";
        nnsNo                   : 6;
        storageSize             : "100GB";
        blockGCPeriod           : "1h";
        contributed             : "2197 NBS";
        locations               : "unknow";
    }
    ListElement {
        nnsType                 : "Jupiter";
        avatarIamgeSource       : "qrc:/images/stars/jupiter.png";
        nnsNo                   : 7;
        storageSize             : "100GB";
        blockGCPeriod           : "1h";
        contributed             : "2197 NBS";
        locations               : "unknow";
    }
    ListElement {
        nnsType                 : "Jupiter";
        avatarIamgeSource       : "qrc:/images/stars/jupiter.png";
        nnsNo                   : 8;
        storageSize             : "100GB";
        blockGCPeriod           : "1h";
        contributed             : "2197 NBS";
        locations               : "unknow";
    }
}
