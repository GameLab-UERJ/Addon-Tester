@tool
@icon("res://addons/BulletUpHell/Sprites/NodeIcons4.png")
extends NavigationPolygon
## Base classe for all patterns
class_name Pattern

@export var bullet:String = ""		## The [ID] of the [BulletProps]
@export var nbr:int = 1				## Number of bullets to spawn
@export var iterations:int = 1		## Number of times this pattern will spawn bullets. Set to -1 for an infinite loop.

@export_group("Forced Spawning Angle", "pattern_")
@export_range(-999999, 999999, 0.001, "hide_slider", "suffix:°", "radians_as_degrees") var pattern_angle:float = 0.0
@export var pattern_angle_target:NodePath		## Pattern rotation angle in radian. Independant from the bullet's shooting angle.
@export var pattern_angle_mouse:bool = false	## Instead of a forced angle, the mouse cursor will be targeted.
@export_group("Forced Shooting Angle", "forced_")
@export_range(-999999, 999999, 0.001, "hide_slider", "suffix:°", "radians_as_degrees") var forced_angle:float = 0.0	## If ≠ 0 (TODO : change that), all bullets will be shot with that angle, regarding of their own shot angle or the patterns angle above.
@export var forced_target:NodePath				## Instead of a forced angle, the specified node will be targeted.
@export var forced_lookat_mouse:bool = false	## Instead of a forced angle, the mouse cursor will be targeted.
@export var forced_pattern_lookat:bool = true	## When a target is selectionned, if true, the pattern looks at the target and a unique angle is derived from it for all the bullets. If false, all the bullets will target the target upon shooting and their trajectories will all meet at the target's position.

@export_group("Cooldowns", "cooldown_")
@export var cooldown_stasis:bool = false														## bullets are spawned but never shot. Similar to setting the speed to 0, but here, bullets will never go through the code related to movement, unlike bullets with 0 speed.
@export_range(0, 999999, 0.02, "hide_slider", "suffix:s") var cooldown_spawn:float = 1			## cooldown between 2 iterations.
@export_range(0, 999999, 0.02, "hide_slider", "suffix:s") var cooldown_shoot:float = 0			## cooldown between the spawn of all the bullets and the shot.[br] - A `cooldown_shoot` = 0 will make it so it doesn’t wait for all the bullets to spawn in order to start shooting. They will shoot as soon as they’re spawned, unless a `cooldown_next_shoot` is present.
@export_range(0, 999999, 0.02, "hide_slider", "suffix:s") var cooldown_next_spawn:float = 0		## cooldown between 2 bullets of a same iteration ( ex : nbr = 3 → cooldown between 1 & 2 and 2 & 3)
@export_range(0, 999999, 0.02, "hide_slider", "suffix:s") var cooldown_next_shoot:float = 0		## cooldown between 2 shots of a same iteration. Allows for each bullet to be shot at different times.

@export_group("Wait", "wait_")
#enum LATENCE {stay, move, spin, follow, target}
#@export var wait_latence = LATENCE.stay
enum MOMENTUM{None, TRANS_LINEAR,TRANS_SINE,TRANS_QUINT,TRANS_QUART,TRANS_QUAD,TRANS_EXPO,TRANS_ELASTIC,TRANS_CUBIC, \
				TRANS_CIRC,TRANS_BOUNCE,TRANS_BACK}
@export var wait_tween_momentum:MOMENTUM = MOMENTUM.None 	## When the bullet is ready to be shot, it will go in the opposite direction first, as if they’re building momentum before being shot (this is purely visual and doesn’t change anything about the shot). Set to none to disable. Other values are the tween transition types.
@export var wait_tween_length:float = 0						## Distance from the spawn position to which the bullet is gonna go while “building momentum”.
@export var wait_tween_time:float = 0						## Time it’s gonna take for the bullet to reach the total length.

var has_random
var node_target:Node2D
