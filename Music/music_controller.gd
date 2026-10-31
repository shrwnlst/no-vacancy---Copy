extends Node

var menu_music =load("res://2 Something's wrong Loop 2.wav")

func play_music():
	if $Music.stream != menu_music or not $Music.playing:
		$Music.stream = menu_music
		$Music.play()


func stop_music():
	$Music.stop()
