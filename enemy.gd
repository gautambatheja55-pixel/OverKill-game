class_name Enemy
extends Area2D

var speed:int = 150
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize() 
	position=Vector2(randf_range(16,380),0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y+=speed*delta


func _on_area_entered(area: Area2D) -> void:
	if area.name=="bullet_area":
		var explosion= area.get_parent().get_node("Explosion")
		self.visible=false
		area.get_parent().visible=false
		self.set_deferred("monitoring",false)
		self.set_deferred("monitorable",false)
		area.set_deferred("monitoring",false)
		area.set_deferred("monitorable",false)
		explosion.play()
		await explosion.finished
		area.get_parent().queue_free()
		self.queue_free()
		
		
