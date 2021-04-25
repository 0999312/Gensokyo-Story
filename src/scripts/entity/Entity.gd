extends KinematicBody2D

signal Moving

class_name Entity

func _ready()->void:
	connect("Moving", self, "on_Moving")
