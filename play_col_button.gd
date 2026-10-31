extends TextureButton

func _on_pressed():
	disabled = true
	$PressSound.play()
	await $PressSound.finished
	get_tree().change_scene_to_file("res://Scene1Cutscene/Scene1.tscn")
	



func _on_mouse_entered():
	$HoverSound.play()
