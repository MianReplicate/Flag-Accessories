local mutatorName = "FlagAccessories"
behaviour(mutatorName)

function FlagAccessories:Awake()
	self.frameworkName = "Custom Flag Framework"
	self.dataContainer = self.gameObject.GetComponent(DataContainer)
	self.CustomMeshes = self.dataContainer.GetGameObjectArray("Mesh")
	self.cover = self.dataContainer.GetTexture("Cover")
	self.name = mutatorName
end

function FlagAccessories:Start()
	local obj = GameObject.Find(self.frameworkName)
	if(obj) then
		self.framework = ScriptedBehaviour.GetScript(obj)
	else
		error("Framework was not found! Please make sure the Custom Flags Framework mutator has been enabled.")
	end

	local customMeshes = self.dataContainer.GetGameObjectArray("Mesh")
	self.CustomMeshes = {}
	for _, mesh in ipairs(customMeshes) do
		table.insert(self.CustomMeshes, mesh.GetComponent(SkinnedMeshRenderer).sharedMesh)
	end
	self.framework:addMeshPack(self)
end