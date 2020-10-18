extends Resource
class_name EnemyResource

export(EnemyTypes.ENEMY_TYPES) var type
export(EnemyTypes.GRADE) var grade
export(Texture) var texture
export(int) var hp
export(int) var armor
export(int) var regen
export(int) var speed
export(int) var damage
export(int) var money_dropped

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
