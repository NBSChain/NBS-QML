import Qt3D.Render 2.0
import Qt3D.Extras 2.0
/**
 * @file    Planet.qml
 * @version 1.0
 * @brief   摘要
 *
 * @date    2018-09-19
 * @author  lanbery
 * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
 */
SphereMesh {
    property    real            r           : 0;
    property    real            x           : 0;
    property    real            y           : 0;
    property    real            z           : 0;
    property    real            roll        : 0;
    property    real            tilt        : 0;

    radius                                  : 1.0;
    generateTangents                        : true;
    rings                                   : 64;
    slices                                  : 64;
}
