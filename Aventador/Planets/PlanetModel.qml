import QtQml.Models 2.3
/**
 * nbs-qml
 * @file    PlanetModel.qml
 * @version 1.0
 * @brief   菜单按钮
 * @date    2018-09-25
 * @author  lanbery
 * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
 */
ListModel {
    ListElement {
        name        : "Sun";
        radius: "1093.0 GB"
        temperature: "978"
        orbitalPeriod: ""
        distance: ""
        planetImageSource: "qrc:/images/sun.png"
        planetNumber: 0
        hash58:"QmcZ7vMAKR6PpZKSDmYnTstue1Ep1PAxVD7ZE24EyZ6dDv"
    }
    ListElement {
        name: "Mercury"
        radius: "10.0 GB"
        temperature: "226"
        orbitalPeriod: "1 h"
        distance: "0.387 098 AU"
        planetImageSource: "qrc:/images/mercury.png"
        planetNumber: 1
        hash58:"QmemHqPB47retdBLgozLA7dw4iaSouzVb4hZarU26gP3xW"
    }
    ListElement {
        name: "Venus"
        radius: "4.0 GB"
        temperature: "166"
        orbitalPeriod: "12 h"
        distance: "0.723 327 AU"
        planetImageSource: "qrc:/images/venus.png"
        planetNumber: 2
        hash58:"QmXk2Hb1P95Zhcyn5aQWQenZBg3kqcfYUp8nsASBB31YbX"
    }
    ListElement {
        name: "Earth"
        radius: "10.0 GB"
        temperature: "184"
        orbitalPeriod: "7 d"
        distance: "149598261 km (1 AU)"
        planetImageSource: "qrc:/images/earth.png"
        planetNumber: 3
        hash58:"QmbvbpagRCbinshyH3XfA2ivg4F7wXwbsKoqMSgq4wUYvs"
    }
    ListElement {
        name: "Mars"
        radius: "3 GB"
        temperature: "130"
        orbitalPeriod: "20 h"
        distance: "1.523679 AU"
        planetImageSource: "qrc:/images/mars.png"
        planetNumber: 4
        hash58:"QmQU2SzPFXJECkSwpo9qQoG1x9o7pyrFK6zW3rhwE52Hqt"
    }
    ListElement {
        name: "Jupiter"
        radius: "10.0 GB"
        temperature: "165"
        orbitalPeriod: "1 h"
        distance: "5.204267 AU"
        planetImageSource: "qrc:/images/jupiter.png"
        planetNumber: 5
        hash58:"QmczgqV8TG3rm4bwsaqzvDQFNB5MDZFoe7nYUNnbTSumMM"
    }
    ListElement {
        name: "Saturn"
        radius: "9.0 GB"
        temperature: "84"
        orbitalPeriod: "7 d"
        distance: "9.5820172 AU"
        planetImageSource: "qrc:/images/saturn.png"
        planetNumber: 6
        hash58:"QmZkZdhuu7ZfF83LqHMPGGVJD2FSir2j86j35SgZnJrswf"
    }
    ListElement {
        name: "Uranus"
        radius: "4.0 GB"
        temperature: "76 "
        orbitalPeriod: "1 d"
        distance: "19.189253 AU"
        planetImageSource: "qrc:/images/uranus.png"
        planetNumber: 7
        hash58:"QmYPHhXc3FdCBEPLD48nRGZKyFcZDRGbujrXuuCdoF4E9r"
    }
    ListElement {
        name: "Neptune"
        radius: "10 GB"
        temperature: "664"
        orbitalPeriod: "1 h"
        distance: "30.070900 AU"
        planetImageSource: "qrc:/images/neptune.png"
        planetNumber: 8
        hash58:"QmddEKWHB92JNxN4Z8Exhyvs1io2Y75FPvAGmDVSztQb51"
    }
    ListElement {
        name: "NBS Chain"
        planetImageSource: "qrc:/images/planet-logo.png"
        planetNumber: 100 // Defaults to solar system
    }
}
