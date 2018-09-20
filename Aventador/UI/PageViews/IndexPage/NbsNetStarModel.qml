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
        name                    : "Core";
        planetImageSource       : "http://nbsio.net/image/nbs_circle.png";
        planetNumber            : 0;
        hash58                  : "QmbZHNEgipahPYMbugdfFbLVEdXDmxGLLy3vYC4WP98Lqi";
        storageSize             : "12.59 TB";
        onlineNums              : "899 Peers";
        descriptions            : "NBS 星际文件系统核心";
    }

    ListElement {
        name                    : "Mercury";
        planetImageSource       : "qrc:/images/stars/mercury.png";
        planetNumber            : 1;
        hash58                  : "QmbZHNEgipahPYMbugdfFbLVEdXDmxGLLy3vYC4WP98Lqi";
        nickName                : "";//暂未用到
        storageSize             : "10.0 GB";
        locations               : "水星";
        onlineNums              : "899 Peers";
        gcperiod                : "1 h";
        descriptions            : "";
    }
    ListElement {
        name                    : "Venus";
        planetImageSource       : "qrc:/images/stars/venus.png";
        planetNumber            : 2;
        hash58                  : "QmYHk2VWWNAbc4zU5oyemfadBYMtNmutqXHjSDV8hm5E7g";
        nickName                : "";//暂未用到
        storageSize             : "12.59 GB";
        locations               : "金星";
        onlineNums              : "899 Peers";
        gcperiod                : "12 h";
        descriptions            : "";
    }
    ListElement {
        name                    : "Earth";
        planetImageSource       : "qrc:/images/stars/earth.png";
        planetNumber            : 3;
        hash58                  : "QmbZHNEgipahPYMbugdfFbLVEdXDmxGLLy3vYC4WP98Lqi";
        nickName                : "";//暂未用到
        storageSize             : "3.0 GB";
        locations               : "";
        onlineNums              : "899 Peers";
        gcperiod                : "10 h";
        descriptions            : "";
    }
    ListElement {
        name                    : "Mars";
        planetImageSource       : "qrc:/images/stars/mars.png";
        planetNumber            : 4;
        hash58                  : "QmbZHNEgipahPYMbugdfFbLVEdXDmxGLLy3vYC4WP98Lqi";
        nickName                : "";//暂未用到
        storageSize             : "5 GB";
        locations               : "火星";
        onlineNums              : "76 Peers";
        gcperiod                : "24 h";
        descriptions            : "";
    }
    ListElement {
        name                    : "Jupiter";
        planetImageSource       : "qrc:/images/stars/jupiter.png";
        planetNumber            : 5;
        hash58                  : "QmbZHNEgipahPYMbugdfFbLVEdXDmxGLLy3vYC4WP98Lqi";
        nickName                : "";//暂未用到
        storageSize             : "2 GB";
        locations               : "木星";
        onlineNums              : "899 Peers";
        gcperiod                : "100 h";
        descriptions            : "";
    }
    ListElement {
        name                    : "Saturn";
        planetImageSource       : "qrc:/images/stars/saturn.png";
        planetNumber            : 6
        hash58                  : "QmbZHNEgipahPYMbugdfFbLVEdXDmxGLLy3vYC4WP98Lqi";
        nickName                : "";//暂未用到
        storageSize             : "10 GB";
        locations               : "土星";
        onlineNums              : "899 Peers";
        gcperiod                : "1 h";
        descriptions            : "";
    }
    ListElement {
        name                    : "Uranus";
        planetImageSource       : "qrc:/images/stars/uranus.png";
        planetNumber            : 7;
        hash58                  : "QmbZHNEgipahPYMbugdfFbLVEdXDmxGLLy3vYC4WP98Lqi";
        nickName                : "";//暂未用到
        storageSize             : "2.59 GB";
        locations               : "天王星";
        onlineNums              : "22 Peers";
        gcperiod                : "1 h";
        descriptions            : "";
    }
    ListElement {
        name                    : "Neptune";
        planetImageSource       : "qrc:/images/stars/neptune.png";
        planetNumber            : 8;
        hash58                  : "QmbZHNEgipahPYMbugdfFbLVEdXDmxGLLy3vYC4WP98Lqi";
        nickName                : "";//暂未用到
        storageSize             : "10.0 GB";
        locations               : "海王星";
        onlineNums              : "22 Peers";
        gcperiod                : "84 h";
        descriptions            : "";
    }


    ListElement {
        name                    : "NBS Chain";
        planetImageSource       : "";
        planetNumber            : 100;
    }
}
