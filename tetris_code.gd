extends Node2D

#========================= CONSTANTE =========================
const TAILLE_CASE := 20
const LARGEUR_GRILLE := 22
const HAUTEUR_GRILLE := 44
const SCREEN_WIDTH := 538
const SCREEN_HEIGHT := 1082
const VITESSE_JEU := 0.5

#========================= COULEUR DE BASE =========================
const BLACK := Color(0, 0, 0)
const WHITE := Color(1, 1, 1)
const GREY := Color(0.5, 0.5, 0.5)
const LIGHT_GREY := Color(0.75, 0.75, 0.75)
const CYAN := Color(0.55, 0.95, 0.95)
const YELLOW := Color(1.0, 0.95, 0.55)
const MAGENTA := Color(1.0, 0.60, 0.90)
const GREEN := Color(0.55, 0.90, 0.65)
const RED := Color(1.0, 0.55, 0.55)
const DARK_BLUE := Color(0.40, 0.50, 0.80)
const ORANGE := Color(1.0, 0.80, 0.55)

#========================= PACKS DE COULEURS =========================
const PACKS_COULEURS := {
	"Flashy": [
		Color(1.0, 0.0, 1.0, 1.0), Color(0.0, 1.0, 1.0, 1.0),
		Color(1.0, 1.0, 0.0, 1.0), Color(1.0, 0.0, 0.4, 1.0),
		Color(0.0, 1.0, 0.4, 1.0), Color(0.5, 0.0, 1.0, 1.0),
		Color(1.0, 0.5, 0.0, 1.0),
	],
	"Pastel": [
		Color(0.65, 0.45, 0.75, 1.0), Color(1.0, 0.55, 0.55, 1.0),
		Color(0.55, 0.90, 0.65, 1.0), Color(0.55, 0.70, 1.0, 1.0),
		Color(0.55, 0.95, 0.95, 1.0), Color(1.0, 0.60, 0.90, 1.0),
		Color(1.0, 0.95, 0.55, 1.0),
	],
	"Glace": [
		Color(0.75, 0.92, 1.0, 1.0), Color(0.85, 0.95, 1.0, 1.0),
		Color(0.60, 0.85, 0.95, 1.0), Color(0.80, 0.88, 1.0, 1.0),
		Color(0.70, 0.95, 0.90, 1.0), Color(0.90, 0.95, 1.0, 1.0),
		Color(0.65, 0.80, 1.0, 1.0),
	],
	"Neon": [
		Color(0.0, 1.0, 0.2, 1.0), Color(1.0, 0.08, 0.58, 1.0),
		Color(0.0, 0.8, 1.0, 1.0), Color(1.0, 0.4, 0.0, 1.0),
		Color(0.8, 0.0, 1.0, 1.0), Color(1.0, 1.0, 0.0, 1.0),
		Color(0.0, 1.0, 0.8, 1.0),
	],
	"Feu": [
		Color(1.0, 0.95, 0.2, 1.0), Color(1.0, 0.65, 0.0, 1.0),
		Color(1.0, 0.3, 0.0, 1.0), Color(0.9, 0.1, 0.1, 1.0),
		Color(1.0, 0.85, 0.4, 1.0), Color(1.0, 0.5, 0.1, 1.0),
		Color(0.7, 0.05, 0.05, 1.0),
	],
	"Galaxy": [
		Color(0.4, 0.0, 0.8, 1.0), Color(0.1, 0.0, 0.5, 1.0),
		Color(0.7, 0.3, 1.0, 1.0), Color(0.2, 0.4, 0.9, 1.0),
		Color(0.9, 0.5, 1.0, 1.0), Color(0.1, 0.6, 0.8, 1.0),
		Color(0.5, 0.0, 0.6, 1.0),
	],
	"Automne": [
		Color(0.8, 0.35, 0.05, 1.0), Color(0.9, 0.6, 0.1, 1.0),
		Color(0.6, 0.2, 0.05, 1.0), Color(0.95, 0.75, 0.3, 1.0),
		Color(0.7, 0.45, 0.1, 1.0), Color(0.55, 0.15, 0.05, 1.0),
		Color(0.85, 0.5, 0.15, 1.0),
	],
	"Matrix": [
		Color(0.0, 1.0, 0.2, 1.0), Color(0.0, 0.8, 0.1, 1.0),
		Color(0.2, 1.0, 0.4, 1.0), Color(0.0, 0.6, 0.08, 1.0),
		Color(0.4, 1.0, 0.5, 1.0), Color(0.0, 0.9, 0.3, 1.0),
		Color(0.1, 0.7, 0.15, 1.0),
	],
	"Retro": [
		Color(0.95, 0.60, 0.10, 1.0), Color(0.80, 0.20, 0.10, 1.0),
		Color(0.95, 0.90, 0.20, 1.0), Color(0.10, 0.50, 0.80, 1.0),
		Color(0.85, 0.40, 0.10, 1.0), Color(0.20, 0.70, 0.30, 1.0),
		Color(0.70, 0.10, 0.30, 1.0),
	],
	"Vaporwave": [
		Color(1.0, 0.40, 0.80, 1.0), Color(0.60, 0.20, 1.0, 1.0),
		Color(0.10, 0.90, 0.90, 1.0), Color(1.0, 0.70, 0.20, 1.0),
		Color(0.80, 0.10, 0.70, 1.0), Color(0.30, 0.80, 1.0, 1.0),
		Color(1.0, 0.20, 0.50, 1.0),
		
	],
}

const NOMS_PACKS := ["Flashy","Pastel","Glace","Neon","Feu","Galaxy","Automne","Matrix","Retro","Vaporwave"]
const PRIX_PACK := 500
const PACK_GRATUIT := "Flashy"

#========================= PIECES(FORME) =========================
const MODELES_PIECES := [
	[[1,1,1,1]],  # I
	[[1,1],[1,1]],  # O
	[[1,1,1],[0,1,0]],  # T
	[[1,0],[1,0],[1,1]],  # L
	[[0,1],[0,1],[1,1]],  # J
	[[0,1,1],[1,1,0]],  # Z
	[[1,1,0],[0,1,1]],  # S
]
# Si pièce cogne un mur, le jeu teste ces coordonnées pour la décaler un peu sans bloquer la rotation
const WALL_KICK_OFFSETS := [
	[0,0],[1,0],[-1,0],[2,0],[-2,0],[0,-1],[1,-1],[-1,-1],[0,1]
]

#========================= ÉTATS =========================
const ETAT_MENU := 0
const ETAT_JEU := 1
const ETAT_MAGASIN := 2
const ETAT_FIN_GAME := 3
const ETAT_CREDITS := 4
const ETAT_MODE_SEL := 5
const ETAT_reglage_menu := 6
const ETAT_SCOREBOARD := 7
var etat_actuel := ETAT_MENU

#========================= MODES DE JEU =========================
const MODE_CLASSIQUE := 0
const MODE_BLITZ := 1
const MODE_SURVIVAL := 2
const NOMS_MODES := ["CLASSIQUE", "BLITZ", "SURVIVAL"]
const BLITZ_DUREE := 120.0
var mode_jeu : int = MODE_CLASSIQUE  # mode de jeu séléctionné
var mode_sel_index : int = 0  # index dans le mode de selection
var blitz_timer : float = 0.0

#========================= GRILLE =========================
var grille : Array = []

#========================= PIECE COURANTE =========================
var piece_modele : Array = []
var piece_couleur : Color = BLACK
var piece_x = 0
var piece_y = 0
var suivante_modele : Array = []  # forme de la prochaine pièce
var suivante_couleur : Color = BLACK

#========================= PACK  =========================
var pack_index : int = 0
var couleurs_actives : Array = []

#========================= LOGIQUE =========================
var en_cours = false
var en_pause = false
var temps_acc = 0.0
var niveau = 1
var vitesse_actuelle = VITESSE_JEU

#========================= MESSAGE =========================
var message_special = ""
var message_timer = 0.0
var file_messages = []
var lignes_en_flash = []
var flash_timer = 0.0
var menu_reglages_ouvert := false

#========================= MATRIX RAIN =========================
var matrix_colonnes : Array = []
var matrix_timer : float = 0.0
const MATRIX_CHARS := ["0","1","2","3","4","5","6","7","8","9"]

#========================= SCORE & PIECES =========================
var score = 0
var score_ajoute : int = 0
var score_timer : float = 0.0
var pieces_gagnees_partie : int = 0
var pieces_monnaie : int = 0

#========================= SAUVEGARDE =========================
# high_scores_par_mode : {"classique": int, "blitz": int, "survival": int}
var high_score : int = 0 
var high_scores_par_mode : Dictionary = {
	"classique": 0, "blitz": 0, "survival": 0
}
var packs_debloques : Array = [PACK_GRATUIT]
const SAVE_PATH := "user://save.dat"
const OLD_SAVE_PATH := "user://highscore.save"

#========================= MAGASIN =========================
var magasin_index : int = 0

#========================= EFFETS VISUELS =========================
var shake_timer : float = 0.0
var shake_intensity : float = 0.0
var original_position : Vector2 = Vector2.ZERO

#========================= POLICE =========================
var police : Font = null
var police_normal : Font = null

#========================= PSEUDO & SCOREBOARD =========================
var pseudo : String = ""
var pseudo_en_saisie := false
var line_edit_pseudo : LineEdit = null
var scoreboard_data : Dictionary = {"classique": [], "blitz": [], "survival": []}
var scoreboard_page : int = 0  # 0=classique, 1=blitz, 2=survival
var scoreboard_charge := false
var scoreboard_en_attente := false  # en train d'envoyer score
var boutons_scoreboard : Array = []
var boutons_pseudo : Array = []

#========================= SILENTW0LF CONFIG =========================
const SW_API_KEY := "emGrVjBT5O5nhoWhOxmHY6ILv0406FnE8V4dNqE4"
const SW_GAME_ID := "Adventure_P8"
const SW_BASE_URL := "https://api.silentwolf.com"

#========================= MUSIQUE =========================
var musique_menu : AudioStreamPlayer
var musique_jeu : AudioStreamPlayer
var dest_ligne : AudioStreamPlayer
var audio_rotation : AudioStreamPlayer
var musique_gameover : AudioStreamPlayer
var vol_musique_index := 8
var vol_sfx_index := 8
var curseur_pause := 0

# ==============================================================
# BOUTONS TACTILES
# Chaque bouton est 1 Rect2 + action associée.
# On stocke tout dans 1 Array pour simplifié dessin
# la détection de touch en une seule boucle.
# ==============================================================
var boutons_jeu : Array = [] # boutons pendant la partie
var boutons_menu : Array = [] # boutons du menu principal
var boutons_mode : Array = [] # boutons sélection mode
var boutons_magasin : Array = [] # boutons dans le magasin
var boutons_fin : Array = [] # boutons écran fin
var boutons_credits : Array = [] # boutons crédits
var boutons_pause : Array = [] # boutons pendant la pause(jeu)
var boutons_reglage : Array = [] # boutons pendant la pause(menu)

