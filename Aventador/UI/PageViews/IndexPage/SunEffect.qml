import Qt3D.Core 2.0
import Qt3D.Render 2.0
/**
 * @file    SunEffect.qml
 * @version 1.0
 * @brief
 * @date    2018-09-19
 * @author  lanbery
 * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
 */
Entity {
    id                                          : root;

    FilterKey { id : desktopkey; name : "name"; value : "Desktop";  }
    FilterKey { id : forwardkey; name : "pass"; value : "forward";  }
    FilterKey { id : eskey;      name : "name"; value : "ES2";      }

    RenderPass {
        id                                      : glpass;
        filterKeys: [forwardkey]

        shaderProgram   : ShaderProgram {
            vertexShaderCode    : loadSource("qrc:/UI/PageViews/IndexPage/shaders/gl3/sun.vert");
            fragmentShaderCode  : loadSource("qrc:/UI/PageViews/IndexPage/shaders/gl3/sun.frag");
        }
    }

    RenderPass {
        id                                      : espass;
        filterKeys                              : [forwardkey];

        shaderProgram: ShaderProgram {
            vertexShaderCode    : loadSource("qrc:/UI/PageViews/IndexPage/shaders/es2/sun.vert");
            fragmentShaderCode  : loadSource("qrc:/UI/PageViews/IndexPage/shaders/es2/sun.frag");
        }
    }

    techniques : [
        Technique {
            graphicsApiFilter {
                api                     : GraphicsApiFilter.OpenGL;
                profile                 : GraphicsApiFilter.CoreProfile;
                majorVersion            : 3;
                minorVersion            : 2;
            }
            filterKeys: [desktopkey]
            renderPasses: [glpass]
        },
        Technique {
            graphicsApiFilter {
                api                     : GraphicsApiFilter.OpenGL;
                majorVersion            : 2;
            }
            FilterKey                   : [eskey];
            renderPasses                : [espass];
        },
        Technique {
            graphicsApiFilter {
                api                     : GraphicsApiFilter.OpenGLES;
                majorVersion            : 2;
                minorVersion            : 0;
            }

            filterKeys: [eskey];
            renderPasses: [espass];
        }
    ]
}
