# extends CharacterBody3D
# 
# func _physics_process(delta: float) -> void:
# 	# Redirect input without modifying original movement logic
# 	var input_dir := Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
# 
# 	# Inject the new input into the original script's logic
# 	set_meta("input_override", input_dir)
# 