# Suivi touch actif pour éviter les doubles détections
var touch_ids_actifs : Dictionary = {} # index_touch → action déclenchée

# Scrollbar magasin
var mag_scroll_touch_id : int = -1 # index du doigt en train de scroller
var mag_scroll_start_y : float = 0.0 # position y au début du scroll
var mag_scroll_start_idx : int = 0 # magasin_index au début du scroll
const MAG_SCROLL_BAR_X := 510 # x de la barre de scroll
const MAG_SCROLL_BAR_W := 28 # largeur de la barre

func _initialiser_boutons() -> void:
	# BOUTONS DE JEU (en bas droite, semi-transparents)
	var gap := 4
	boutons_jeu = [
		{"rect": Rect2(10,980, 100, 100), # (x,y,Largeur,hauteur)
		"label": "GAU",                # texte affiché
		"action": "gauche",            # ce qui se passe si on appuie
		"couleur": Color(0.3,0.3,0.6, 1), # couleur de fond
		"forme": "cercle"}, # Forme du bouton
		{"rect": Rect2(70, 885, 100, 100), "label": "BAS", "action": "bas", "couleur": Color(0.3,0.3,0.6, 1), "forme": "cercle"},
		{"rect": Rect2(420, 980, 100, 100), "label": "DRO", "action": "droite", "couleur": Color(0.3,0.3,0.6, 1), "forme": "cercle"},
		{"rect": Rect2(360, 885, 100, 100), "label": "TOURN", "action": "tourner", "couleur": Color(0.026, 0.787, 0.103, 1.0), "forme": "cercle"},
		{"rect": Rect2(210, 940, 100, 100), "label": "DROP", "action": "drop", "couleur": Color(1.0, 0.0, 0.0, 1.0), "forme": "cercle"},
		{"rect": Rect2(0, 0, 100, 100), "label": "PAUSE", "action": "pause", "couleur": Color(0.2,0.2,0.2, 0.6), "forme": "rectangle"},
	]

	# ──── BOUTONS MENU PRINCIPAL ────
	boutons_menu = [
		{"rect": Rect2(60, 520, 418, 65), "label": "JOUER", "action": "jouer", "couleur": Color(0.651, 0.604, 0.0, 1.0)},
		{"rect": Rect2(60, 600, 418, 65), "label": "MAGASIN", "action": "magasin", "couleur": Color(0.833, 0.0, 0.456, 1.0)},
		{"rect": Rect2(60, 680, 418, 65), "label": "SCOREBOARD", "action": "ouvrir_scoreboard", "couleur": Color(0.0, 0.45, 0.6, 1.0)},
		{"rect": Rect2(60, 760, 418, 65), "label": "CREDITS", "action": "credits", "couleur": Color(0.25, 0.226, 1.0, 1.0)},
		{"rect": Rect2(0, 100, 85, 65), "label": "REGLAGE", "action": "reglage_menu", "couleur": Color(0.2, 0.2, 0.2, 0.369)},
	]
	# ──── BOUTONS SÉLECTION MODE ────
	boutons_mode = [
		{"rect": Rect2(60, 370, 418, 80), "label": "CLASSIQUE:  Max  de  points", "action": "mode_0", "couleur": Color(0.21, 0.632, 0.0, 1.0)},
		{"rect": Rect2(60, 470, 418, 80), "label": "BLITZ:  Score  max  en  120 sec", "action": "mode_1", "couleur": Color(0.837, 0.399, 0.0, 1.0)},
		{"rect": Rect2(60, 570, 418, 80), "label": "SURVIVAL: Grille  preremplie", "action": "mode_2", "couleur": Color(0.549, 0.0, 0.639, 1.0)},
		{"rect": Rect2(60, 700, 418, 60), "label": "RETOUR", "action": "retour", "couleur": Color(0.15,0.15,0.15)},
	]
	
	# ──── BOUTONS MAGASIN ────
	boutons_magasin = [
		{"rect": Rect2(60, SCREEN_HEIGHT - 200, 418, 70), "label": "ACHETER / SELECTIONNER", "action": "acheter", "couleur": Color(0.3,0.25,0.0)},
		{"rect": Rect2(60, SCREEN_HEIGHT - 115, 418, 70), "label": "RETOUR AU MENU", "action": "retour", "couleur": Color(0.15,0.15,0.15)},
	]

# ──── BOUTONS FIN DE PARTIE ────
	boutons_fin = [
		{"rect": Rect2(60, 770, 418, 80), "label": "RETOUR AU MENU", "action": "retour_menu", "couleur": Color(0.1,0.2,0.1)},
	]

	# ──── BOUTONS CRÉDITS ────
	boutons_credits = [
		{"rect": Rect2(60, SCREEN_HEIGHT - 140, 418, 80), "label": "RETOUR AU MENU", "action": "retour", "couleur": Color(0.15,0.15,0.15)},
	]
	

	# ──── BOUTONS PAUSE JEU ────
	boutons_pause = [
		{"rect": Rect2(60, 750, 418, 80), "label": "REPRENDRE", "action": "reprendre", "couleur": Color(0.1,0.3,0.1)},
		# Volume musique
		{"rect": Rect2(60, 430, 60, 50), "label": "-", "action": "vol_m_moins", "couleur": Color(0.2,0.2,0.2)},
		{"rect": Rect2(400, 430, 60, 50), "label": "+", "action": "vol_m_plus", "couleur": Color(0.2,0.2,0.2)},
		# Volume SFX
		{"rect": Rect2(60, 560, 60, 50), "label": "-", "action": "vol_s_moins", "couleur": Color(0.2,0.2,0.2)},
		{"rect": Rect2(400, 560, 60, 50), "label": "+", "action": "vol_s_plus", "couleur": Color(0.2,0.2,0.2)},
		# Retour au menu (uniquement si pas en partie)
		{"rect": Rect2(60, 850, 418, 70), "label": "RETOUR AU MENU", "action": "retour_depuis_pause", "couleur": Color(0.2,0.1,0.1)},
	]
	# ──── BOUTONS SCOREBOARD ────
	_maj_boutons_scoreboard()

	# ──── BOUTONS PSEUDO ────
	boutons_pseudo = [
		{"rect": Rect2(60, 700, 418, 80), "label": "VALIDER", "action": "valider_pseudo", "couleur": Color(0.1,0.35,0.1)},
		{"rect": Rect2(60, 800, 418, 70), "label": "RETOUR", "action": "retour", "couleur": Color(0.15,0.15,0.15)},
	]

	# ──── BOUTONS PAUSE MENU ────
	boutons_reglage = [
		{"rect": Rect2(60, 310, 418, 70), "label": "", "action": "ouvrir_pseudo", "couleur": Color(0,0,0,0)},
		{"rect": Rect2(60, 480, 60, 50), "label": "-", "action": "vol_m_moins", "couleur": Color(0.2,0.2,0.2)},
		{"rect": Rect2(400, 480, 60, 50), "label": "+", "action": "vol_m_plus", "couleur": Color(0.2,0.2,0.2)},
		{"rect": Rect2(60, 610, 60, 50), "label": "-", "action": "vol_s_moins", "couleur": Color(0.2,0.2,0.2)},
		{"rect": Rect2(400, 610, 60, 50), "label": "+", "action": "vol_s_plus", "couleur": Color(0.2,0.2,0.2)},
		{"rect": Rect2(60, 780, 418, 80), "label": "RETOUR AU MENU", "action": "fermer_reglages", "couleur": Color(0.15,0.15,0.15)},
	]
# ==============================================================
# INITIALISATION
# ==============================================================
func _ready() -> void:
	# Config écran 
	get_tree().root.content_scale_size = Vector2i(SCREEN_WIDTH, SCREEN_HEIGHT)
	DisplayServer.window_set_size(Vector2i(SCREEN_WIDTH, SCREEN_HEIGHT))
	get_tree().root.content_scale_mode = Window.CONTENT_SCALE_MODE_CANVAS_ITEMS
	get_tree().root.content_scale_aspect = Window.CONTENT_SCALE_ASPECT_KEEP

	# Centre fenêtre de jeu au milieu de l'écran de l'appareil
	var screen_center = DisplayServer.screen_get_position() + DisplayServer.screen_get_size() / 2
	DisplayServer.window_set_position(screen_center - DisplayServer.window_get_size() / 2)
	pseudo = ""

	_charger_save()
	_initialiser_boutons()

	# GENERE UN PSEUDO
	if pseudo == "" or pseudo == "CHARGEMENT":
		pseudo = "CHARGEMENT"
		var numero_aleatoire := randi_range(1, 999999) # nombre entier entre 1 et 999999
		pseudo = "PLAYER_" + str(numero_aleatoire)
		_sauvegarder()
	else:
		if line_edit_pseudo:
			line_edit_pseudo.text = pseudo
			
	# LineEdit invisible pour activer le clavier mobile
	line_edit_pseudo = LineEdit.new()
	line_edit_pseudo.position = Vector2(0, -200)
	line_edit_pseudo.size = Vector2(1, 1)
	line_edit_pseudo.text = pseudo
	line_edit_pseudo.max_length = 13
	line_edit_pseudo.visible = true  # doit être visible pour recevoir le focus
	line_edit_pseudo.modulate = Color(0, 0, 0, 0)  # transparent
	line_edit_pseudo.text_changed.connect(_on_pseudo_changed)
	line_edit_pseudo.text_submitted.connect(_on_pseudo_submitted)
	add_child(line_edit_pseudo)

	police = load("res://arcadeclassic.ttf")
	police_normal = ThemeDB.fallback_font
	if police == null:
		police = police_normal

	musique_menu = AudioStreamPlayer.new()
	musique_menu.stream = load("res://menu.ogg")
	musique_menu.volume_db = -10.0
	add_child(musique_menu)

	musique_jeu = AudioStreamPlayer.new()
	musique_jeu.stream = load("res://jeu.ogg")
	musique_jeu.volume_db = -15.0
	add_child(musique_jeu)

	audio_rotation = AudioStreamPlayer.new()
	audio_rotation.stream = load("res://rotation.ogg")
	audio_rotation.volume_db = -15.0
	add_child(audio_rotation)

	musique_gameover = AudioStreamPlayer.new()
	musique_gameover.stream = load("res://Game_OVER.ogg")
	musique_gameover.volume_db = -15.0
	add_child(musique_gameover)

	dest_ligne = AudioStreamPlayer.new()
	dest_ligne.stream = load("res://destruction.ogg")
	dest_ligne.volume_db = -15.0
	add_child(dest_ligne)

	musique_menu.play()

	# Init colonne Matrix rain
	for c in range(SCREEN_WIDTH / 14):
		matrix_colonnes.append({
			"y": randi() % SCREEN_HEIGHT,
			"speed": randf_range(80, 220),
			"chars": [],
			"len": 8 + randi() % 14
		})
		
