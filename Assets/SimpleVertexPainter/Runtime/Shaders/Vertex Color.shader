// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "SVTX/Vertex Color"
{
	Properties
	{
		[Toggle(_MODE_A_ON)] _Mode_A("Mode_A", Float) = 0
		[Toggle(_MODE_B_ON)] _Mode_B("Mode_B", Float) = 0
		[Toggle(_MODE_G_ON)] _Mode_G("Mode_G", Float) = 0
		[Toggle(_MODE_R_ON)] _Mode_R("Mode_R", Float) = 0
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Back
		CGPROGRAM
		#pragma target 3.0
		#pragma shader_feature_local _MODE_A_ON
		#pragma shader_feature_local _MODE_B_ON
		#pragma shader_feature_local _MODE_G_ON
		#pragma shader_feature_local _MODE_R_ON
		#pragma surface surf Unlit keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float4 vertexColor : COLOR;
		};

		inline half4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return half4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			#ifdef _MODE_R_ON
				float staticSwitch14 = i.vertexColor.r;
			#else
				float staticSwitch14 = 0.0;
			#endif
			#ifdef _MODE_G_ON
				float staticSwitch15 = i.vertexColor.g;
			#else
				float staticSwitch15 = 0.0;
			#endif
			#ifdef _MODE_B_ON
				float staticSwitch16 = i.vertexColor.b;
			#else
				float staticSwitch16 = 0.0;
			#endif
			float3 appendResult7 = (float3(staticSwitch14 , staticSwitch15 , staticSwitch16));
			#ifdef _MODE_R_ON
				float3 staticSwitch13 = appendResult7;
			#else
				float3 staticSwitch13 = (i.vertexColor).rgb;
			#endif
			float3 appendResult8 = (float3(staticSwitch14 , staticSwitch15 , staticSwitch16));
			#ifdef _MODE_G_ON
				float3 staticSwitch12 = appendResult8;
			#else
				float3 staticSwitch12 = staticSwitch13;
			#endif
			float3 appendResult9 = (float3(staticSwitch14 , staticSwitch15 , staticSwitch16));
			#ifdef _MODE_B_ON
				float3 staticSwitch11 = appendResult9;
			#else
				float3 staticSwitch11 = staticSwitch12;
			#endif
			float3 appendResult10 = (float3(i.vertexColor.a , i.vertexColor.a , i.vertexColor.a));
			#ifdef _MODE_A_ON
				float3 staticSwitch3 = appendResult10;
			#else
				float3 staticSwitch3 = staticSwitch11;
			#endif
			o.Emission = staticSwitch3;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=18201
1920;-450;1080;1859;1736.613;1903.659;2.189655;True;False
Node;AmplifyShaderEditor.VertexColorNode;2;-1968.113,176.766;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StaticSwitch;14;-1394.734,31.03788;Inherit;False;Property;_Mode_R1;Mode_R;3;0;Create;True;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;13;True;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;15;-1393.227,151.5419;Inherit;False;Property;_Mode_R2;Mode_R;2;0;Create;True;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;12;True;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;16;-1391.92,266.7984;Inherit;False;Property;_Mode_R3;Mode_R;1;0;Create;True;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;11;True;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;7;-1061.24,-10.37969;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;4;-1129.253,-112.4228;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode;8;-1054.001,114.1841;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;13;-838.6095,-74.09834;Inherit;False;Property;_Mode_R;Mode_R;3;0;Create;True;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode;9;-1042.705,235.6101;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;12;-649.8243,47.45971;Inherit;False;Property;_Mode_G;Mode_G;2;0;Create;True;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode;10;-1038.469,375.3911;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;11;-458.4399,143.9967;Inherit;False;Property;_Mode_B;Mode_B;1;0;Create;True;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;3;-238.0141,192.0367;Inherit;False;Property;_Mode_A;Mode_A;0;0;Create;True;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;1;24.0862,151.0862;Float;False;True;-1;2;ASEMaterialInspector;0;0;Unlit;SVTX/Vertex Color;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;14;0;2;1
WireConnection;15;0;2;2
WireConnection;16;0;2;3
WireConnection;7;0;14;0
WireConnection;7;1;15;0
WireConnection;7;2;16;0
WireConnection;4;0;2;0
WireConnection;8;0;14;0
WireConnection;8;1;15;0
WireConnection;8;2;16;0
WireConnection;13;1;4;0
WireConnection;13;0;7;0
WireConnection;9;0;14;0
WireConnection;9;1;15;0
WireConnection;9;2;16;0
WireConnection;12;1;13;0
WireConnection;12;0;8;0
WireConnection;10;0;2;4
WireConnection;10;1;2;4
WireConnection;10;2;2;4
WireConnection;11;1;12;0
WireConnection;11;0;9;0
WireConnection;3;1;11;0
WireConnection;3;0;10;0
WireConnection;1;2;3;0
ASEEND*/
//CHKSM=19642C831E661673068C2979D209388860906886