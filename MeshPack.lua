behaviour("MeshPack")

function MeshPack:Awake()
	self.dataContainer = self.gameObject.GetComponent(DataContainer)
	self.cover = self.dataContainer.GetTexture("Cover")
	self.CustomMeshes = {}

	local customMeshes = self.dataContainer.GetGameObjectArray("Mesh")

	for _, mesh in ipairs(customMeshes) do
		local renderer = mesh.GetComponent(SkinnedMeshRenderer)
		table.insert(self.CustomMeshes, {mesh=renderer.sharedMesh, materials=renderer.materials})
	end
end