#ifndef _COLLMESH_H
#define _COLLMESH_H

#include "Aabb.h"
#include "collider/GeomTree.h"

class CollMesh {
public:
	CollMesh() : m_radius(0.f), m_geomTree(0) { }
	virtual ~CollMesh() {
		delete m_geomTree;
	}
	virtual Aabb &GetAabb() { return m_aabb; }
	virtual float GetBoundingRadius() const { return m_radius; }
	virtual GeomTree *GetGeomTree() const { return m_geomTree; }
	void SetGeomTree(GeomTree *t) { m_geomTree = t; }

	std::vector<vector3f> m_vertices;
	std::vector<int> m_indices;
	std::vector<unsigned int> m_flags; //1 per triangle
protected:
	Aabb m_aabb;
	float m_radius;
	GeomTree *m_geomTree;
};

#endif
