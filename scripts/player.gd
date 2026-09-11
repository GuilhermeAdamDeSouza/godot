extends CharacterBody2D

enum PlayerState {
	idle,
	walk,
	jump,
	duck
}

@export var max_jump_count: int = 2
@export var SPEED: float = 150.0
@export var JUMP_VELOCITY: float = -300.0

@onready var collision_shape: CollisionShape2D = $CollisionShape2D
@onready var anim: AnimatedSprite2D = $AnimatedSprite2D

var direction: float = 0.0
var jump_count: int = 0
var status: PlayerState

func _ready() -> void:
	go_to_idle_state()

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	match status:
		PlayerState.idle:
			idle_state()
		PlayerState.walk:
			walk_state()
		PlayerState.jump:
			jump_state()
		PlayerState.duck:
			duck_state()

	move_and_slide()

#FUNÇÕES DE ENTRADA E SAÍDA DE ESTADOS

func go_to_idle_state() -> void:
	status = PlayerState.idle
	anim.play("idle")

func go_to_walk_state() -> void:
	status = PlayerState.walk
	anim.play("walk")

func go_to_duck_state() -> void:
	status = PlayerState.duck
	anim.play("duck")
	collision_shape.shape.radius = 5.0
	collision_shape.shape.height = 10.0
	collision_shape.position.y = 3.0

func exit_from_duck_state() -> void:
	collision_shape.shape.radius = 6.0
	collision_shape.shape.height = 16.0
	collision_shape.position.y = 0.0

func go_to_jump_state() -> void:
	jump_count += 1
	status = PlayerState.jump
	anim.play("jump")
	velocity.y = JUMP_VELOCITY

#LÓGICA DOS ESTADOS (PERMANÊNCIA E TRANSIÇÃO)

func idle_state() -> void:
	move()

	if velocity.x != 0:
		go_to_walk_state()
		return
	if Input.is_action_just_pressed("jump"):
		go_to_jump_state()
		return
	if Input.is_action_pressed("duck"):
		go_to_duck_state()
		return

func walk_state() -> void:
	move()

	if velocity.x == 0:
		go_to_idle_state()
		return
	if Input.is_action_just_pressed("jump"):
		go_to_jump_state()
		return

func duck_state() -> void:
	update_direction()

	if Input.is_action_just_released("duck"):
		exit_from_duck_state()
		go_to_idle_state()
		return

func jump_state() -> void:
	move()

	if Input.is_action_just_pressed("jump") and jump_count < max_jump_count:
		go_to_jump_state()
		return

	if is_on_floor():
		jump_count = 0
		if velocity.x == 0:
			go_to_idle_state()
		else:
			go_to_walk_state()
		return

#FUNÇÕES AUXILIARES

func update_direction() -> void:
	direction = Input.get_axis("left", "right")
	if direction < 0:
		anim.flip_h = true
	elif direction > 0:
		anim.flip_h = false

func move() -> void:
	update_direction()
	if direction != 0:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
