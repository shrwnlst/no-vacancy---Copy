extends Sprite2D

# Lowered sensitivity so it moves much less
@export var sensitivity: float = 0.025

# Lowered the maximum distance it can slide
@export var max_offset: float = 15.0

var target_position: Vector2 = Vector2.ZERO
var original_position: Vector2 = Vector2.ZERO

func _ready() -> void:
	original_position = position

func _process(delta: float) -> void:
	var viewport_size = get_viewport_rect().size
	var mouse_pos = get_viewport().get_mouse_position()
	var center = viewport_size / 2
	
	var mouse_offset = mouse_pos - center
	
	var calculated_offset = mouse_offset * -sensitivity
	calculated_offset.x = clamp(calculated_offset.x, -max_offset, max_offset)
	calculated_offset.y = clamp(calculated_offset.y, -max_offset, max_offset)
	
	target_position = original_position + calculated_offset
	position = position.lerp(target_position, 10.0 * delta)
