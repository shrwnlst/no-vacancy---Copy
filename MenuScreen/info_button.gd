extends TextureButton


func _on_pressed() -> void:
	$PressSound.play()
	await $PressSound.finished
	get_tree().change_scene_to_file("res://info_screen.tscn")
	



func _on_mouse_entered() -> void:
	$HoverSound.play()
