extends CharacterBody2D

const SPEED = 80
const JUMP_VELOCITY = -300

#Variavel do sprite
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var forma_em_pe: CollisionShape2D = $FormaEmPe 
@onready var forma_no_ar: CollisionShape2D = $FormaNoAr 


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	# Inverte a imagem conforme a direção
	if direction > 0:
		sprite.flip_h = false
	elif direction < 0:
		sprite.flip_h = true
		
		#Troca de estado. no chao, ou anda ou esta parado; no ar, esta pulando.
	if is_on_floor(): 
			if direction > 0: 
					sprite.flip_h = false 
					sprite.play("walk") 
			elif direction < 0: 
					sprite.flip_h = true 
					sprite.play("walk") 
			else: 
					sprite.play("idle") 
	else: 
			sprite.play("jump") 
			
	



	move_and_slide()
