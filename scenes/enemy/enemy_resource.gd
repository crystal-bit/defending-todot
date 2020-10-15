extends Resource
class_name EnemyResource

export(EnemyTypes.ENEMY_TYPES) var type
export(EnemyTypes.GRADE) var grade
export(Texture) var texture


func get_name():
	match type:
		EnemyTypes.ENEMY_TYPES.SOLDIER:
			return "Soldier"
		_:
			return "Unknown"
