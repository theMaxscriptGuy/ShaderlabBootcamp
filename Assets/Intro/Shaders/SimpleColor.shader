Shader "Bootcamp/SimpleColor"
{
    Properties
    {
        _PrimaryColor ("Primary Color", Color) = (1,1,1,1)
        _SecondaryColor ("_SecondaryColor Color", Color) = (1,1,1,1)
    }
    SubShader
    {
        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            struct appdata
            {
                float4 vertex : POSITION;
            };

            struct v2f
            {
                float4 vertex : SV_POSITION;
            };

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                return o;
            }
            
            float4 _PrimaryColor;
            float4 _SecondaryColor;

            fixed4 frag (v2f i) : SV_Target
            {
                return (_PrimaryColor + _SecondaryColor);
            }
            ENDCG
        }
    }
}
