@tool
extends EditorScript

var folders = [
	"assets/audio", "assets/fonts", "assets/images", "assets/models", "assets/shaders", "assets/video",
	"scenes/characters", "scenes/environment", "scenes/ui", "scenes/effects",
	"scripts/characters", "scripts/gameplay", "scripts/ui", "scripts/utils",
	"resources", "prefabs", "save", "config", "addons"
]

func _run():
	var dir = DirAccess.open("res://")
	if dir:
		for folder in folders:
			var path = "res://" + folder
			if not dir.dir_exists(path):
				dir.make_dir_recursive(path)
				print("✅ Created: " + folder)
			else:
				print("✔️ Already exists: " + folder)
		print("\n🎉 Project structure initialized successfully!")
	else:
		print("❌ Failed to access project directory.")
