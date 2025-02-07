local mutatorName = "FlagAccessories"
behaviour(mutatorName)

function FlagAccessories:Awake()
	self.frameworkName = "Custom Flag Framework"
	self.dataContainer = self.gameObject.GetComponent(DataContainer)
	self.cover = self.dataContainer.GetTexture("Cover")
	self.CustomMeshes = {}
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

	for _, mesh in ipairs(customMeshes) do
		local renderer = mesh.GetComponent(SkinnedMeshRenderer)
		table.insert(self.CustomMeshes, {mesh=renderer.sharedMesh, materials=renderer.materials})
	end
	self.framework:addMeshPack(self)
end