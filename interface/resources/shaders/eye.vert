#version 120

//
//  eye.vert
//  vertex shader
//
//  Created by Andrzej Kapolka on 9/25/13.
//  Copyright (c) 2013 High Fidelity, Inc. All rights reserved.
//

// the interpolated normal
varying vec4 normal;

void main(void) {

    // transform and store the normal for interpolation
    normal = normalize(gl_ModelViewMatrix * vec4(gl_Normal, 0.0));
    
    // compute standard diffuse lighting per-vertex
    gl_FrontColor = vec4(gl_Color.rgb * (gl_LightModel.ambient.rgb + gl_LightSource[0].ambient.rgb +
        gl_LightSource[0].diffuse.rgb * max(0.0, dot(normal, gl_LightSource[0].position))), gl_Color.a);
    
    // pass along the texture coordinate
    gl_TexCoord[0] = gl_MultiTexCoord0;
    
    // use standard pipeline transform
    gl_Position = ftransform();
}
