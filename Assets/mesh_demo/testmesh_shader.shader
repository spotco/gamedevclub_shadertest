Shader "Custom/testmesh_shader" {
    Properties {
        _MainTex ("Base (RGB)", 2D) = "white" {}
    }
    SubShader {
        Pass {
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag

			#include "UnityCG.cginc"
			
			uniform sampler2D _MainTex;

			struct vertexInput {
				float4 vertex : POSITION;
				float2 texcoord : TEXCOORD0;
			};
			struct vertexOutput {
				float4 pos : POSITION;
				float2 tex : TEXCOORD0;
			};
			
			vertexOutput vert(vertexInput input) 
			{
				vertexOutput output;
				output.tex = input.texcoord;
				output.pos = mul(UNITY_MATRIX_MVP, input.vertex);
				return output;
			}
			float4 frag(vertexOutput input) : COLOR
			{
				return tex2D(_MainTex, input.tex.xy);
				//return float4(1.0,0.0,0.0,1.0);
			}

			ENDCG
        }
    }
}