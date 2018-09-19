import Qt3D.Core 2.0
import Qt3D.Render 2.0
/**
 * @file    ShadowEffect.qml
 * @version 1.0
 * @brief
 * @date    2018-09-19
 * @author  lanbery
 * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
 */
Entity {
    id                                                  : root;
    property        Texture2D       shadowTexture;
    property        PlanetsLight    light;

    parameters  : [
        Parameter { name: "lightViewProjection"; value : root.light.lightViewProjection },
        Parameter { name: "lightPosition";       value : root.light.lightPosition },
        Parameter { name: "lightIntensity";      value : root.light.lightIntensity },
        Parameter { name: "shadowMapTexture"     value : root.shadowTexture }
    ]

    FilterKey { id : desktopkey;    name : "name";  value : "Desktop"}
    FilterKey { id : shadowkey;     name : "pass";  value : "shadowmap"}
    FilterKey { id : forwardkey;    name : "pass";  value : "forward"}
    FilterKey { id : eskey;         name : "name";  value : "ES2" }

    RenderPass {
        id                  : shadowpass;
        filterKeys          : [shadowkey];

        shaderProgram: ShaderProgram {
            vertexShaderCode                : loadSource("qrc:/UI/PageViews/IndexPage/shaders/gl3/shadowmap.vert")
            fragmentShaderCode              : loadSource("qrc:/UI/PageViews/IndexPage/shaders/gl3/shadowmap.frag")
        }

        renderStates: [
            PolygonOffset {scaleFactor: 4; depthSteps: 4},
            DepthTest {depthFunction: DepthTest.Less}
        ]
    }

    RenderPass {
        id                  : glpass;
        filterKeys          : [forwardkey];

        shaderProgram       : ShaderProgram {
            vertexShaderCode                : loadSource("qrc:/UI/PageViews/IndexPage/shaders/gl3/planetDShadow.vert");
            fragmentShaderCode              : loadSource("qrc:/UI/PageViews/IndexPage/shaders/gl3/planetDShadow.frag");
        }
    }

    RenderPass {
        id                  : espass;
        filterKeys          : [forwardkey]

        shaderProgram       : ShaderProgram {
            vertexShaderCode                : loadSource("qrc:/UI/PageViews/IndexPage/shaders/es2/planetD.vert");
            fragmentShaderCode              : loadSource("qrc:/UI/PageViews/IndexPage/shaders/es2/planetD.frag");
        }
    }

    techniques : [
        Technique {
            graphicsApiFilter {
                api                         : GraphicsApiFilter.OpenGL;
                profile                     : GraphicsApiFilter.CoreProfile;
                majorVersion                : 3;
                minorVersion                : 2;
            }

            filterKeys: [desktopkey];
            renderPasses: [shadowpass, glpass]
        },
        Technique {
            graphicsApiFilter {
                api                         : GraphicsApiFilter.OpenGL;
                majorVersion                : 2;
            }
            filterKeys: [eskey];
            renderPasses: [espass]
        },
        Technique {
            graphicsApiFilter {
                api                         : GraphicsApiFilter.OpenGLES;
                majorVersion                : 2;
                minorVersion                : 0;
            }
            filterKeys: [eskey];
            renderPasses: [espass];
        }

    ]

}