# ==============================================================
# SAUVEGARDE
# ==============================================================
func _sauvegarder() -> void:
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	file.store_var(high_score)
	file.store_var(pieces_monnaie)
	file.store_var(packs_debloques)
	file.store_var(high_scores_par_mode)
	file.store_var(pseudo)

func _charger_save() -> void:
	if FileAccess.file_exists(OLD_SAVE_PATH):
		var old_file = FileAccess.open(OLD_SAVE_PATH, FileAccess.READ)
		high_score = old_file.get_var()
		DirAccess.remove_absolute(OLD_SAVE_PATH)

	if FileAccess.file_exists(SAVE_PATH):
		var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
		var highscore = file.get_var()
		var piece = file.get_var()
		var packdeb = file.get_var()
		var highmode = file.get_var() # scores par mode (peut être null si ancien save)
		if highscore is int: high_score = max(high_score, highscore)
		if piece is int: pieces_monnaie = piece
		if packdeb is Array: packs_debloques = packdeb
		if highmode is Dictionary: high_scores_par_mode = highmode


		# on vérifie qu'on n'a pas atteint la fin du fichier avant de lire, pour éviter une erreur 
		# avec les anciens fichiers de sauvegarde qui ne contenaient pas encore le pseudo.

		var ps = file.get_var() if not file.eof_reached() else ""
		if ps is String and ps.length() > 0: pseudo = ps

	if not PACK_GRATUIT in packs_debloques:
		packs_debloques.append(PACK_GRATUIT)

	_sync_high_score()


func _sync_high_score() -> void:
	# Synchronise high_score avec mode actuel pour l'affichage
	var cle = _cle_mode(mode_jeu)
	high_score = high_scores_par_mode.get(cle, 0)

func _cle_mode(mode: int) -> String:
	# return dans quelle mode on est
	match mode:
		MODE_CLASSIQUE: return "classique"
		MODE_BLITZ: return "blitz"
		MODE_SURVIVAL: return "survival"
	return "classique"

# ==============================================================
# DÉMARRAGE PARTIE
# ==============================================================
func _demarrer_partie() -> void:
	musique_gameover.stop()
	musique_menu.stop()
	musique_jeu.play()
	score = 0
	niveau = 1
	vitesse_actuelle = VITESSE_JEU
	en_cours = true
	en_pause = false
	etat_actuel = ETAT_JEU
	pieces_gagnees_partie = 0
	couleurs_actives = PACKS_COULEURS[NOMS_PACKS[pack_index]]

	if mode_jeu == MODE_BLITZ:
		blitz_timer = BLITZ_DUREE

	_init_grille()

	if mode_jeu == MODE_SURVIVAL:
		_remplir_grille_survival()

	_nouvelle_piece_suivante()
	_spawn_piece()
	_sync_high_score()

# ==============================================================
# GRILLE
# ==============================================================
func _init_grille() -> void:
	grille = []
	for _y in range(HAUTEUR_GRILLE):
		var ligne : Array = []
		for _x in range(LARGEUR_GRILLE):
			ligne.append(BLACK)
		grille.append(ligne)

func _remplir_grille_survival() -> void:
	var cols = PACKS_COULEURS[NOMS_PACKS[pack_index]]
	for y in range(HAUTEUR_GRILLE- 20, HAUTEUR_GRILLE - 1):
		var trou = randi() % (LARGEUR_GRILLE -8) + 6 
		for x in range(6, LARGEUR_GRILLE - 1):
			if x != trou:
				grille[y][x] = cols[randi() % cols.size()]

	
# ==============================================================
# PIÈCES
# ==============================================================
func _nouvelle_piece_suivante() -> void:
	var idx := randi() % MODELES_PIECES.size()
	suivante_modele = _copie_modele(MODELES_PIECES[idx])
	suivante_couleur = couleurs_actives[randi() % couleurs_actives.size()]

func _spawn_piece() -> void:
	piece_modele = _copie_modele(suivante_modele)
	piece_couleur = suivante_couleur
	piece_x = (LARGEUR_GRILLE / 2) - (piece_modele[0].size() / 2) + 3
	piece_y = 0
	_nouvelle_piece_suivante()
	if _detecte_collision(piece_modele, piece_x, piece_y):
		_fin_de_partie()

func _copie_modele(modele: Array) -> Array:
	var copie : Array = []
	for ligne in modele:
		copie.append(ligne.duplicate())
	return copie

func _rotation(modele: Array) -> Array:
	var inverse := modele.duplicate(false)
	inverse.reverse() #reverse la pièce
	var rows := inverse.size()
	var cols := (inverse[0] as Array).size() #met ligne en coloone, collone en ligne
	var res : Array = []
	for c in range(cols):
		var nl : Array = []
		for r in range(rows):
			nl.append(inverse[r][c])
		res.append(nl)
	return res

func _rotation_avec_wall_kick() -> void:
	var tourne := _rotation(piece_modele)
	# test si xall kick possible
	for offset in WALL_KICK_OFFSETS:
		var nx = piece_x + offset[0]
		var ny = piece_y + offset[1]
		if not _detecte_collision(tourne, nx, ny):
			piece_modele = tourne
			piece_x = nx
			piece_y = ny
			audio_rotation.play()
			return

# ==============================================================
# FIN DE PARTIE
# ==============================================================
func _fin_de_partie() -> void:
	en_cours = false
	musique_jeu.stop()
	musique_gameover.play()

	pieces_gagnees_partie = mini(score / 80, 30)
	pieces_monnaie += pieces_gagnees_partie

	# Mise à jour du highscore du mode joué
	var cle = _cle_mode(mode_jeu)
	if score > high_scores_par_mode.get(cle, 0):
		high_scores_par_mode[cle] = score
		high_score = score
	_sauvegarder()

	# Envoyer score en ligne si pseudo défini et mode classique/blitz/survival
	var cle2 = _cle_mode(mode_jeu)
	if pseudo.length() > 0 and mode_jeu in [MODE_CLASSIQUE, MODE_BLITZ, MODE_SURVIVAL] and score > 0:
		_envoyer_score_sw(cle2, score)

	etat_actuel = ETAT_FIN_GAME

# ==============================================================
# COLLISION
# ==============================================================
func _detecte_collision(modele: Array, px: int, py: int) -> bool:
	for y in range(modele.size()):
		for x in range(modele[y].size()):
			if modele[y][x] == 1:
				var nx := px + x
				var ny := py + y
				if nx < 6 or nx >= LARGEUR_GRILLE - 1 or ny >= HAUTEUR_GRILLE - 1:
					return true
				if ny >= 0 and ny < HAUTEUR_GRILLE and grille[ny][nx] != BLACK:
					return true
	return false

# ==============================================================
# LIGNES
# ==============================================================
func _installe_piece() -> void:
	for y in range(piece_modele.size()):
		for x in range(piece_modele[y].size()):
			if piece_modele[y][x] == 1:
				grille[piece_y + y][piece_x + x] = piece_couleur
	score += 50
	score_ajoute = 50
	score_timer = 1.0
	_appliquer_secousse(2.0, 0.1)

func _supprime_lignes_si_remplies() -> void:
	var a_effacer = []
	for i in range(HAUTEUR_GRILLE - 1):
		var pleine := true
		for j in range(6, LARGEUR_GRILLE - 1):
			if grille[i][j] == BLACK:
				pleine = false
				break
		if pleine:
			a_effacer.append(i)
	if a_effacer.size() > 0:
		lignes_en_flash = a_effacer
		flash_timer = 0.3
	else:
		_spawn_piece()

func _nettoyage_reel_des_lignes() -> void:
	var n = lignes_en_flash.size()
	if n > 0:
		dest_ligne.pitch_scale = 0.75 if n == 4 else 1.0
		dest_ligne.play()
		_appliquer_secousse(n * 4.0, 0.3)
		for y_l in lignes_en_flash:
			_creer_particules_ligne(y_l)

	var ng : Array = []
	for i in range(HAUTEUR_GRILLE - 1):
		if not i in lignes_en_flash:
			ng.append(grille[i])
	for _k in range(n):
		var lv = []
		for _x in range(LARGEUR_GRILLE): 
			lv.append(BLACK)
		ng.insert(0, lv)
	ng.append(grille[HAUTEUR_GRILLE - 1])
	grille = ng

	var gain = 0
	match n:
		1: gain = 400
		2: gain = 600
		3:
			gain = 800
			_declencher_message("EXCELLENT !")
		4:
			gain = 1200
			_declencher_message("TETRIS !!!")
	score += gain
	score_ajoute = gain
	score_timer = 1.5
	if score > high_score and high_score != 0:
		_declencher_message("NOUVEAU RECORD !")
		_appliquer_secousse(10.0, 0.5)

	lignes_en_flash = []
	flash_timer = 0
	_check_niveau()
	_spawn_piece()

# ==============================================================
# EFFETS
# ==============================================================
func _appliquer_secousse(intensite: float, duree: float) -> void:
	shake_intensity = intensite
	shake_timer = duree
	original_position = position

func _creer_particules_ligne(y_grille: int) -> void:
	var p = CPUParticles2D.new()
	add_child(p)
	p.position = Vector2(SCREEN_WIDTH / 2, y_grille * TAILLE_CASE)
	p.amount = 30
	p.explosiveness = 1.0
	p.emission_shape = CPUParticles2D.EMISSION_SHAPE_RECTANGLE
	p.emission_rect_extents = Vector2(SCREEN_WIDTH / 2, 2)
	p.spread = 180.0
	p.gravity = Vector2(0, 300)
	p.initial_velocity_min = 50.0
	p.initial_velocity_max = 150.0
	p.scale_amount_min = 2.0
	p.scale_amount_max = 5.0
	p.color = WHITE
	p.one_shot = true
	p.emitting = true
	get_tree().create_timer(2.0).timeout.connect(p.queue_free)
	
	
func _appliquer_volumes() -> void:
	var db_m = -80.0 if vol_musique_index == 0 else (vol_musique_index - 10) * 4.0
	var db_s = -80.0 if vol_sfx_index == 0 else (vol_sfx_index - 10) * 4.0
	musique_menu.volume_db = db_m
	musique_jeu.volume_db = db_m
	dest_ligne.volume_db = db_s
	audio_rotation.volume_db = db_s
	musique_gameover.volume_db = db_s


