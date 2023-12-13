#version 330 core

layout (location = 0) in vec3 vPos;
layout (location = 1) in vec3 vNormal;

out vec3 FragPos;		// 객체의 위치값을 프래그먼트 셰이더로 보낸다.
out vec3 Normal;		// 노멀값을 프래그먼트 셰이더로 보낸다.

uniform vec3 inColor;
out vec3 outColor;

uniform mat4 transform;		// 모델링 변환값
uniform mat4 projection;	// 투영 변환값
uniform mat4 view;			// 뷰잉 변환값

void main(void) 
{

	gl_Position = projection * view * transform * vec4(vPos, 1.0);
	FragPos = vec3(transform * vec4(vPos,1.0));
	Normal = vec3(transform * vec4(vNormal,1.0));
	outColor = inColor;
}