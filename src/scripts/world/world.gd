extends Node2D

class_name world

export (String, FILE, "*.tscn") var Next_Scene: String

func _ready()->void:
	Hud.visible = true
	PauseMenu.can_show = true
	Time._set_freeze_time(false)

func _on_Button_pressed()->void:
	Game.emit_signal("ChangeScene", Next_Scene)

func _exit_tree()->void:
	Hud.visible = false
	PauseMenu.can_show = false
	Time._set_freeze_time(true)
	Time._set_seconds_elapsed(Time.get_start_time())