# ==============================================================
# BOUCLE DE JEU
# ==============================================================
func _process(delta: float) -> void:
	if shake_timer > 0:
		shake_timer -= delta
		position = original_position + Vector2(randf_range(-1, 1), randf_range(-1, 1)) * shake_intensity
	else:
		position = original_position

	# Matrix rain toujours animé
	matrix_timer += delta
	if matrix_timer >= 0.06:
		matrix_timer = 0.0
		for col in matrix_colonnes:
			col["y"] += int(col["speed"] * 0.06)
			if col["y"] > SCREEN_HEIGHT + 200:
				col["y"] = -randi() % 200
			var c : String = MATRIX_CHARS[randi() % MATRIX_CHARS.size()]
			col["chars"] = [c] + (col["chars"] if col["chars"].size() < col["len"] else col["chars"].slice(0, col["len"] - 1))

	if etat_actuel != ETAT_JEU:
		queue_redraw()
		return

	if not en_cours or en_pause:
		musique_jeu.stop()
		queue_redraw()
		return

	if flash_timer > 0:
		flash_timer -= delta
		if flash_timer <= 0:
			_nettoyage_reel_des_lignes()
		queue_redraw()
		return

	if mode_jeu == MODE_BLITZ:
		blitz_timer -= delta
		if blitz_timer <= 0:
			blitz_timer = 0
			_fin_de_partie()
			return

	temps_acc += delta
	if temps_acc >= vitesse_actuelle:
		temps_acc = 0.0
		_descente_auto()

	if score_timer > 0: 
		score_timer -= delta
	if score_timer <= 0: 
		score_ajoute = 0
	if message_timer > 0:
		message_timer -= delta
	elif file_messages.size() > 0:
		message_special = file_messages.pop_front()
		message_timer = 1.5
	queue_redraw()

func _descente_auto() -> void:
	if not _detecte_collision(piece_modele, piece_x, piece_y + 1):
		piece_y += 1
	else:
		_installe_piece()
		_supprime_lignes_si_remplies()

func _check_niveau() -> void:
	var nv = (score / 1000) + 1
	if nv > niveau:
		niveau = nv
		vitesse_actuelle = VITESSE_JEU * pow(0.9, niveau - 1)
		_declencher_message("NIVEAU " + str(niveau) + " !")

func _declencher_message(texte: String) -> void:
	file_messages.append(texte)

# ==============================================================
# ACTIONS
# ==============================================================
func _executer_action(action: String) -> void:
	match action:
		# ──── JEU ────
		"gauche":
			if etat_actuel == ETAT_JEU and en_cours and not en_pause:
				if not _detecte_collision(piece_modele, piece_x - 1, piece_y):
					piece_x -= 1
		"droite":
			if etat_actuel == ETAT_JEU and en_cours and not en_pause:
				if not _detecte_collision(piece_modele, piece_x + 1, piece_y):
					piece_x += 1
		"bas":
			if etat_actuel == ETAT_JEU and en_cours and not en_pause:
				if not _detecte_collision(piece_modele, piece_x, piece_y + 1):
					piece_y += 1
		"tourner":
			if etat_actuel == ETAT_JEU and en_cours and not en_pause:
				_rotation_avec_wall_kick()
		"drop":
			if etat_actuel == ETAT_JEU and en_cours and not en_pause:
				piece_y = _get_ghost_y()
				_installe_piece()
				_supprime_lignes_si_remplies()
				temps_acc = 0.0
		"pause":
			if etat_actuel == ETAT_JEU:
				en_pause = !en_pause
				if not en_pause: musique_jeu.play()
		# ── MENU ──
		"jouer":
			if etat_actuel == ETAT_MENU:
				etat_actuel = ETAT_MODE_SEL
				mode_sel_index = 0
		"magasin":
			if etat_actuel == ETAT_MENU:
				etat_actuel = ETAT_MAGASIN
				magasin_index = 0
		"credits":
			if etat_actuel == ETAT_MENU:
				etat_actuel = ETAT_CREDITS
		"ouvrir_pseudo":
			pseudo_en_saisie = true
			line_edit_pseudo.text = ""
			pseudo = ""
			line_edit_pseudo.visible = true 
			line_edit_pseudo.VirtualKeyboardType.KEYBOARD_TYPE_DEFAULT # clavier virtuel pour IOS
			line_edit_pseudo.grab_focus()
		"valider_pseudo":
			pseudo_en_saisie = false
			line_edit_pseudo.release_focus()
			line_edit_pseudo.visible = false
			_sauvegarder()
		"ouvrir_scoreboard":
			if etat_actuel == ETAT_MENU:
				scoreboard_page = 0
				scoreboard_charge = false
				_maj_boutons_scoreboard()
				etat_actuel = ETAT_SCOREBOARD
				_charger_scores_sw(scoreboard_page)
		"sb_prec":
			scoreboard_page = (scoreboard_page - 1 + 3) % 3
			scoreboard_charge = false
			_maj_boutons_scoreboard()
			_charger_scores_sw(scoreboard_page)
		"sb_suiv":
			scoreboard_page = (scoreboard_page + 1) % 3
			scoreboard_charge = false
			_maj_boutons_scoreboard()
			_charger_scores_sw(scoreboard_page)
		"reglage_menu":
			menu_reglages_ouvert = true
		# ── MODE ──
		"mode_0": _choisir_mode(0)
		"mode_1": _choisir_mode(1)
		"mode_2": _choisir_mode(2)
		# ── MAGASIN ──
		"acheter":
			if etat_actuel == ETAT_MAGASIN:
				_tenter_achat()
		"mag_haut":
			if etat_actuel == ETAT_MAGASIN:
				magasin_index = (magasin_index - 1 + NOMS_PACKS.size()) % NOMS_PACKS.size()
		"mag_bas":
			if etat_actuel == ETAT_MAGASIN:
				magasin_index = (magasin_index + 1) % NOMS_PACKS.size()
		# ── FIN ──
		"retour_menu":
			musique_gameover.stop()
			musique_menu.play()
			etat_actuel = ETAT_MENU
		# ── PAUSE ──
		"retour_menu_pause":
			en_pause = false
			musique_jeu.stop()
			musique_menu.play()
			etat_actuel = ETAT_MENU
		"retour_reglage_menu":
			etat_actuel = ETAT_MENU
		"reprendre":
			en_pause = false
			etat_actuel = ETAT_MENU if not en_cours else ETAT_JEU
			if en_cours:
				musique_jeu.play()
			else:
				etat_actuel = ETAT_MENU  # si pas de partie, retour menu
		"retour_depuis_pause":
			en_pause = false
			en_cours = false
			musique_jeu.stop()
			if not musique_menu.playing:
				musique_menu.play()
			etat_actuel = ETAT_MENU
		"fermer_reglages":
			menu_reglages_ouvert = false
		"vol_m_moins":
			vol_musique_index = clampi(vol_musique_index - 1, 0, 10)
			_appliquer_volumes()
		"vol_m_plus":
			vol_musique_index = clampi(vol_musique_index + 1, 0, 10)
			_appliquer_volumes()
		"vol_s_moins":
			vol_sfx_index = clampi(vol_sfx_index - 1, 0, 10)
			_appliquer_volumes()
		"vol_s_plus":
			vol_sfx_index = clampi(vol_sfx_index + 1, 0, 10)
			_appliquer_volumes()		# ── RETOUR GÉNÉRIQUE ──
		"retour":
			match etat_actuel:
				ETAT_MAGASIN, ETAT_CREDITS, ETAT_MODE_SEL, ETAT_SCOREBOARD:
					etat_actuel = ETAT_MENU
	queue_redraw()

func _choisir_mode(m: int) -> void:
	mode_jeu = m
	mode_sel_index = m
	_sync_high_score()
	_demarrer_partie()

