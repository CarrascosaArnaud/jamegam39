extends Node

@onready var rigidBody2D : RigidBody2D = $RigidBody2D
@onready var transform : Node2D = $"."

# speed in px per second
@export var speed = 100
@export var direction : Vector2 = Vector2(0, 1)
@export var follow_rotation : bool = true

func _ready() -> void:
	direction = direction.normalized()
	transform.rotation = atan2(-direction.x, direction.y)

func _process(delta: float) -> void:
	rigidBody2D.linear_velocity = direction * speed * delta * 100
