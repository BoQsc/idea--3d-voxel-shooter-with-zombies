extends "res://scenes/character_body_3d.gd"
 
func _ready() -> void:
	add_input_actions()

func add_input_actions() -> void:
	var actions = {
		"move_left": KEY_A,
		"move_right": KEY_D,
		"move_forward": KEY_W,
		"move_back": KEY_S,
		"jump": KEY_SPACE
	}
	
	for action in actions.keys():
		if not InputMap.has_action(action):
			var event := InputEventKey.new()
			event.keycode = actions[action]
			InputMap.add_action(action)
			InputMap.action_add_event(action, event)



# Override _physics_process but call the parent function
func _physics_process(delta):
	var input_dir := Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	super._physics_process(delta) # Call the parent function properly
