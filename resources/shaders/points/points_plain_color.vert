#version 150

in  vec3 vtx_position;// point position
in  vec3 vtx_color;// point color
in  vec3 vtx_normal;// point normal

uniform mat4    MVP;
uniform vec4    default_color = vec4(0.0f, 1.0f, 0.0f, 1.0f);
uniform bool    per_vertex_color = false;


out Data{
    vec4 color;
    vec3 position;
    vec3 normal;
} DataOut;


void main(void) {
    DataOut.position = vtx_position;
    DataOut.normal = vtx_normal;

    if (per_vertex_color)
        DataOut.color = vec4(vtx_color, 1.0);
    else
        DataOut.color = default_color;

    gl_Position = MVP * vec4(vtx_position, 1.0);
}
