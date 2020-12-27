Shader "Bootcamp/SimpleTexture"
{
    Properties
    {
        _PrimaryColor ("Primary Color", Color) = (1,1,1,1)
        _SecondaryColor ("_SecondaryColor Color", Color) = (1,1,1,1)
        _Image("Image", 2D) = "White" {}
    }
    SubShader
    {
        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "unitycg.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float4 vertex : SV_POSITION;
                float2 uv : TEXCOORD0;
            };

            sampler2D _Image;
            float4 _Image_ST;

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.uv, _Image);
                return o;
            }
            
            float4 _PrimaryColor;
            float4 _SecondaryColor;

            fixed4 frag(v2f i) : SV_Target
            {
                float4 tex = tex2D(_Image, i.uv);
                return lerp(_PrimaryColor, _SecondaryColor, tex.r);
            }
            ENDCG
        }
    }
}
