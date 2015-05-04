Shader "Custom/test_reflection" {
    Properties {
        _MainTex ("Base (RGB)", 2D) = "white" {}
    }
    SubShader {
        Pass {
        Blend SrcAlpha OneMinusSrcAlpha
		CGPROGRAM
		#pragma vertex vert
		#pragma fragment frag

		#include "UnityCG.cginc"
		
		uniform sampler2D _MainTex;

		struct vertexInput {
			float4 vertex : POSITION;
			float2 texcoord : TEXCOORD0;
			float fade_alpha;
		};
		struct vertexOutput {
			float4 pos : POSITION;
			float2 tex : TEXCOORD0;
			float fade_alpha;
		};
		
		//http://docs.unity3d.com/462/Documentation/Manual/SL-BuiltinValues.html
		//http://wiki.unity3d.com/index.php/Shader_Code
		vertexOutput vert(vertexInput input) 
		{
			vertexOutput output;
			
			float2 out_tex = input.texcoord;
			out_tex.x = out_tex.x + sin(out_tex.y * 40.0 + _Time[1]) * 0.15 * out_tex.y * out_tex.y;
			out_tex.x = out_tex.x + sin(out_tex.y * 100.0 + _Time[1] + 1.15) * 0.05 * out_tex.y * out_tex.y;
			output.tex = out_tex;
			output.fade_alpha = 1-out_tex.y;
			
			output.pos = mul(UNITY_MATRIX_MVP, input.vertex);
			return output;
		}
		float4 frag(vertexOutput input) : COLOR
		{
			float4 tex = tex2D(_MainTex, input.tex.xy);
			return float4(tex.x,tex.y,tex.z * 1.1,clamp(input.fade_alpha,0.0,0.5));
		}

		ENDCG
        }
    }
}