# ==============================================================
# INPUT (clavier + touch unifié)
# ==============================================================
func _input(event: InputEvent) -> void:
	# TOUCH : détection toucher ecran
	if event is InputEventScreenTouch:
		if event.pressed: # doigt posé (pas levé)
			var pos := _touch_pos_logique(event.position) # coordonnées du doigt
			var boutons := _boutons_actifs()
			# On teste CHAQUE bouton du tableau actif
			for btn in boutons:
				if (btn["rect"] as Rect2).has_point(pos): #regarde si le doigt est dans le rectangle
					touch_ids_actifs[event.index] = btn["action"]
					_executer_action(btn["action"])
					return
			#scroll magazin
			if etat_actuel == ETAT_MAGASIN and (pos.x >= MAG_SCROLL_BAR_X or pos.y >= 250):
				mag_scroll_touch_id = event.index
				mag_scroll_start_y = pos.y
				mag_scroll_start_idx = magasin_index
		else:
			if event.index == mag_scroll_touch_id:
				mag_scroll_touch_id = -1
			touch_ids_actifs.erase(event.index)
		return

	# ──── TOUCH MOVE: scrollbar magasin ────
	if event is InputEventScreenDrag:
		if event.index == mag_scroll_touch_id and etat_actuel == ETAT_MAGASIN:
			var pos := _touch_pos_logique(event.position)
			var drag_dy : float = pos.y - mag_scroll_start_y
			var idx_float : float = float(mag_scroll_start_idx) + drag_dy / 96.0 # hauteur d'un pack(96pixel) descent un cran
			magasin_index = clampi(int(round(idx_float)), 0, NOMS_PACKS.size() - 1)
			queue_redraw()
		return

	# ──── CLAVIER ────
	if not event is InputEventKey or not event.pressed:
		return

	if etat_actuel == ETAT_CREDITS:
		_executer_action("retour")
		return

	if etat_actuel == ETAT_SCOREBOARD:
		if pseudo_en_saisie:
			# Saisie du pseudo au clavier
			if event.keycode == KEY_ENTER or event.keycode == KEY_KP_ENTER:
				_executer_action("valider_pseudo")
			elif event.keycode == KEY_BACKSPACE and pseudo.length() > 0:
				pseudo = pseudo.left(pseudo.length() - 1)
			elif event.unicode >= 32 and pseudo.length() < 12:
				pseudo += char(event.unicode).to_upper()
			queue_redraw()
		else:
			match event.keycode:
				KEY_LEFT: _executer_action("sb_prec")
				KEY_RIGHT: _executer_action("sb_suiv")
				KEY_ESCAPE, KEY_BACKSPACE: _executer_action("retour")
		queue_redraw()
		return
	if etat_actuel == ETAT_MODE_SEL:
		match event.keycode:
			KEY_UP: mode_sel_index = (mode_sel_index - 1 + 3) % 3
			KEY_DOWN: mode_sel_index = (mode_sel_index + 1) % 3
			KEY_ENTER, KEY_KP_ENTER: _choisir_mode(mode_sel_index)
			KEY_ESCAPE, KEY_BACKSPACE: _executer_action("retour")
		queue_redraw()
		return

	if etat_actuel == ETAT_FIN_GAME:
		if event.keycode in [KEY_ENTER, KEY_KP_ENTER]:
			_executer_action("retour_menu")
		return

	if etat_actuel == ETAT_MENU:
		# Saisie pseudo dans les réglages
		if pseudo_en_saisie:
			if event.keycode == KEY_ENTER or event.keycode == KEY_KP_ENTER:
				_executer_action("valider_pseudo")
			elif event.keycode == KEY_BACKSPACE and pseudo.length() > 0:
				pseudo = pseudo.left(pseudo.length() - 1)
			elif event.unicode >= 32 and pseudo.length() < 12:
				pseudo += char(event.unicode).to_upper()
			queue_redraw()
			return
		match event.keycode:
			KEY_ENTER, KEY_KP_ENTER: _executer_action("jouer")
			KEY_M: _executer_action("magasin")
			KEY_S: _executer_action("ouvrir_scoreboard")
			KEY_C: _executer_action("credits")
			KEY_ESCAPE:
				if menu_reglages_ouvert:
					menu_reglages_ouvert = false
				else:
					menu_reglages_ouvert = true
			KEY_UP:
				if menu_reglages_ouvert:
					if curseur_pause == 0:
						# Sur MUSIQUE + fleche haut = saisie pseudo
						pseudo_en_saisie = true
					else:
						curseur_pause = 0
			KEY_DOWN:
				if menu_reglages_ouvert:
					if pseudo_en_saisie:
						# Fleche bas = quitter saisie pseudo
						pseudo_en_saisie = false
						_sauvegarder()
					else:
						curseur_pause = 1
			KEY_PLUS, KEY_EQUAL, KEY_RIGHT:
				if menu_reglages_ouvert:
					if curseur_pause == 0: 
						_executer_action("vol_m_plus")
					else:
						_executer_action("vol_s_plus")
			KEY_MINUS, KEY_LEFT:
				if menu_reglages_ouvert:
					if curseur_pause == 0: 
						_executer_action("vol_m_moins")
					else: 
						_executer_action("vol_s_moins")
				queue_redraw()
				return
	if etat_actuel == ETAT_MAGASIN:
		match event.keycode:
			KEY_ESCAPE, KEY_BACKSPACE: _executer_action("retour")
			KEY_UP: _executer_action("mag_haut")
			KEY_DOWN: _executer_action("mag_bas")
			KEY_ENTER, KEY_KP_ENTER: _executer_action("acheter")
		queue_redraw()
		return

	if etat_actuel == ETAT_JEU and not en_cours:
		return

	if event.keycode == KEY_ESCAPE:
		_executer_action("pause")
		return

	if en_pause:
		match event.keycode:
			KEY_ESCAPE:
				if not en_cours:
					en_pause = false
					etat_actuel = ETAT_MENU  # retour menu si pas de partie
				else:
					_executer_action("pause")  # reprendre la partie
			KEY_UP: curseur_pause = 0
			KEY_DOWN: curseur_pause = 1
			KEY_PLUS, KEY_EQUAL, KEY_RIGHT:
				if curseur_pause == 0: _executer_action("vol_m_plus")
				else: _executer_action("vol_s_plus")
			KEY_MINUS, KEY_LEFT:
				if curseur_pause == 0: _executer_action("vol_m_moins")
				else: _executer_action("vol_s_moins")
		queue_redraw()
		return

	match event.keycode:
		KEY_LEFT: _executer_action("gauche")
		KEY_RIGHT: _executer_action("droite")
		KEY_DOWN: _executer_action("bas")
		KEY_UP: _executer_action("tourner")
		KEY_SPACE: _executer_action("drop")
	queue_redraw()

func _touch_pos_logique(raw: Vector2) -> Vector2:
	# convertie les cood de mon doigt
	return raw

func _boutons_actifs() -> Array:
	if etat_actuel == ETAT_JEU:
		if en_pause: 
			return boutons_pause
		return boutons_jeu
	if etat_actuel == ETAT_MENU:
		if menu_reglages_ouvert:
			if pseudo_en_saisie:
				return boutons_pseudo
			return boutons_reglage
		return boutons_menu
	if etat_actuel == ETAT_MODE_SEL: 
		return boutons_mode
	if etat_actuel == ETAT_MAGASIN: 
		return boutons_magasin
	if etat_actuel == ETAT_FIN_GAME: 
		return boutons_fin
	if etat_actuel == ETAT_CREDITS: 
		return boutons_credits
	if etat_actuel == ETAT_SCOREBOARD:
		if pseudo_en_saisie:
			return boutons_pseudo
		return boutons_scoreboard
	return []

# ==============================================================
# ACHAT MAGASIN
# ==============================================================
func _tenter_achat() -> void:
	var nom = NOMS_PACKS[magasin_index]
	if nom in packs_debloques:
		pack_index = magasin_index
		etat_actuel = ETAT_MENU
	elif pieces_monnaie >= PRIX_PACK:
		pieces_monnaie -= PRIX_PACK
		packs_debloques.append(nom)
		pack_index = magasin_index
		_sauvegarder()
		etat_actuel = ETAT_MENU

# ==============================================================
# DESSIN GLOBAL
# ==============================================================
func _draw() -> void:
	_dessine_fond()
	match etat_actuel:
		ETAT_MENU:
			_dessine_menu_principal()
			_dessine_boutons(boutons_menu)
			if menu_reglages_ouvert:
				draw_rect(Rect2(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT), Color(0, 0, 0, 0.85))
				if pseudo_en_saisie:
					_dessine_saisie_pseudo()
					_dessine_boutons(boutons_pseudo)
				else:
					draw_string(police, Vector2(0, 200), "REGLAGES", HORIZONTAL_ALIGNMENT_CENTER, SCREEN_WIDTH, 60, WHITE)
					# Pseudo
					draw_string(police, Vector2(0, 290), "PSEUDO", HORIZONTAL_ALIGNMENT_CENTER, SCREEN_WIDTH, 18, GREY)
					var pseudo_aff = pseudo if pseudo.length() > 0 else "APPUIE ICI"
					var pseudo_col = WHITE if pseudo.length() > 0 else GREY
					draw_rect(Rect2(60, 310, 418, 70), Color(0.1,0.1,0.1))
					draw_rect(Rect2(60, 310, 418, 70), GREY, false, 1.5)
					draw_string(police_normal, Vector2(0, 360), pseudo_aff, HORIZONTAL_ALIGNMENT_CENTER, SCREEN_WIDTH, 28, pseudo_col)
					_dessiner_barre_volume(500, "MUSIQUE", vol_musique_index, curseur_pause == 0)
					_dessiner_barre_volume(630, "BRUITAGES", vol_sfx_index, curseur_pause == 1)
					_dessine_boutons(boutons_reglage)
			return
		ETAT_MAGASIN:
			_dessine_magasin()
			_dessine_boutons(boutons_magasin)
			return
		ETAT_FIN_GAME:
			_dessine_ecran_fin()
			_dessine_boutons(boutons_fin)
			return
		ETAT_CREDITS:
			_dessine_credits()
			_dessine_boutons(boutons_credits)
			return
		ETAT_MODE_SEL:
			_dessine_selection_mode()
			_dessine_boutons(boutons_mode)
			return
		ETAT_SCOREBOARD:
			if pseudo_en_saisie:
				_dessine_saisie_pseudo()
			else:
				_dessine_scoreboard()
			_dessine_boutons(_boutons_actifs())
			return
		ETAT_reglage_menu:
			draw_rect(Rect2(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT), Color(0, 0, 0, 0.85))
			draw_string(police, Vector2(0, 200), "REGLAGES",
					HORIZONTAL_ALIGNMENT_CENTER, SCREEN_WIDTH, 60, WHITE)
			_dessiner_barre_volume(440, "MUSIQUE", vol_musique_index, curseur_pause == 0)
			_dessiner_barre_volume(570, "BRUITAGES", vol_sfx_index, curseur_pause == 1)
			_dessine_boutons(boutons_reglage)
			return

	# ── JEU ──
	_dessine_grille()
	if en_cours:
		_dessine_ghost()
		_dessine_piece_courante()
	_dessine_ui_laterale()

	if message_timer > 0:
		var ct = MAGENTA
		if message_special.begins_with("NIVEAU"): ct = DARK_BLUE
		draw_string(police, Vector2(SCREEN_WIDTH/2 - 100, SCREEN_HEIGHT/2 - 120),
				message_special, HORIZONTAL_ALIGNMENT_CENTER, 200, 40, ct)

	if en_pause:
		draw_rect(Rect2(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT), Color(0, 0, 0, 0.85))
		draw_string(police, Vector2(0, 200), "PAUSE",
				HORIZONTAL_ALIGNMENT_CENTER, SCREEN_WIDTH, 60, WHITE)
		_dessiner_barre_volume(440, "MUSIQUE", vol_musique_index, curseur_pause == 0)
		_dessiner_barre_volume(570, "BRUITAGES", vol_sfx_index, curseur_pause == 1)
		_dessine_boutons(boutons_pause)
		
	else:
		_dessine_boutons(boutons_jeu)

# ==============================================================
# DESSIN BOUTONS
# Parcour les boutons est dessine(fond coloré,bordure blanche,label centré)
# ==============================================================
func _dessine_boutons(boutons: Array) -> void:
	for btn in boutons:
		var r : Rect2 = btn["rect"]
		var c : Color = btn["couleur"]
		var l : String = btn["label"]
		# Dessine bouton Cercle
		if btn.has("forme") and btn["forme"] == "cercle":
			var centre = r.position + (r.size / 2) # On calcule le centre du carré (milieu Rect2)
			var rayon = r.size.x / 2 # rayon = moitié de la largeur
			draw_circle(centre, rayon, c) # Dessin bouton cercle plein
			draw_arc(centre, rayon, 0, TAU, 32, Color(0.6, 0.6, 0.6), 1.5, true) # Dessin bordure grise circulaire (au lieu de draw_rect)
		else:
		# Dessine bouton rectangle
			draw_rect(r, c) # fond
			draw_rect(r, Color(0.6, 0.6, 0.6), false, 1.5) #bordure 

		# Label centré verticalement et horizontalement
		var font_size = 30
		if r.size.y < 60: font_size = 26
		if l == "REGLAGE":
			font_size = 20
		var char_x := float(r.position.x)
		var total_word := 0.0
		for i in l:
			var police_choisie = police_normal if i in [":", "/", "+", "-"] else police
			total_word += police_choisie.get_string_size(i, HORIZONTAL_ALIGNMENT_LEFT, -1, font_size).x
		char_x = r.position.x + (r.size.x - total_word) / 2.0
		for i in l:
			var police_choisie = police_normal if i in [":", "/","+", "-"] else police
			draw_string(police_choisie, Vector2(char_x, r.position.y + r.size.y * 0.65),
					i, HORIZONTAL_ALIGNMENT_LEFT, -1, font_size, WHITE)
			char_x += police_choisie.get_string_size(i, HORIZONTAL_ALIGNMENT_LEFT, -1, font_size).x

