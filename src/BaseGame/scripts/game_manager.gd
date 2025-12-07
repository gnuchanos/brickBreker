extends Node

var score = 0 # player's score
var level = 1 #player's current level
var life = 3
var stopmusic = false


# add points to score (called from elsewhere)
func addPoints(points):
	score += points
