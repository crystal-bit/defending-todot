extends Resource
class_name EnemyResource

@export var type: EnemyTypes.ENEMY_TYPES
@export var grade: EnemyTypes.GRADE
@export var texture: Texture2D
@export var hp: int
@export var armor: int
@export var regen: int
@export var speed: int
@export var damage: int
@export var money_dropped: int

func get_name():
	match type:
		EnemyTypes.ENEMY_TYPES.SOLDIER:
			return "Soldier"
		EnemyTypes.ENEMY_TYPES.COMMANDO:
			return "Commando"
		EnemyTypes.ENEMY_TYPES.ARMORED_TRANSPORT:
			return "Armoted Transport"
		EnemyTypes.ENEMY_TYPES.TANK:
			return "Tank"
		EnemyTypes.ENEMY_TYPES.AIRCRAFT:
			return "Aircraft"