# ==============================================================
# DESSIN JEU
# ==============================================================
func _get_ghost_y() -> int:
	var gy = piece_y
	while not _detecte_collision(piece_modele, piece_x, gy + 1):
		gy += 1
	return gy

func _dessine_ghost() -> void:
	_dessine_modele(piece_modele, Color(0.2, 0.2, 0.2, 0.5), piece_x, _get_ghost_y(), TAILLE_CASE)

func _dessine_fond() -> void:
	draw_rect(Rect2(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT), BLACK)
	if NOMS_PACKS[pack_index] == "Matrix":
		var col_w := 14
		for i in range(matrix_colonnes.size()):
			var col = matrix_colonnes[i]
			var cx = i * col_w
			for k in range(col["chars"].size()):
				var alpha = 1.0 - float(k) / col["len"]
				var ct = Color(0, 1, 0.2, alpha * 0.85)
				if k == 0: ct = Color(0.8, 1.0, 0.9, 1.0)
				draw_string(police, Vector2(cx, col["y"] - k * 16),
						col["chars"][k] if k < col["chars"].size() else "0",
						HORIZONTAL_ALIGNMENT_LEFT, -1, 13, ct)

func _dessine_grille() -> void:
	for y in range(HAUTEUR_GRILLE):
		for x in range(5, LARGEUR_GRILLE):
			var ca = grille[y][x]
			var rect := Rect2(x * TAILLE_CASE, y * TAILLE_CASE, TAILLE_CASE, TAILLE_CASE)
			if y in lignes_en_flash: ca = WHITE
			draw_rect(rect, ca)
			if ca != BLACK:
				if x <= 5 or x == LARGEUR_GRILLE - 1 or y == HAUTEUR_GRILLE - 1:
					draw_rect(rect, GREY)
					continue
				_dessine_bloc_glow(rect, ca)
			if x == 5 or x == LARGEUR_GRILLE - 1 or y == HAUTEUR_GRILLE - 1:
				draw_rect(rect, GREY)

func _dessine_bloc_glow(rect: Rect2, couleur: Color) -> void:
	var ac = couleur
	ac.a = 0.15
	draw_rect(rect.grow(3), ac, true)
	draw_rect(rect, couleur)
	draw_rect(Rect2(rect.position.x + 2, rect.position.y + 2, rect.size.x - 4, 4),
			Color(1, 1, 1, 0.75))

func _dessine_piece_courante() -> void:
	_dessine_modele(piece_modele, piece_couleur, piece_x, piece_y, TAILLE_CASE)

func _dessine_modele(modele: Array, couleur: Color, gx: float, gy: float,
		taille_cell: int, offset := Vector2.ZERO) -> void:
	for y in range(modele.size()):
		for x in range(modele[y].size()):
			if modele[y][x] == 1:
				var px := offset.x + (gx + x) * taille_cell
				var py := offset.y + (gy + y) * taille_cell
				var r = Rect2(px, py, taille_cell, taille_cell)
				draw_rect(r, couleur)
				_dessine_bloc_glow(r, couleur)

func _dessine_ui_laterale() -> void:
	draw_rect(Rect2(420, 0, TAILLE_CASE * 5, TAILLE_CASE * 5), Color(0.15,0.15,0.15))
	_dessine_modele(suivante_modele, suivante_couleur, 1.0, 1.0, TAILLE_CASE - 1, Vector2(422, 10))

	# Mode de jeu actuel
	if mode_jeu == MODE_BLITZ:
		draw_string(police, Vector2(3, 195), NOMS_MODES[mode_jeu], HORIZONTAL_ALIGNMENT_LEFT, -1, 24, MAGENTA)
	else:
		draw_string(police, Vector2(3, 195), NOMS_MODES[mode_jeu], HORIZONTAL_ALIGNMENT_LEFT, -1, 20, MAGENTA)
		
	# Blitz : chrono
	if mode_jeu == MODE_BLITZ and en_cours:
		var secs = int(blitz_timer)
		var col = RED if secs < 20 else YELLOW
		var minutes : String = "%02d" % (secs / 60)
		var secondes : String = "%02d" % (secs % 60)
		draw_string(police, Vector2(445, 195), minutes, HORIZONTAL_ALIGNMENT_LEFT, -1, 26, col)
		draw_string(police_normal, Vector2(473, 195), ":", HORIZONTAL_ALIGNMENT_LEFT, -1, 26, col)
		draw_string(police, Vector2(487, 195), secondes, HORIZONTAL_ALIGNMENT_LEFT, -1, 26, col)

	# Infos Ui Latéral
	draw_string(police, Vector2(3, 250), "RECORD", HORIZONTAL_ALIGNMENT_LEFT, -1, 16, GREY)
	draw_string(police, Vector2(3, 275), str(high_score), HORIZONTAL_ALIGNMENT_LEFT, -1, 22, YELLOW)
	draw_string(police, Vector2(450, 250), "NIVEAU", HORIZONTAL_ALIGNMENT_LEFT, -1, 16, GREY)
	draw_string(police, Vector2(450, 275), str(niveau), HORIZONTAL_ALIGNMENT_LEFT, -1, 22, CYAN)
	draw_string(police, Vector2(450, 312), "SCORE", HORIZONTAL_ALIGNMENT_LEFT, -1, 16, GREY)
	draw_string(police, Vector2(450, 337), str(score), HORIZONTAL_ALIGNMENT_LEFT, -1, 22, WHITE)
	if score_ajoute > 0:
		draw_string(police_normal, Vector2(450, 402), "+" + str(score_ajoute), HORIZONTAL_ALIGNMENT_LEFT, -1, 18, GREEN)
	draw_string(police, Vector2(3, 312), "PIECES", HORIZONTAL_ALIGNMENT_LEFT, -1, 16, GREY)
	draw_string(police, Vector2(3, 337), str(pieces_monnaie), HORIZONTAL_ALIGNMENT_LEFT, -1, 22, ORANGE)

# ==============================================================
# MENU PRINCIPAL
# ==============================================================
func _dessine_menu_principal() -> void:
	var tetris_text := "TETRIS"
	var logo_colors := [Color(0.0, 1.0, 1.0, 1.0), Color(1.0, 1.0, 0.0, 1.0), Color(1.0, 0.0, 1.0, 1.0), Color(1.0, 0.5, 0.0, 1.0), Color(0.55,0.70,1.0), Color(0.0, 1.0, 0.4, 1.0)]

	var start_x = (SCREEN_WIDTH / 2) - (tetris_text.length() * 20)
	for i in range(tetris_text.length()):
		draw_string(police, Vector2(start_x + (i * 40), 160), tetris_text[i],
				HORIZONTAL_ALIGNMENT_LEFT, -1, 60, logo_colors[i])

	# Pack actif
	var pack_nom = NOMS_PACKS[pack_index]
	var couleurs_pack = PACKS_COULEURS[pack_nom]
	draw_string(police, Vector2(-5, 270), "PACK  ACTIF",
			HORIZONTAL_ALIGNMENT_CENTER, SCREEN_WIDTH, 18, GREY)
	draw_string(police, Vector2(0, 298), pack_nom,
			HORIZONTAL_ALIGNMENT_CENTER, SCREEN_WIDTH, 30, couleurs_pack[0])

	# demo couleur pack
	var nb = couleurs_pack.size()
	var cw = 38
	var esp = 8
	var tw = nb * cw + (nb - 1) * esp
	var sx = (SCREEN_WIDTH - tw) / 2
	for i in range(nb):
		var cx = sx + i * (cw + esp)
		draw_rect(Rect2(cx, 338, cw, cw), couleurs_pack[i])
		draw_rect(Rect2(cx + 3, 341, cw - 6, 5), Color(1, 1, 1, 0.4))

	# Records par mode
	var ry := 400
	draw_string(police, Vector2(0, ry), "RECORDS",
			HORIZONTAL_ALIGNMENT_CENTER, SCREEN_WIDTH, 18, GREY)
	ry += 28
	var noms_aff := ["CLASSIQUE", "BLITZ", "SURVIE"]
	var cols_rec := [GREEN, YELLOW, Color(0.517, 0.0, 0.517)]
	var bw3 := SCREEN_WIDTH / 3
	for i in range(3):
		var rx = i * bw3
		draw_string(police, Vector2(rx, ry), noms_aff[i],
				HORIZONTAL_ALIGNMENT_CENTER, bw3, 15, GREY)
		draw_string(police, Vector2(rx, ry + 22), str(high_scores_par_mode.get(_cle_mode(i), 0)),
				HORIZONTAL_ALIGNMENT_CENTER, bw3, 20, cols_rec[i])

	# Pièces
	draw_string(police, Vector2(0, 498), "PIECES  " + str(pieces_monnaie),
			HORIZONTAL_ALIGNMENT_CENTER, SCREEN_WIDTH, 18, ORANGE)

# ==============================================================
# SÉLECTION MODE
# ==============================================================
func _dessine_selection_mode() -> void:
	draw_rect(Rect2(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT), Color(0, 0, 0, 0.85))
	draw_string(police, Vector2(0, 150), "MODE  DE  JEU",
			HORIZONTAL_ALIGNMENT_CENTER, SCREEN_WIDTH, 45, YELLOW)

	var cols_mode := [GREEN, YELLOW, Color(0.517, 0.0, 0.517)]

	for i in range(3):
		var x_pos = 90 + i * 150
		var selectionne = (i == mode_sel_index)
		var couleur = cols_mode[i] if selectionne else GREY
		if selectionne:
			draw_string(police_normal, Vector2(30, 415 + i * 100), ">", HORIZONTAL_ALIGNMENT_LEFT, -1, 28, YELLOW)

		# Record du mode
		var rec = high_scores_par_mode.get(_cle_mode(i), 0)
		draw_string(police, Vector2(x_pos + 15,300), str(rec), HORIZONTAL_ALIGNMENT_RIGHT, -1, 20, cols_mode[i])

