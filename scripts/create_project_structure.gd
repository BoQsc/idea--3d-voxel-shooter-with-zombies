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
				
			# Check if README.md exists in the folder, and create it if not
			var readme_path = path + "/README.md"
			if not dir.file_exists(readme_path):
				var file = FileAccess.open(readme_path, FileAccess.WRITE)
				# Use index -1 to get the last element
				file.store_line("# " + folder + " - Folder Documentation")
				file.store_line("This folder contains the resources and assets for the " + folder.split("/")[folder.split("/").size() - 1] + " section of the project.")
				file.close()
				print("📄 Created README.md in: " + folder)
			else:
				print("✔️ README.md already exists in: " + folder)
		
		print("\n🎉 Project structure initialized successfully!")
	else:
		print("❌ Failed to access project directory.")
