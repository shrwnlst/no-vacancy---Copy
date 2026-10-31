extends CanvasLayer

@export_file("res://canvas_layer.tscn") var first_scene_path: String = "res://Scene1Cutscene/Scene1.tscn"
@onready var color_rect: ColorRect = $ColorRect

func _ready() -> void:
	# Hide the transition overlay at start and set initial factor
	color_rect.visible = false
	color_rect.material.set_shader_parameter("factor", 0.0)
	update_resolution()
	
	# Keep node_resolution updated if the window resizes
	get_viewport().size_changed.connect(update_resolution)

func update_resolution() -> void:
	color_rect.material.set_shader_parameter("node_resolution", color_rect.size)

func play_transition() -> void:
	color_rect.visible = true
	color_rect.material.set_shader_parameter("factor", 0.0)
	
	# Create a tween to animate the shader's 'factor' uniform from 0.0 to 1.0 over 1 second
	var tween = create_tween()
	tween.tween_method(
		func(val): color_rect.material.set_shader_parameter("factor", val),
		0.0, 1.0, 1.0
	)
	
	# Wait for the transition animation to finish, then change scenes
	await tween.finished
	get_tree().change_scene_to_file(first_scene_path)
