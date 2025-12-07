extends Node3D


@onready var spaceTimeMap0 = $"Cardis/3DMap/r0"
@onready var spaceTimeMap1 = $"Cardis/3DMap/r1"
@onready var spaceTimeMap2 = $"Cardis/3DMap/r2"
@onready var spaceTimeMap3 = $"Cardis/3DMap/r3"

@onready var energyD = $"Cardis/energyDC/rotate"

@onready var idle_me = $"Cardis/CubeChanPc/AnimationPlayer"
@onready var idle_fatih = $"Cardis/fatih/AnimationPlayer"
@onready var idle_easter = $"Cardis/rand/AnimationPlayer"

var spaceTimeMap0_speed = randi_range(-2, 2)
var spaceTimeMap1_speed = randi_range(-2, 2)
var spaceTimeMap2_speed = randi_range(-2, 2)
var spaceTimeMap3_speed = randi_range(-2, 2)

var _Time = randi_range(1, 5)


func _process(delta: float) -> void:
	if _Time > 0:
		_Time -= delta
	else: 
		_Time = randi_range(1, 5)
		spaceTimeMap0_speed = randi_range(-2, 2)
		spaceTimeMap1_speed = randi_range(-2, 2)
		spaceTimeMap2_speed = randi_range(-2, 2)
		spaceTimeMap3_speed = randi_range(-2, 2)

	spaceTimeMap0.rotate_y(spaceTimeMap0_speed * delta)
	spaceTimeMap1.rotate_y(spaceTimeMap1_speed * delta)
	spaceTimeMap2.rotate_y(spaceTimeMap2_speed * delta)
	spaceTimeMap3.rotate_y(spaceTimeMap3_speed * delta)

	energyD.rotate_y(0.1)

	idle_me.play("idle__pcUse")
	idle_fatih.play("idl")
	idle_easter.play("idl")
