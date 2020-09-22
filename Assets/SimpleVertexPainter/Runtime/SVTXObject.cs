using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;
using System.Diagnostics;
using System.Linq;
#if UNITY_EDITOR
using UnityEditor;
#endif
namespace SVTXPainter
{
    [ExecuteInEditMode]
    public class SVTXObject : MonoBehaviour
    {
#if UNITY_EDITOR
        [Serializable]
        public class Record
        {
            // for undo
            public int index = 0;
            public Color[] colors;
        }

        [SerializeField] Record m_record = new Record();
        int m_historyIndex = 0;

        public void PushUndo()
        {

            var mesh = SVTXPainterUtils.GetMesh(gameObject);
            if (mesh != null)
            {
                m_record.index = m_historyIndex;
                m_historyIndex++;
                var colors = mesh.colors;
                m_record.colors = new Color[colors.Length];
                Array.Copy(colors, m_record.colors, colors.Length);
                Undo.RegisterCompleteObjectUndo(this, "Simple Vertex Painter [" + m_record.index + "]");
                //Debug.Log("Change Vertex Color");
            }
        }

        public void OnUndoRedo()
        {
            var mesh = SVTXPainterUtils.GetMesh(gameObject);
            if (mesh == null)
            {
                return;
            }
            if (m_historyIndex != m_record.index)
            {
                m_historyIndex = m_record.index;
                if (m_record.colors != null && mesh.colors != null && m_record.colors.Length == mesh.colors.Length)
                {
                    mesh.colors = m_record.colors;
                    //Debug.Log("UndoRedo");
                }
            }
        }

        private void OnEnable()
        {
            UnityEditor.Undo.undoRedoPerformed += OnUndoRedo;
            UnityEditorInternal.InternalEditorUtility.RepaintAllViews();
        }

        private void OnDisable()
        {
            UnityEditor.Undo.undoRedoPerformed -= OnUndoRedo;
            UnityEditorInternal.InternalEditorUtility.RepaintAllViews();
        }


        public float m_fMaxDistance = 1.0f;
        public Vector3 m_vecPositionOffset = Vector3.zero;

        private void OnDrawGizmos()
        {

            Gizmos.color = Color.blue;
            Gizmos.DrawLine(transform.position +m_vecPositionOffset, transform.localPosition + m_vecPositionOffset + Vector3.one * m_fMaxDistance);
            Gizmos.color = Color.red;
            Gizmos.DrawSphere(transform.position + m_vecPositionOffset, 1);

            

        }

        public void SetVertexDir()
        {
            MeshFilter pMeshFilter = GetComponent<MeshFilter>();
            Mesh pMesh = pMeshFilter.sharedMesh;
            List<Color> colors = pMesh.colors.ToList();
            //colors =  ;// new Color[pMesh.vertices.Length];
            float pDis = 0;
            for (int i = 0; i < pMesh.vertices.Length; i++)
            {
                colors[i] = Color.black;
                float dis = Vector3.Distance(pMesh.vertices[i], transform.localPosition + m_vecPositionOffset);
                if (pDis < dis)
                {
                    pDis = dis;
                }
            }
            m_fMaxDistance = pDis;
            UnityEngine.Debug.Log("Max  dis:"+pDis);

            for (int i = 0; i < pMesh.vertices.Length; i++)
            {
                //colors[i] = Color.black;
                Color temp = pMesh.colors[i];
               // UnityEngine.Debug.Log("R:" + pMesh.colors[i].r);
                float dis = Vector3.Distance(pMesh.vertices[i], transform.localPosition + m_vecPositionOffset);
                temp.g = Mathf.Abs(dis) / m_fMaxDistance;
                colors[i] = temp;
                //UnityEngine.Debug.LogFormat("dis:{0}size:{1}",dis, colors[i].g);
            }
            pMesh.SetColors(colors);
            pMeshFilter.sharedMesh = pMesh;
        }


#endif
    }
}
