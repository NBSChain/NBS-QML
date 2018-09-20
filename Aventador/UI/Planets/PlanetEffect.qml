import Qt3D.Core 2.0
import Qt3D.Render 2.0
/**
 * @file
 * @version 1.0
 * @brief
 * @date    2018-09-20
 * @author  lanbery
 * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
 */
Effect {
    id: root

    property Texture2D shadowTexture
    property PlanetsLight light
    property string vertexES: "qrc:/UI/Planets/shaders/es2/planetD.vert"
    property string fragmentES: "qrc:/UI/Planets/shaders/es2/planetD.frag"
    property string vertexGL: "qrc:/UI/Planets/shaders/gl3/planetD.vert"
    property string fragmentGL: "qrc:/UI/Planets/shaders/gl3/planetD.frag"

    parameters: [
        Parameter { name: "lightViewProjection"; value: root.light.lightViewProjection },
        Parameter { name: "lightPosition";  value: root.light.lightPosition },
        Parameter { name: "lightIntensity"; value: root.light.lightIntensity }
    ]

    FilterKey { id: eskey; name: "name"; value: "ES2" }
    FilterKey { id: glkey; name: "name"; value: "Desktop" }
    FilterKey { id: forwardkey; name : "pass"; value : "forward" }

    RenderPass {
        id: glpass
        filterKeys: [ forwardkey ]

        shaderProgram: ShaderProgram {
            vertexShaderCode:   loadSource(vertexGL)
            fragmentShaderCode: loadSource(fragmentGL)
        }
        // no special render state set => use the default set of states
    }

    RenderPass {
        id: espass
        filterKeys: [ forwardkey ]

        shaderProgram: ShaderProgram {
            vertexShaderCode:   loadSource(vertexES)
            fragmentShaderCode: loadSource(fragmentES)
        }
        // no special render state set => use the default set of states
    }

    techniques: [
        Technique {
            graphicsApiFilter {
                api: GraphicsApiFilter.OpenGL
                profile: GraphicsApiFilter.CoreProfile
                majorVersion: 3
                minorVersion: 2
            }

            filterKeys: [ glkey ]

            renderPasses: [ glpass ]
        },
        Technique {
            graphicsApiFilter {
                api: GraphicsApiFilter.OpenGL
                majorVersion: 2
            }

            filterKeys: [ eskey ]

            renderPasses: [ espass ]
        },
        Technique {
            graphicsApiFilter {
                api: GraphicsApiFilter.OpenGLES
                majorVersion: 2
                minorVersion: 0
            }

            filterKeys: [ eskey ]

            renderPasses: [ espass ]
        }
    ]
}
