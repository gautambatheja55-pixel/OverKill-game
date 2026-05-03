extends Node2D
var game_over=preload("res://game_over.tscn")
var enemy_scene=preload("res://entities/enemies/area_2d.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_parent().get_node("Boundary").area_entered.connect(_the_end)
	var timer=Timer.new()
	add_child(timer)
	timer.wait_time=1.3
	timer.timeout.connect(_create_enemy)
	timer.start()

func _create_enemy():
	var enemy=enemy_scene.instantiate()
	get_parent().get_node("Enemies").add_child(enemy)
	
func _the_end(body):
	if body is Enemy:
		get_tree().paused=true
		var screen=game_over.instantiate()
		get_tree().root.add_child(screen)
		body.queue_free()
	
		
		
