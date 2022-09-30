extends Node


func _ready():
	#hardcoded for testing - replace with procedural gen in the future
	var set1 = $Settlement1
	var set2 = $Settlement2
	var set3 = $Settlement3
	
	#set titles
	set1.title = "Settlement1"
	set2.title = "Settlement2"
	set2.title = "Settlement3"

	#set id - might be redundant if nodes already have id built in, but just in case
	set1.id = set1.get_instance_id()
	set2.id = set2.get_instance_id()
	set3.id = set3.get_instance_id()
	
	#starting food stores
	set1.food = 50
	set2.food = 100
	set3.food = 25
	
	#set initial population
	set1.population = 20
	set2.population = 50
	set3.population = 10
