﻿// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Sprites/NewImageEffectShader"
{
	Properties
	{
		[NoScaleOffset] _MainTex ("Texture", 2D) = "White" {}
	}

	SubShader
	{
		Tags
		{
			"RenderType" = "Opaque"
		}
		LOD	100

		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#pragma multi_compile_fog

			struct appdata
			{
				float4 vertex : Position;
				float2 uv : TEXCOORD0;
			};

			struct v2f
			{
				float uv : TEXCOORD0;
				float4 vertex : SV_POSITION;
			};

			sampler2D _MainTex;
			float4 _MainTex_ST;

			v2f vert(appdata v)
			{
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				o.uv = v.uv;
				return o;
			}

			fixed4 frag (v2f i) : SV_Target
			{
				fixed4 col = tex2D(_MainTex, i.uv);
				return col;
			}

			ENDCG
		}
	}
}
