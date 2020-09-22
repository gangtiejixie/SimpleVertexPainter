using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using SVTXPainter;

namespace SVTXPainterEditor
{
    [CustomEditor(typeof(SVTXObject))]
    public class SVTXObjectEditor : Editor
    {
        private string fbxname = "fbx";
        public GameObject[] meshObjs;
        public override void OnInspectorGUI()
        {
            if (GUILayout.Button("Lauch Vertex Painter"))
                SVTXPainterWindow.LauchVertexPainter();



            if (GUILayout.Button("测算顶点距离中心距离"))
            {
                (target as SVTXObject).SetVertexDir();
            }

            //if (GUILayout.Button("FBXExporter"))
            //{
            //    meshObjs = new GameObject[1];
            //    meshObjs[0] = (target as SVTXObject).gameObject;

            //    FBXExporter.ExportFBX("", fbxname, meshObjs, true);
            //}
            EditorGUILayout.Space();

            base.OnInspectorGUI();
        }
    }
}