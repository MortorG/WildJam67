extends Area2D

@export var speed : float
@export var attack_properties : AttackProperties

@onready var anim = $AnimatedSprite2D
var velocity: Vector2 = Vector2.ZERO

func _ready():
	$Timer.start()
	velocity = Vector2.RIGHT.rotated(rotation)

func play_hit_animation():
	velocity = Vector2.ZERO
	anim.play("hit")
	$CollisionShape2D.set_deferred("disabled", true)
	await anim.animation_finished
	self.queue_free()

func _physics_process(delta):
	position += velocity * speed * delta

func _on_timer_timeout():
	self.queue_free()

func _on_area_entered(area):
	var health : HealthComponent = area.owner.get_node_or_null("HealthComponent")
	if health != null:
		health.damage(attack_properties.damage)
	var knockback : KnockbackComponent = area.owner.get_node_or_null("KnockbackComponent")
	if knockback != null:
		knockback.knock_back(Vector2.RIGHT.rotated(rotation), attack_properties.knockback)
	play_hit_animation()

func _on_body_entered(_body):
	play_hit_animation()