# ==============================================================
# MAGASIN
# ==============================================================
func _dessine_magasin() -> void:
	var PRIX_LABEL := str(PRIX_PACK) + "  PIECES"
	var pad_x := 20
	var text_x := pad_x + 18
	var ligne_h := 96
	var debut_y := 250
	var sw := 26
	var sh := 24
	var se := 6
	var list_w := MAG_SCROLL_BAR_X - pad_x - 8

	draw_string(police, Vector2(0, 80), "MAGASIN",
			HORIZONTAL_ALIGNMENT_CENTER, SCREEN_WIDTH, 50, YELLOW)
	draw_string(police, Vector2(0, 140), "PIECES  " + str(pieces_monnaie),
			HORIZONTAL_ALIGNMENT_CENTER, SCREEN_WIDTH, 22, ORANGE)

	# Calcul du scroll pour que le pack sélectionné soit toujours visible
	var zone_liste_h := SCREEN_HEIGHT - 230 - debut_y
	var nb_visibles := int(zone_liste_h / ligne_h)
	var scroll_debut := clampi(magasin_index - nb_visibles / 2, 0, NOMS_PACKS.size() - nb_visibles)

	# UNE SEULE boucle : calcul de y0 + dessin
	for i in range(NOMS_PACKS.size()):
		var rang := i - scroll_debut
		var y0 := debut_y + rang * ligne_h

		# Clipping : ne pas dessiner hors de la zone visible
		if y0 + ligne_h <= debut_y or y0 >= SCREEN_HEIGHT - 230:
			continue

		var nom : String = NOMS_PACKS[i]
		var couleurs : Array = PACKS_COULEURS[nom]
		var possede : bool = nom in packs_debloques
		var est_actif : bool = (i == pack_index)
		var sel : bool = (i == magasin_index)
		var fond := Color(0.18, 0.18, 0.18) if not sel else Color(0.22, 0.20, 0.04)
		draw_rect(Rect2(pad_x, y0, list_w, ligne_h - 6), fond)
		draw_rect(Rect2(pad_x, y0, list_w, ligne_h - 6),
				YELLOW if sel else GREY, false, 2.0)

		draw_string(police, Vector2(text_x, y0 + 24), nom,
				HORIZONTAL_ALIGNMENT_LEFT, -1, 22, couleurs[0])

		if possede:
			draw_string(police, Vector2(pad_x + list_w - 18, y0 + 24),
					"V", HORIZONTAL_ALIGNMENT_RIGHT, -1, 26, GREEN)
			if est_actif:
				draw_string(police, Vector2(pad_x + list_w - 43, y0 + 48),
						"ACTIF", HORIZONTAL_ALIGNMENT_RIGHT, -1, 14, CYAN)
		else:
			draw_string(police, Vector2(pad_x + list_w - 18, y0 + 24),
					"X", HORIZONTAL_ALIGNMENT_RIGHT, -1, 26, RED)
			var cp := YELLOW if pieces_monnaie >= PRIX_PACK else Color(0.8, 0.5, 0.5)
			draw_string(police, Vector2(pad_x + list_w - 80, y0 + 48),
					PRIX_LABEL, HORIZONTAL_ALIGNMENT_RIGHT, -1, 15, cp)

		for j in range(couleurs.size()):
			var cx := text_x + j * (sw + se)
			var cy := y0 + 56
			var c : Color = couleurs[j] if possede else Color(
					couleurs[j].r * 0.3, couleurs[j].g * 0.3, couleurs[j].b * 0.3)
			draw_rect(Rect2(cx, cy, sw, sh), c)
			if possede:
				draw_rect(Rect2(cx + 2, cy + 2, sw - 4, 4), Color(1, 1, 1, 0.3))

	if not NOMS_PACKS[magasin_index] in packs_debloques and pieces_monnaie < PRIX_PACK:
		draw_string(police, Vector2(0, SCREEN_HEIGHT - 900),
				"PAS ASSEZ DE PIECES !", HORIZONTAL_ALIGNMENT_CENTER, SCREEN_WIDTH, 20, RED)

	# ── SCROLLBAR LATÉRALE ──────────────────────────────────────
	var sb_x := float(MAG_SCROLL_BAR_X)
	var sb_top := float(debut_y)
	var sb_bot := float(SCREEN_HEIGHT - 230)
	var sb_h := sb_bot - sb_top
	var n := float(NOMS_PACKS.size())
	var thumb_h : float = max(sb_h / n, 48.0)
	var thumb_y : float = sb_top + (sb_h - thumb_h) * float(magasin_index) / (n - 1.0)

	draw_rect(Rect2(sb_x, sb_top, MAG_SCROLL_BAR_W, sb_h), Color(0.15, 0.15, 0.15))
	draw_rect(Rect2(sb_x, sb_top, MAG_SCROLL_BAR_W, sb_h), Color(0.4, 0.4, 0.4), false, 1.5)
	draw_rect(Rect2(sb_x + 3, thumb_y, MAG_SCROLL_BAR_W - 6, thumb_h), Color(0.7, 0.6, 0.1))
	draw_rect(Rect2(sb_x + 3, thumb_y, MAG_SCROLL_BAR_W - 6, thumb_h), YELLOW, false, 1.5)
	for k in range(3):
		var gy := thumb_y + thumb_h * 0.35 + k * (thumb_h * 0.15)
		draw_rect(Rect2(sb_x + 7, gy, MAG_SCROLL_BAR_W - 14, 2), Color(1, 1, 1, 0.5))
		
# ==============================================================
# ÉCRAN FIN DE PARTIE
# ==============================================================
func _dessine_ecran_fin() -> void:
	draw_rect(Rect2(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT), Color(0, 0, 0, 0.88))

	draw_string(police, Vector2(0, 180), "GAME OVER",
			HORIZONTAL_ALIGNMENT_CENTER, SCREEN_WIDTH, 55, RED)

	draw_string(police, Vector2(0, 295), NOMS_MODES[mode_jeu],
			HORIZONTAL_ALIGNMENT_CENTER, SCREEN_WIDTH, 20, MAGENTA)
	draw_string(police, Vector2(0, 330), "SCORE  FINAL",
			HORIZONTAL_ALIGNMENT_CENTER, SCREEN_WIDTH, 20, GREY)
	draw_string(police, Vector2(0, 365), str(score),
			HORIZONTAL_ALIGNMENT_CENTER, SCREEN_WIDTH, 44, WHITE)

	var cle = _cle_mode(mode_jeu)
	if score >= high_scores_par_mode.get(cle, 0) and score > 0:
		draw_string(police, Vector2(0, 425), "NOUVEAU RECORD !",
				HORIZONTAL_ALIGNMENT_CENTER, SCREEN_WIDTH, 26, YELLOW)
	else:
		draw_string(police, Vector2(0, 425), "RECORD  " + str(high_scores_par_mode.get(cle, 0)),
				HORIZONTAL_ALIGNMENT_CENTER, SCREEN_WIDTH, 22, YELLOW)

	draw_rect(Rect2(SCREEN_WIDTH/2 - 160, 490, 320, 90), Color(0.15, 0.12, 0.0))
	draw_rect(Rect2(SCREEN_WIDTH/2 - 160, 490, 320, 90), ORANGE, false, 2.0)
	draw_string(police, Vector2(0, 525), "PIECES GAGNEES ",
			HORIZONTAL_ALIGNMENT_CENTER, SCREEN_WIDTH, 18, GREY)
	draw_string(police_normal, Vector2(0, 558), "+ " + str(pieces_gagnees_partie),
			HORIZONTAL_ALIGNMENT_CENTER, SCREEN_WIDTH, 32, ORANGE)

	draw_string(police, Vector2(0, 618), "TOTAL  " + str(pieces_monnaie) + " pieces",
			HORIZONTAL_ALIGNMENT_CENTER, SCREEN_WIDTH, 20, ORANGE)

	# Records des 3 modes côte à côte
	draw_string(police, Vector2(0, 665), "VOS RECORDS",
			HORIZONTAL_ALIGNMENT_CENTER, SCREEN_WIDTH, 18, GREY)
	var bw3 := SCREEN_WIDTH / 3
	for i in range(3):
		var rx := i * bw3
		draw_string(police, Vector2(rx, 690), ["CLASSIQUE","BLITZ","SURVIE"][i],
				HORIZONTAL_ALIGNMENT_CENTER, bw3, 14, GREY)
		draw_string(police, Vector2(rx, 710), str(high_scores_par_mode.get(_cle_mode(i), 0)),
				HORIZONTAL_ALIGNMENT_CENTER, bw3, 18, [GREEN, YELLOW, Color(0.517, 0.0, 0.517)][i])

# ==============================================================
# CRÉDITS
# ==============================================================
func _dessine_credits() -> void:
	draw_string(police, Vector2(0, 80), "CREDITS",
			HORIZONTAL_ALIGNMENT_CENTER, SCREEN_WIDTH, 50, YELLOW)

	var lignes := [
		{"titre": "JEU", "valeur": "Robin Jeanbert", "couleur": WHITE},
		{"titre": "MOTEUR", "valeur": "Godot 4.6",  "couleur": CYAN},
		{"titre": "EVENEMENT",   "valeur": "API 8", "couleur": YELLOW},
		{"titre": "MUSIQUE  JEU", "valeur": "Robin Jeanbert", "couleur": ORANGE},
		{"titre": "MUSIQUE  MENU","valeur": "Robin Jeanbert", "couleur": ORANGE},
		{"titre": "SFX", "valeur": "Robin Jeanbert", "couleur": ORANGE},
		{"titre": "CODE  SOURCE", "valeur": "Licence MIT", "couleur": GREEN},
		{"titre": "SCOREBOARD", "valeur": "SILENT WOLF", "couleur": GREEN}
	]

	var lh := 104
	var debut := 105
	for i in range(lignes.size()):
		var ligne = lignes[i]
		var y0 = debut + i * lh
		# Fond de la carte
		draw_rect(Rect2(20, y0, SCREEN_WIDTH - 40, lh - 8), Color(0.12,0.12,0.12))
		draw_rect(Rect2(20, y0, SCREEN_WIDTH - 40, lh - 8), GREY, false, 1.5)
		# Titre (petit, gris)
		draw_string(police, Vector2(38, y0 + 24), ligne["titre"],
				HORIZONTAL_ALIGNMENT_LEFT, -1, 16, GREY)
		# Valeur (grand, coloré)
		draw_string(police_normal, Vector2(38, y0 + 58), ligne["valeur"],
				HORIZONTAL_ALIGNMENT_LEFT, -1, 22, ligne["couleur"])

