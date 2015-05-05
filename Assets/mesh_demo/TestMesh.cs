using UnityEngine;
using System.Collections;

public class TestMesh : MonoBehaviour {

	// Use this for initialization
	void Start () {
		Mesh m = new Mesh();
		m.name = "ScriptedMesh";
		m.vertices = new Vector3[] {
			new Vector3(0.0f,0.0f,0.0f),
			new Vector3(1.0f,0.0f,0.0f),
			new Vector3(0.0f,1.0f,0.0f),
			new Vector3(1.0f,1.0f,0.0f)
		};
		m.uv = new Vector2[] {
			new Vector2 (0.0f, 0.0f),
			new Vector2 (1.0f, 0.0f),
			new Vector2(0.0f, 1.0f),
			new Vector2(1.0f,1.0f)
		};
		m.triangles = new int[] { 0, 1, 2, 2, 1, 3};
		m.RecalculateNormals();
		this.GetComponent<MeshFilter>().mesh = m;
	}
}
