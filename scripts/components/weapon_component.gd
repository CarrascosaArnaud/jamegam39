extends Node2D

@export var attackDamage : float
@export var knockbackForce : float
@export var stunTime : float

#Ne pas oublier de lier le noeud !
func _on_hitbox_component_area_entered(area):
	if area is HitboxComponent:
		var hitbox : HitboxComponent = area
		var attack = Attack.new()
		attack.attackDamage = attackDamage
		attack.knockbackForce = knockbackForce
		#attack.attackPosition = global_position
		attack.stunTime = stunTime
		hitbox.damage(attack)