# ==============================================================
# BARRE DE VOLUME
# ==============================================================
func _dessiner_barre_volume(y_pos: float, titre: String, valeur: int, selectionne: bool) -> void:
	var cf = Color.YELLOW if selectionne else Color.WHITE
	draw_string(police, Vector2(140, y_pos - 22), titre, HORIZONTAL_ALIGNMENT_LEFT, -1, 20, cf)
	for i in range(10):
		var r = Rect2(140 + i * 25, y_pos, 20, 20)
		draw_rect(r, Color.YELLOW if (i < valeur and selectionne) else (Color.GREEN if i < valeur else Color.DARK_GRAY))
		draw_rect(r, Color.BLACK, false, 1.0)

# ==============================================================
# MISE À JOUR BOUTONS SCOREBOARD
# ==============================================================
func _maj_boutons_scoreboard() -> void:
	var noms := ["CLASSIQUE", "BLITZ", "SURVIVAL"]
	var prev = noms[(scoreboard_page - 1 + 3) % 3]
	var next = noms[(scoreboard_page + 1) % 3]
	boutons_scoreboard = [
		{"rect": Rect2(10, 940, 230, 70), "label": prev, "action": "sb_prec", "couleur": Color(0.1,0.2,0.4)},
		{"rect": Rect2(300, 940, 230, 70), "label": next, "action": "sb_suiv", "couleur": Color(0.1,0.2,0.4)},
		{"rect": Rect2(100, 1020, 338, 60), "label": "RETOUR", "action": "retour", "couleur": Color(0.15,0.15,0.15)},
	]

# ==============================================================
# PSEUDO LINE EDIT CALLBACKS
# ==============================================================
func _on_pseudo_changed(new_text: String) -> void:
	var upper = new_text.to_upper()
	pseudo = upper
	if new_text != upper:
		line_edit_pseudo.text = upper
		line_edit_pseudo.caret_column = upper.length()
	queue_redraw()
func _on_pseudo_submitted(new_text: String) -> void:
	pseudo = new_text.to_upper() # pseudo en MAJ
	line_edit_pseudo.release_focus() # Ferme le clavier virtuel
	line_edit_pseudo.visible = false # Cache le composant pour libérer l'écran	
	_executer_action("valider_pseudo")

# ==============================================================
# SILENTW0LF - SCOREBOARD EN LIGNE
# ==============================================================
func _envoyer_score_sw(leaderboard: String, valeur: int) -> void:
	var http = HTTPRequest.new() # Outil invisible capable d'aller sur Internet (requête HTTP)
	add_child(http)
	var url = "https://api.silentwolf.com/save_score" # API SilentWolf pour enregistrer un score
	
	# SilentWolf demande de chiffrer la demande.
	# On récupère l'heure actuelle de l'appareil (sous forme de grand nombre de secondes) pour un envoie unique
	var Timestamp = int(Time.get_unix_time_from_system())
	var Timestamp_str = str(Timestamp)

	var to_hash = pseudo + str(valeur) + Timestamp_str # donnée du joueur
	var hashed = to_hash.md5_text() # chiffre la demande
	
	var score_id = SW_GAME_ID + "_" + pseudo + "_" + Timestamp_str #identifiant unique (JEU_PSEUDO_HASH)

	# CONFIGURATION DE LA DEMANDE
	# C'est la fiche d'identité du message envoyée au serveur
	var headers = [
		"Content-Type: application/json",
		"x-api-key: " + SW_API_KEY,     # Clé d'identification secrète SilentWolf
		"x-sw-game-id: " + SW_GAME_ID,  # Identifiant du jeu
		"x-sw-plugin-version: 0.9.9",   # Version du plugin utilisé
		"x-sw-godot-version: 4.0",      # Version de Godot utilisée
		"x-sw-act-tmst: " + Timestamp_str,    # Heure de la demande
		"x-sw-act-dig: " + hashed   # Code anti-triche
	]
	# emballe les donnée en format JSON(web)
	var body = JSON.stringify({
		"score_id": score_id,
		"player_name": pseudo,
		"score": valeur,
		"game_id": SW_GAME_ID,
		"ldboard_name": leaderboard              # Le nom du tableau (ex: classique, blitz, survival)
	})
	# envoie du paquet (POST)
	http.request(url, headers, HTTPClient.METHOD_POST, body)
	
	# on détruit l'outil HTTP pour libérer la mémoire quand le serv a répondu
	http.request_completed.connect(func(_r, code, _h, b):
		http.queue_free() # Détruit l'outil invisible
	)

func _charger_scores_sw(page: int) -> void:
	var modes = ["classique", "blitz", "survival"]
	var tab_mode = modes[page]
	# vide scoreboard + affiche en attente 
	scoreboard_data[tab_mode] = []
	scoreboard_charge = false
	# outils de connexion Internet
	var http = HTTPRequest.new()
	add_child(http)
	# L'adresse web pour récupérer le classement (on demande un maximum de 10 scores)
	var url = "https://api.silentwolf.com/get_scores/" + SW_GAME_ID + "?max=10&ldboard_name=" + tab_mode
	# exemple: https://api.silentwolf.com/get_scores/Adventure_P8?max=10&ldboard_name=blitz
	
	var headers = [
		"x-api-key: " + SW_API_KEY,
		"x-sw-game-id: " + SW_GAME_ID,
		"x-sw-plugin-version: 0.9.9",
		"x-sw-godot-version: 4.0"
	]
	# recupère la demande (GET)
	http.request(url, headers, HTTPClient.METHOD_GET)
	http.request_completed.connect(func(_r, code, _h, body):
		# traduit donnée en donnée utilisable
		var parsed = JSON.parse_string(body.get_string_from_utf8())
		# assure que la reponse du site et un tableau "top_score"
		if parsed and parsed.has("top_scores"):
			var entries = []
			# on parcour chaque score et extrait le nom ("pn") et score ("s")
			for s in parsed["top_scores"]:
				entries.append({"player_name": s.get("pn","???"), "score": int(s.get("s", 0))})
			scoreboard_data[tab_mode] = entries # enregistre les données dans la mémoire
		scoreboard_charge = true
		http.queue_free() # outil HTTP détruit
		queue_redraw()
	)

# ==============================================================
# DESSIN SCOREBOARD
# ==============================================================
func _dessine_scoreboard() -> void:
	draw_rect(Rect2(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT), Color(0, 0, 0, 0.92))
	var noms_pages := ["CLASSIQUE", "BLITZ", "SURVIVAL"]
	var cols_pages := [GREEN, YELLOW, Color(0.517, 0.0, 0.517)]
	# Titre
	draw_string(police, Vector2(0, 90), "SCOREBOARD",
	HORIZONTAL_ALIGNMENT_CENTER, SCREEN_WIDTH, 48, CYAN)
	# Onglet actif
	draw_string(police, Vector2(0, 150), noms_pages[scoreboard_page],
	HORIZONTAL_ALIGNMENT_CENTER, SCREEN_WIDTH, 30, cols_pages[scoreboard_page])
	# Navigation
	for i in range(3):
		var cx = SCREEN_WIDTH / 2.0 - 20 + i * 20
		draw_circle(Vector2(cx, 175), 5, cols_pages[i] if i == scoreboard_page else GREY)
	# Scores
	var modes = ["classique", "blitz", "survival"]
	var page_mode = modes[scoreboard_page]
	var entries = scoreboard_data.get(page_mode, [])
	if not scoreboard_charge:
		draw_string(police_normal, Vector2(0, 450), "CHARGEMENT...",
				HORIZONTAL_ALIGNMENT_CENTER, SCREEN_WIDTH, 28, GREY)
		return
	if entries.size() == 0:
		draw_string(police_normal, Vector2(0, 450), "AUCUN SCORE",
				HORIZONTAL_ALIGNMENT_CENTER, SCREEN_WIDTH, 28, GREY)
		return
	var medal_cols := [Color(1.0,0.84,0.0), Color(0.75,0.75,0.75), Color(0.80,0.50,0.20)]
	for i in range(entries.size()):
		var entry = entries[i]
		var placey = 210 + i * 70
		
		var is_me = entry.get("player_name","") == pseudo # Mon score ??
		var fond_place = Color(0.1,0.2,0.1) if is_me else Color(0.08,0.08,0.08)
		draw_rect(Rect2(20, placey, SCREEN_WIDTH - 40, 60), fond_place)
		# Bordure
		var border_col = GREEN if is_me else Color(0.25,0.25,0.25)
		draw_rect(Rect2(20, placey, SCREEN_WIDTH - 40, 60), border_col, false, 1.5)
		# Rang (1,2,3 utilise couleur medaille, sinon blanc)
		var rang_col = medal_cols[i] if i < 3 else GREY
		draw_string(police_normal, Vector2(30, placey + 40), str(i + 1) + ".", HORIZONTAL_ALIGNMENT_LEFT, -1, 24, rang_col)
		# Pseudo
		var nom = entry.get("player_name", "???") # cherche la valeur "player_name"
		draw_string(police_normal, Vector2(75, placey + 40), nom,
		HORIZONTAL_ALIGNMENT_LEFT, -1, 22, WHITE if not is_me else GREEN)
		# Score
		var valeur_score_entiere : int = int(entry.get("score", 0))
		var score_j = str(valeur_score_entiere)
		draw_string(police, Vector2(SCREEN_WIDTH - 85, placey + 40), score_j, HORIZONTAL_ALIGNMENT_RIGHT, -1, 22, cols_pages[scoreboard_page])

func _dessine_saisie_pseudo() -> void:
	draw_rect(Rect2(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT), Color(0, 0, 0, 0.92))
	draw_string(police, Vector2(0, 200), "TON PSEUDO", HORIZONTAL_ALIGNMENT_CENTER, SCREEN_WIDTH, 44, YELLOW)
	draw_string(police_normal, Vector2(0, 290), "13 CARACTERES MAX", HORIZONTAL_ALIGNMENT_CENTER, SCREEN_WIDTH, 20, GREY)
	# Champ de saisie
	draw_rect(Rect2(60, 340, 418, 90), Color(0.08,0.08,0.08))
	draw_rect(Rect2(60, 340, 418, 90), CYAN, false, 2.0)
	# EFFET DE CURSEUR CLIGNOTANT
	var affiche = pseudo + "|" if fmod(Time.get_ticks_msec(), 1000) < 500 else pseudo # fmod=> effet clignotement
	draw_string(police_normal, Vector2(0, 405), affiche, HORIZONTAL_ALIGNMENT_CENTER, SCREEN_WIDTH, 36, WHITE)
	draw_string(police_normal, Vector2(0, 480), "SUR PC: TAPE TON PSEUDO", HORIZONTAL_ALIGNMENT_CENTER, SCREEN_WIDTH, 18, GREY)
	draw_string(police_normal, Vector2(0, 510), "PUIS APPUIE ENTREE", HORIZONTAL_ALIGNMENT_CENTER, SCREEN_WIDTH, 18, GREY)
