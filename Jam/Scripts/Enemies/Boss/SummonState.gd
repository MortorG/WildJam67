extends Alive_State

@export var anim : AnimatedSprite2D
@export var summon_scene : PackedScene
@export var summon_locations : Array[Node2D]

var enemy

func _ready():
	enemy = owner as Enemy

func enter():
	anim.play("channel")
	$SummonDelay.start()
	$SummonTime.start()

func summon():
	for loc in summon_locations:
		var s = summon_scene.instantiate() as Enemy
		s.player = enemy.player
		s.global_position = loc.global_position
		owner.get_parent().add_child(s)

func _on_summon_delay_timeout():
	summon()

func _on_summon_time_timeout():
	$SummonDelay.stop()
	$SummonTime.stop()
	transition.emit(self, "idle")
