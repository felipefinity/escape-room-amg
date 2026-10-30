extends Control

const COR_RELOGIO_NORMAL = Color(0.12, 0.16, 0.23) # Grafite escuro elegante
const COR_RELOGIO_PERIGO = Color(0.80, 0.05, 0.05) # Vermelho rubi forte

# Variaveis do game
@onready var tela_game_over = $TelaGameOver

@onready var tela_vitoria = $TelaVitoria
@onready var label_nome_time = $TelaVitoria/LabelNomeTime

# Variaveis de tempo
@onready var label_relogio = $LabelRelogio
@onready var timer_jogo = $TimerJogo
var tempo_maximo_sala = 1200.0 # Caso trocar o tempo de game tenho que lembrar de trocar aqui também

# Variaveis PC
@onready var input_pc = $PopupPC/MonitorUI/TelaLogin/SenhaPC
@onready var mensagem_pc = $PopupPC/MonitorUI/TelaLogin/MensagemPC
@onready var tela_login = $PopupPC/MonitorUI/TelaLogin
@onready var tela_desktop = $PopupPC/MonitorUI/TelaDesktop
@onready var alerta_protheus = $PopupPC/MonitorUI/TelaDesktop/AlertaProtheus

# Variaveis Celular
@onready var tela_login_celular = $PopupCelular/CelularUI/TelaLoginCelular
@onready var tela_home_celular = $PopupCelular/CelularUI/TelaHomeCelular
@onready var app_mensagens = $PopupCelular/CelularUI/TelaHomeCelular/AppMensagens

@onready var input_pin = $PopupCelular/CelularUI/TelaLoginCelular/LineEdit
@onready var teclado = $PopupCelular/CelularUI/TelaLoginCelular/GridContainer
@onready var mensagem_pin = $PopupCelular/CelularUI/TelaLoginCelular/MensagemPIN
@onready var label_hora_celular = $PopupCelular/CelularUI/StatusCelular/LabelHoraCelular

# APPS Celular
@onready var appNoticias = $PopupCelular/CelularUI/TelaNoticias
@onready var appNotas = $PopupCelular/CelularUI/TelaNotas
@onready var appCalendario = $PopupCelular/CelularUI/TelaCalendario
@onready var appFotos = $PopupCelular/CelularUI/TelaFotos
@onready var appEmail = $PopupCelular/CelularUI/TelaEmail
@onready var appMensagens = $PopupCelular/CelularUI/TelaMensagens
@onready var appTelefone = $PopupCelular/CelularUI/TelaTelefone

# App Fotos
@onready var tela_ampliada = $PopupCelular/CelularUI/TelaFotos/TelaAmpliada
@onready var foto_gigante = $PopupCelular/CelularUI/TelaFotos/TelaAmpliada/FotoGigante

# App Mensagens
@onready var TelaChat1 = $PopupCelular/CelularUI/TelaMensagens/TelaChat1
@onready var TelaChat2 = $PopupCelular/CelularUI/TelaMensagens/TelaChat2
@onready var TelaChat3 = $PopupCelular/CelularUI/TelaMensagens/TelaChat3
@onready var TelaChat4 = $PopupCelular/CelularUI/TelaMensagens/TelaChat4

@onready var phishingCelMsg1 = $PopupCelular/CelularUI/TelaMensagens/TelaChat2/Panel/phishingMsg1
@onready var phishingCelMsg2 = $PopupCelular/CelularUI/TelaMensagens/TelaChat4/Panel/phishingMsg2
@onready var avisoPhisingCel = $PopupCelular/CelularUI/TelaMensagens/AvisoPhishing

# App Telefone
@onready var visor_numerico = $PopupCelular/CelularUI/TelaTelefone/VisorNumero
@onready var audio_senha = $PopupCelular/CelularUI/TelaTelefone/AudioSenha
@onready var audio_erro = $PopupCelular/CelularUI/TelaTelefone/AudioErro

#Desktop Email

@onready var abrirOutlookDesktop = $PopupPC/MonitorUI/AppEmailDesktop

@onready var msgPadraoEmail = $PopupPC/MonitorUI/AppEmailDesktop/DivisaoTela/ConteudoDireita/MensagemPadrao
@onready var conteudoEmail1 = $PopupPC/MonitorUI/AppEmailDesktop/DivisaoTela/ConteudoDireita/Email1Conteudo
@onready var conteudoEmail2 = $PopupPC/MonitorUI/AppEmailDesktop/DivisaoTela/ConteudoDireita/Email2Conteudo
@onready var conteudoEmail3 = $PopupPC/MonitorUI/AppEmailDesktop/DivisaoTela/ConteudoDireita/Email3Conteudo
@onready var conteudoEmail4 = $PopupPC/MonitorUI/AppEmailDesktop/DivisaoTela/ConteudoDireita/Email4Conteudo
@onready var conteudoEmail5 = $PopupPC/MonitorUI/AppEmailDesktop/DivisaoTela/ConteudoDireita/Email5Conteudo
@onready var conteudoEmail6 = $PopupPC/MonitorUI/AppEmailDesktop/DivisaoTela/ConteudoDireita/Email6Conteudo
@onready var conteudoEmail7 = $PopupPC/MonitorUI/AppEmailDesktop/DivisaoTela/ConteudoDireita/Email7Conteudo
@onready var conteudoEmail8 = $PopupPC/MonitorUI/AppEmailDesktop/DivisaoTela/ConteudoDireita/Email8Conteudo
@onready var conteudoEmail9 = $PopupPC/MonitorUI/AppEmailDesktop/DivisaoTela/ConteudoDireita/Email9Conteudo

@onready var alertaPhishingEmail = $PopupPC/MonitorUI/AppEmailDesktop/DivisaoTela/ConteudoDireita/AlertaPhishing

@onready var btn_phishing_email_1 = $PopupPC/MonitorUI/AppEmailDesktop/DivisaoTela/ConteudoDireita/Email1Conteudo/panelazul/Button
@onready var btn_phishing_email_5 = $PopupPC/MonitorUI/AppEmailDesktop/DivisaoTela/ConteudoDireita/Email5Conteudo/Button

# Desktop Blocos de Notas
@onready var BlocoNotas = $PopupPC/MonitorUI/AppLogsDesktop
@onready var texto_logs = $PopupPC/MonitorUI/AppLogsDesktop/TextEdit

# Desktop Terminal
@onready var app_terminal_desktop = $PopupPC/MonitorUI/AppTerminalDesktop
@onready var historico_terminal = $PopupPC/MonitorUI/AppTerminalDesktop/MargemInterna/OrganizadorVertical/HistoricoTerminal
@onready var input_terminal = $PopupPC/MonitorUI/AppTerminalDesktop/MargemInterna/OrganizadorVertical/LinhaDeComando/InputTerminal
@onready var BtnDecrypt = $PopupPC/MonitorUI/AppRansomware/MargemGeral/DivisaoColunas/ColunaDireita/AreaDesbloqueio/BotaoDesbloquear


# Desktop Ransomware
@onready var app_ransomware = $PopupPC/MonitorUI/AppRansomware
@onready var input_chave_ransomware = $PopupPC/MonitorUI/AppRansomware/MargemGeral/DivisaoColunas/ColunaDireita/AreaDesbloqueio/InputChaveAES
@onready var relogio_ransomware = $PopupPC/MonitorUI/AppRansomware/MargemGeral/DivisaoColunas/ColunaEsquerda/FundoCronometro/RelogioTexto

var numero_digitado = ""

# Audios
@onready var audioErroXP = $SomErroWindowsXP
@onready var audioLoginWindows = $WindowsXPLogin
@onready var ErroLoginCelular = $ErroLoginCelular
@onready var audioLoginCelular = $DesbloqueioCelular
@onready var som_armadilha = $SomArmadilha
@onready var musica_derrota = $SomGameOver
@onready var musica_vitoria = $MusicaVitoria

# easter egg
var cliques_biscoito: int = 0
@onready var som_comer_mc = $mc_comer
@onready var som_arroto_mc = $mc_arroto

# Musica suspense
@onready var musica_tensao = $MusicaTensao
@onready var voz_aviso_tempo = $VozAvisoTempo
var musica_tensao_tocando: bool = false


func _ready():
	
	label_relogio.modulate = COR_RELOGIO_NORMAL
	
	# Garante que o modal sempre inicie escondido quando a sala carregar
	$PopupPC.hide()
	$PopupCelular.hide()
	
	# Laço para conectar os botões do celular via código (padrão Godot 4)
	for filho in teclado.get_children():
		# Verifica se o nó atual é realmente um botão (ignora os 'Controls' vazios do layout)
		if filho is Button:
			# .bind() passa o texto do botão (ex: "1", "2") como argumento para a função
			filho.pressed.connect(_on_botao_numero_pressed.bind(filho.text))

	# Boas vindas do terminal
	historico_terminal.text = "[color=#00FF00]Terminal v1.0.4 - Sistema de Recuperacao de Emergencia\nDigite 'help' para ver os comandos disponiveis.\n\n[/color]"

func _on_botao_pc_pressed():
	# Torna o modal visível
	$PopupPC.show()

func _on_botao_fechar_pc_pressed():
	# Esconde o modal
	$PopupPC.hide()
	
func _on_botao_celular_pressed() -> void:
	$PopupCelular.show()

func _on_botao_fechar_cel_pressed() -> void:
	$PopupCelular.hide()
	
func _on_botao_biscoito_pressed() -> void:
	cliques_biscoito += 1
	
	if cliques_biscoito < 3:
		som_comer_mc.play()
	else:
		som_arroto_mc.play()
		cliques_biscoito = 0

func _on_botao_numero_pressed(numero_digitado: String):
	# Adiciona o número ao input
	input_pin.text += numero_digitado
	
	# Auto-verificação no 4º dígito
	if input_pin.text.length() == 4:
		validar_pin()

func validar_pin():
	if input_pin.text == "3007": 
		# Feedback de Sucesso
		mensagem_pin.text = "DESBLOQUEADO"
		mensagem_pin.modulate = Color.GREEN # Muda a cor do texto para verde
		
		audioLoginCelular.play()
		
		await get_tree().create_timer(1.5).timeout
		
		tela_login_celular.hide()
		tela_home_celular.show()
		
		# Opcional: Aqui também colocaremos um delay pequeno antes de 
		# sumir com essa tela e mostrar a tela dos apps/dicas do celular
		
	else:
		# Feedback de Erro
		ErroLoginCelular.play()
		mensagem_pin.text = "PIN INCORRETO"
		mensagem_pin.modulate = Color.RED # Muda a cor do texto para vermelho
		
		# O Timer que já havíamos colocado
		await get_tree().create_timer(1.5).timeout 
		
		# Limpa o input e volta a mensagem para o estado original
		input_pin.text = "" 
		mensagem_pin.text = "Aguardando PIN..."
		mensagem_pin.modulate = Color.WHITE # Volta para a cor branca original

func _on_entrar_pc_pressed() -> void:
	# .to_lower() transforma tudo que a pessoa digitou em minúsculo na hora de testar
	var senha_digitada = input_pc.text.to_lower()
	
	if senha_digitada == "cybersec":
		# Feedback de Sucesso
		mensagem_pc.text = "ACESSO CONCEDIDO"
		mensagem_pc.modulate = Color.GREEN
		
		# Espera 1 segundinho pro jogador ler que acertou
		await get_tree().create_timer(1.5).timeout
		
		audioLoginWindows.play()
		
		# Mágica da transição: Esconde o login, mostra o desktop
		tela_login.hide()
		tela_desktop.show()
		
	else:
		# Feedback de Erro
		mensagem_pc.text = "ACESSO NEGADO"
		mensagem_pc.modulate = Color.RED
		audioErroXP.play()
		
		await get_tree().create_timer(1.5).timeout
		
		# Limpa o input e reseta a mensagem para o estado original
		input_pc.text = ""
		mensagem_pc.text = "Digite a Senha"
		mensagem_pc.modulate = Color.WHITE

func _on_senha_pc_text_submitted(new_text: String) -> void:
	_on_entrar_pc_pressed()

func _on_botao_olho_pressed():
	# Inverte o estado atual: se está secreto, revela; se está revelado, oculta.
	input_pc.secret = not input_pc.secret
	
func _process(delta):
	# Pega o tempo que falta no timer e converte pra número inteiro (corta os milissegundos)
	var tempo_restante = int(timer_jogo.time_left)
	
	# Matemática básica para extrair os minutos e os segundos
	var minutos = tempo_restante / 60
	var segundos = tempo_restante % 60
	
	# Salva a formatação em uma variável para podermos distribuir para vários relógios
	var tempo_formatado = "%02d:%02d" % [minutos, segundos]
	
	# Formata a string para sempre ter 2 dígitos. Ex: em vez de "5:9", fica "05:09"
	label_relogio.text = tempo_formatado
	
	# ATUALIZAÇÃO RANSOMWARE: Espelha o mesmo tempo. 
	# Adicionei "00:" na frente para imitar o formato (Horas:Minutos:Segundos) da imagem de referência
	relogio_ransomware.text = "00:" + tempo_formatado
	
	# 1. Pega a hora exata do Windows/Mac/Linux do usuário
	var tempo_real = Time.get_time_dict_from_system()
	
	# 2. Formata para colocar o zero na frente (ex: 09:05 em vez de 9:5)
	var hora_formatada = "%02d:%02d" % [tempo_real.hour, tempo_real.minute]
	
	# 3. Atualiza o relógio do Celular
	label_hora_celular.text = hora_formatada
	
	# Dispara uma única vez quando bater 3 minutos (180s) ou menos
	if timer_jogo.time_left <= 180 and not musica_tensao_tocando and not timer_jogo.is_stopped():
		musica_tensao_tocando = true
		iniciar_musica_tensao()
	
# Função que coordena a Voz + Música + Relógio Vermelho
func iniciar_musica_tensao() -> void:
	# 1. Deixa o relógio vermelho fixo para dar urgência visual
	label_relogio.modulate = COR_RELOGIO_PERIGO
	
	# 2. Toca a voz "O tempo está acabando" alta e clara (0 dB)
	voz_aviso_tempo.volume_db = 0.0
	voz_aviso_tempo.play()
	
	# 3. Começa a música bem baixinha (-28 dB) por trás da voz
	musica_tensao.volume_db = -10.0
	musica_tensao.play()
	
	# 4. Sobe a música devagar ao longo de 6 segundos (assim ela só encorpa depois que a voz termina!)
	var tween = create_tween()
	tween.tween_property(musica_tensao, "volume_db", -8.0, 6.0)


func _on_timer_jogo_timeout():
	
	musica_tensao.stop()
	voz_aviso_tempo.stop()
	# 1. Salva no Excel (Como mudamos a vitória para "tempo que sobrou", 
	# na derrota sobrou "00:00" no relógio!)
	Global.salvar_log_partida("PERDEU", "00:00")
	
	# 2. Garante que o som de derrota ignore o pause e toque até o fim
	musica_derrota.process_mode = Node.PROCESS_MODE_ALWAYS
	musica_derrota.play()
	
	# 3. Centraliza o pivô da tela de Game Over
	tela_game_over.pivot_offset = tela_game_over.size / 2
	
	# 4. Começa MAIOR (1.3x) e brilhando em VERMELHO ALERTA
	tela_game_over.scale = Vector2(1.3, 1.3)
	tela_game_over.modulate = Color(2.0, 0.2, 0.2, 0.0) # Vermelho intenso transparente
	tela_game_over.show()
	
	# 5. Trava o resto do jogo
	get_tree().paused = true
	
	# 6. Animação de "Impacto Pesado" (Cai na tela batendo seco com TRANS_BOUNCE)
	var tween = create_tween()
	tween.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS) # Roda mesmo com o jogo pausado!
	tween.set_parallel(true)
	
	tween.tween_property(tela_game_over, "scale", Vector2(1.0, 1.0), 0.45).set_trans(Tween.TRANS_BOUNCE).set_ease(Tween.EASE_OUT)
	tween.tween_property(tela_game_over, "modulate", Color(1, 1, 1, 1), 0.4)


func _on_reiniciar_escape_room_pressed():
	get_tree().paused = false
	
	# Limpa o nome para a próxima equipe não herdar (útil para ambas as telas)
	Global.nome_equipe = "" 
	
	# Volta para a tela inicial
	get_tree().change_scene_to_file("res://sala_principal.tscn")


func _on_sair_game_pressed():
	# Fecha o aplicativo/jogo instantaneamente
	get_tree().quit()
	
func vencer_jogo():
	
	musica_tensao.stop()
	voz_aviso_tempo.stop()
	# 1. Pega direto o tempo que SOBROU no relógio e para o timer
	var tempo_restante = int(timer_jogo.time_left)
	timer_jogo.stop()
	
	# 2. Formata o tempo restante (Ex: 19:00)
	var minutos = tempo_restante / 60
	var segundos = tempo_restante % 60
	var tempo_formatado = "%02d:%02d" % [minutos, segundos]
	
	# 3. Coloca Equipe e Tempo no mesmo Label (um em cima do outro com \n)
	label_nome_time.text = "Equipe: " + Global.nome_equipe + "\nEscapou no tempo: " + tempo_formatado
	
	# 4. Salva no Excel o tempo que sobrou no relógio
	Global.salvar_log_partida("VENCEU", tempo_formatado)
	
	# --- EFEITO DE VITÓRIA ---
	# 5. Garante que a música ignore o pause e toque até o fim
	if has_node("MusicaVitoria"):
		$MusicaVitoria.process_mode = Node.PROCESS_MODE_ALWAYS
		$MusicaVitoria.play()
		
	# 6. Centraliza o pivô da tela de vitória para ela crescer do meio
	tela_vitoria.pivot_offset = tela_vitoria.size / 2
	
	# 7. Começa pequena e brilhando em verde claro
	tela_vitoria.scale = Vector2(0.5, 0.5)
	tela_vitoria.modulate = Color(0.3, 1.5, 0.3, 0.0) # Verde brilhante transparente
	tela_vitoria.show()
	
	# 8. Pausa o resto do jogo
	get_tree().paused = true
	
	# 9. Animação de "Saltar na tela" (Efeito elástico TRANS_BACK)
	var tween = create_tween()
	tween.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS) # Garante que o Tween rode no pause!
	tween.set_parallel(true) # Roda o tamanho e a cor ao mesmo tempo
	
	tween.tween_property(tela_vitoria, "scale", Vector2(1.0, 1.0), 0.5).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	tween.tween_property(tela_vitoria, "modulate", Color(1, 1, 1, 1), 0.4)

# Função universal para fechar qualquer app e voltar para a Home
func _on_botao_home_universal_pressed():
	# Esconde as telas dos aplicativos
	appNoticias.hide()
	appNotas.hide()
	appCalendario.hide()
	appFotos.hide()
	appEmail.hide()
	appMensagens.hide()
	appTelefone.hide()


func _on_app_notas_pressed():
	appNotas.show()
	
func _on_app_noticias_pressed():
	appNoticias.show()

func _on_app_calendario_pressed():
	appCalendario.show()
	
func _on_app_galeria_pressed():
	appFotos.show()

func _on_botao_fechar_x_pressed():
	# Apenas esconde a tela de ampliação, voltando para a galeria
	tela_ampliada.hide()

func _on_miniatura_1_pressed():
	# 1. Carrega a imagem da pista para dentro do quadro gigante
	foto_gigante.texture = preload("res://appfotos1.jpg")

#   2. Mostra a tela ampliada por cima de tudo
	tela_ampliada.show()

func _on_miniatura_2_pressed():
	foto_gigante.texture = preload("res://appfotos2.jpg")
	tela_ampliada.show()

func _on_miniatura_3_pressed():
	foto_gigante.texture = preload("res://appfotos3.jpg")
	tela_ampliada.show()

func _on_miniatura_4_pressed():
	foto_gigante.texture = preload("res://appfotos4.jpg")
	tela_ampliada.show()

func _on_miniatura_5_pressed():
	foto_gigante.texture = preload("res://appfotos5.jpg")
	tela_ampliada.show()

func _on_miniatura_6_pressed():
	foto_gigante.texture = preload("res://appfotos6.jpg")
	tela_ampliada.show()

func _on_app_email_pressed():
	appEmail.show()

func _on_app_mensagens_pressed():
	appMensagens.show()

func _on_voltar_msg_pressed_global():
	TelaChat1.hide()
	TelaChat2.hide()
	TelaChat3.hide()
	TelaChat4.hide()

func _on_btn_mensagem_1_pressed():
	TelaChat1.show()

func _on_btn_mensagem_2_pressed():
	TelaChat2.show()

func _on_btn_mensagem_3_pressed():
	TelaChat3.show()

func _on_btn_mensagem_4_pressed():
	TelaChat4.show()

func phishingMsg1():
	
	phishingCelMsg1.disabled = true
	som_armadilha.play()
	phishingCelMsg1.add_theme_color_override("font_color", Color(0.5, 0.5, 0.5))
	avisoPhisingCel.show()
	
	var tempo_atual = timer_jogo.time_left # Quanto tempo tem agora?
	var tempo_perdido = 150 # 150 Segundos = 2 min e 30s
	
	if tempo_atual > tempo_perdido:
		# Se tiver mais de 30s, subtrai 30 e recomeça o timer
		timer_jogo.start(tempo_atual - tempo_perdido)
	else:
		# Se tiver menos de 30s, o jogador "morre" (Tempo zera)
		# Passamos um tempo ínfimo (0.01) para forçar o sinal de timeout imediatamente
		timer_jogo.start(0.01)
		
	# 3. EFEITO VISUAL NO RELÓGIO (Susto + Flash Vermelho)
	# Centraliza o eixo do relógio para ele crescer a partir do meio
	label_relogio.pivot_offset = label_relogio.size / 2
	
	# Fica vermelho vivo e aumenta 50% de tamanho instantaneamente
	label_relogio.modulate = Color(1.0, 0.15, 0.15) 
	label_relogio.scale = Vector2(1.5, 1.5)
	
	# CORREÇÃO AQUI: Checa direto se o novo tempo já caiu para 180s (3 min) ou menos!
	var cor_retorno = COR_RELOGIO_PERIGO if timer_jogo.time_left <= 180 else COR_RELOGIO_NORMAL
	
	var tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property(label_relogio, "scale", Vector2(1.0, 1.0), 0.5).set_trans(Tween.TRANS_BOUNCE).set_ease(Tween.EASE_OUT)
	tween.tween_property(label_relogio, "modulate", cor_retorno, 0.6)
		
func phishingMsg2():
	phishingCelMsg2.disabled = true
	som_armadilha.play()
	phishingCelMsg2.add_theme_color_override("font_color", Color(0.5, 0.5, 0.5))
	avisoPhisingCel.show()
	
	var tempo_atual = timer_jogo.time_left # Quanto tempo tem agora?
	var tempo_perdido = 150 # 150 Segundos = 2 min e 30s
	
	if tempo_atual > tempo_perdido:
		# Se tiver mais de 30s, subtrai 30 e recomeça o timer
		timer_jogo.start(tempo_atual - tempo_perdido)
	else:
		# Se tiver menos de 30s, o jogador "morre" (Tempo zera)
		# Passamos um tempo ínfimo (0.01) para forçar o sinal de timeout imediatamente
		timer_jogo.start(0.01)
		
	# 3. EFEITO VISUAL NO RELÓGIO (Susto + Flash Vermelho)
	# Centraliza o eixo do relógio para ele crescer a partir do meio
	label_relogio.pivot_offset = label_relogio.size / 2
	
	# Fica vermelho vivo e aumenta 50% de tamanho instantaneamente
	label_relogio.modulate = Color(1.0, 0.15, 0.15) 
	label_relogio.scale = Vector2(1.5, 1.5)
	
	# CORREÇÃO AQUI: Checa direto se o novo tempo já caiu para 180s (3 min) ou menos!
	var cor_retorno = COR_RELOGIO_PERIGO if timer_jogo.time_left <= 180 else COR_RELOGIO_NORMAL
	
	var tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property(label_relogio, "scale", Vector2(1.0, 1.0), 0.5).set_trans(Tween.TRANS_BOUNCE).set_ease(Tween.EASE_OUT)
	tween.tween_property(label_relogio, "modulate", cor_retorno, 0.6)
		
	
func _fechar_aviso_smishing():
	avisoPhisingCel.hide()

func _on_phone_pressed():
	appTelefone.show()
	

# LÓGICA DE DIGITAÇÃO (App telefone)
func adicionar_numero(digito: String):
	# Se o visor estiver mostrando texto de erro/chamada, limpa a tela antes de digitar
	if visor_numerico.text == "Em chamada com TI" or visor_numerico.text == "Número Inexistente":
		numero_digitado = ""
		visor_numerico.text = ""
		
	# Limita a 6 caracteres para o texto não vazar da tela
	if numero_digitado.length() < 11:
		numero_digitado += digito
		visor_numerico.text = numero_digitado

# Conecte o sinal 'pressed()' de cada botão numérico a essas funções
func _on_btn_1_pressed(): adicionar_numero("1")
func _on_btn_2_pressed(): adicionar_numero("2")
func _on_btn_3_pressed(): adicionar_numero("3")
func _on_btn_4_pressed(): adicionar_numero("4")
func _on_btn_5_pressed(): adicionar_numero("5")
func _on_btn_6_pressed(): adicionar_numero("6")
func _on_btn_7_pressed(): adicionar_numero("7")
func _on_btn_8_pressed(): adicionar_numero("8")
func _on_btn_9_pressed(): adicionar_numero("9")
func _on_btn_0_pressed(): adicionar_numero("0")
func _on_btn_asterisco_pressed(): adicionar_numero("*")
func _on_btn_hashtag_pressed(): adicionar_numero("#")


# ==========================================
# CONTROLES INFERIORES
# ==========================================

func _on_apagar_txt_pressed():
	# Só apaga se tiver algo escrito e se não for uma mensagem de texto do sistema
	if numero_digitado.length() > 0 and visor_numerico.text != "Em chamada com TI" and visor_numerico.text != "Número Inexistente":
		# Corta o último caractere da string
		numero_digitado = numero_digitado.substr(0, numero_digitado.length() - 1)
		visor_numerico.text = numero_digitado

func _on_ligar_pressed():
	
	# PROTEÇÃO: Se qualquer um dos áudios já estiver tocando, o botão não faz nada!
	if audio_senha.playing or audio_erro.playing:
		return
		
	# Impede de tentar ligar com o visor vazio
	if numero_digitado == "":
		return
		
	# Verifica se é o ramal da pista!
	if numero_digitado == "#127001":
		visor_numerico.text = "Em chamada com TI"
		# Toca o áudio com a senha do PC
		audio_senha.play()
	else:
		visor_numerico.text = "Número Inexistente"
		# Toca um som de bipe de erro (telefone fora de área)
		audio_erro.play()
		
	# Zera a variável silenciosamente. Assim, quando ele apertar um número de novo, recomeça do zero.
	numero_digitado = ""

func _on_email_button_pressed() -> void:
	abrirOutlookDesktop.show()
	
func _on_fecharEmail_pressed() -> void:
	abrirOutlookDesktop.hide()

func _on_button_email_1_pressed() -> void:
	alertaPhishingEmail.hide()
	msgPadraoEmail.hide()
	conteudoEmail1.show()
	conteudoEmail2.hide()
	conteudoEmail3.hide()
	conteudoEmail4.hide()
	conteudoEmail5.hide()
	conteudoEmail6.hide()
	conteudoEmail7.hide()
	conteudoEmail8.hide()
	conteudoEmail9.hide()


func _on_button_email_2_pressed() -> void:
	alertaPhishingEmail.hide()
	msgPadraoEmail.hide()
	conteudoEmail1.hide()
	conteudoEmail2.show()
	conteudoEmail3.hide()
	conteudoEmail4.hide()
	conteudoEmail5.hide()
	conteudoEmail6.hide()
	conteudoEmail7.hide()
	conteudoEmail8.hide()
	conteudoEmail9.hide()


func _on_button_email_3_pressed() -> void:
	alertaPhishingEmail.hide()
	msgPadraoEmail.hide()
	conteudoEmail1.hide()
	conteudoEmail2.hide()
	conteudoEmail3.show()
	conteudoEmail4.hide()
	conteudoEmail5.hide()
	conteudoEmail6.hide()
	conteudoEmail7.hide()
	conteudoEmail8.hide()
	conteudoEmail9.hide()


func _on_button_email_4_pressed() -> void:
	alertaPhishingEmail.hide()
	msgPadraoEmail.hide()
	conteudoEmail1.hide()
	conteudoEmail2.hide()
	conteudoEmail3.hide()
	conteudoEmail4.show()
	conteudoEmail5.hide()
	conteudoEmail6.hide()
	conteudoEmail7.hide()
	conteudoEmail8.hide()
	conteudoEmail9.hide()


func _on_button_email_5_pressed() -> void:
	alertaPhishingEmail.hide()
	msgPadraoEmail.hide()
	conteudoEmail1.hide()
	conteudoEmail2.hide()
	conteudoEmail3.hide()
	conteudoEmail4.hide()
	conteudoEmail5.show()
	conteudoEmail6.hide()
	conteudoEmail7.hide()
	conteudoEmail8.hide()
	conteudoEmail9.hide()


func _on_button_email_6_pressed() -> void:
	alertaPhishingEmail.hide()
	msgPadraoEmail.hide()
	conteudoEmail1.hide()
	conteudoEmail2.hide()
	conteudoEmail3.hide()
	conteudoEmail4.hide()
	conteudoEmail5.hide()
	conteudoEmail6.show()
	conteudoEmail7.hide()
	conteudoEmail8.hide()
	conteudoEmail9.hide()


func _on_button_email_7_pressed() -> void:
	alertaPhishingEmail.hide()
	msgPadraoEmail.hide()
	conteudoEmail1.hide()
	conteudoEmail2.hide()
	conteudoEmail3.hide()
	conteudoEmail4.hide()
	conteudoEmail5.hide()
	conteudoEmail6.hide()
	conteudoEmail7.show()
	conteudoEmail8.hide()
	conteudoEmail9.hide()


func _on_button_email_8_pressed() -> void:
	alertaPhishingEmail.hide()
	msgPadraoEmail.hide()
	conteudoEmail1.hide()
	conteudoEmail2.hide()
	conteudoEmail3.hide()
	conteudoEmail4.hide()
	conteudoEmail5.hide()
	conteudoEmail6.hide()
	conteudoEmail7.hide()
	conteudoEmail8.show()
	conteudoEmail9.hide()


func _on_button_email_9_pressed() -> void:
	alertaPhishingEmail.hide()
	msgPadraoEmail.hide()
	conteudoEmail1.hide()
	conteudoEmail2.hide()
	conteudoEmail3.hide()
	conteudoEmail4.hide()
	conteudoEmail5.hide()
	conteudoEmail6.hide()
	conteudoEmail7.hide()
	conteudoEmail8.hide()
	conteudoEmail9.show()


func _on_sair_aviso_phishing_pressed() -> void:
	alertaPhishingEmail.hide()


func _on_button_phishing1email() -> void:
	# 1. Desativa o botão e muda a cor da fonte para cinza
	btn_phishing_email_1.disabled = true
	som_armadilha.play()
	btn_phishing_email_1.add_theme_color_override("font_color", Color(0.5, 0.5, 0.5))
	
	# 2. Exibe o alerta vermelho gigante
	alertaPhishingEmail.show()
	
	# 3. Aplica a penalidade de tempo
	var tempo_atual = timer_jogo.time_left
	var tempo_perdido = 150 
	
	if tempo_atual > tempo_perdido:
		timer_jogo.start(tempo_atual - tempo_perdido)
	else:
		timer_jogo.start(0.01)
		
	# 3. EFEITO VISUAL NO RELÓGIO (Susto + Flash Vermelho)
	# Centraliza o eixo do relógio para ele crescer a partir do meio
	label_relogio.pivot_offset = label_relogio.size / 2
	
	# Fica vermelho vivo e aumenta 50% de tamanho instantaneamente
	label_relogio.modulate = Color(1.0, 0.15, 0.15) 
	label_relogio.scale = Vector2(1.5, 1.5)
	
	# CORREÇÃO AQUI: Checa direto se o novo tempo já caiu para 180s (3 min) ou menos!
	var cor_retorno = COR_RELOGIO_PERIGO if timer_jogo.time_left <= 180 else COR_RELOGIO_NORMAL
	
	var tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property(label_relogio, "scale", Vector2(1.0, 1.0), 0.5).set_trans(Tween.TRANS_BOUNCE).set_ease(Tween.EASE_OUT)
	tween.tween_property(label_relogio, "modulate", cor_retorno, 0.6)


func _on_button_phishing2email() -> void:
	# 1. Desativa o botão e muda a cor da fonte para cinza
	btn_phishing_email_5.disabled = true
	som_armadilha.play()
	btn_phishing_email_5.add_theme_color_override("font_color", Color(0.5, 0.5, 0.5))
	
	# 2. Exibe o alerta vermelho gigante
	alertaPhishingEmail.show()
	
	# 3. Aplica a penalidade de tempo
	var tempo_atual = timer_jogo.time_left
	var tempo_perdido = 150 
	
	if tempo_atual > tempo_perdido:
		timer_jogo.start(tempo_atual - tempo_perdido)
	else:
		timer_jogo.start(0.01)
	
	# 3. EFEITO VISUAL NO RELÓGIO (Susto + Flash Vermelho)
	# Centraliza o eixo do relógio para ele crescer a partir do meio
	label_relogio.pivot_offset = label_relogio.size / 2
	
	# Fica vermelho vivo e aumenta 50% de tamanho instantaneamente
	label_relogio.modulate = Color(1.0, 0.15, 0.15) 
	label_relogio.scale = Vector2(1.5, 1.5)
	
	# CORREÇÃO AQUI: Checa direto se o novo tempo já caiu para 180s (3 min) ou menos!
	var cor_retorno = COR_RELOGIO_PERIGO if timer_jogo.time_left <= 180 else COR_RELOGIO_NORMAL
	
	var tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property(label_relogio, "scale", Vector2(1.0, 1.0), 0.5).set_trans(Tween.TRANS_BOUNCE).set_ease(Tween.EASE_OUT)
	tween.tween_property(label_relogio, "modulate", cor_retorno, 0.6)

func _on_logs_button_pressed() -> void:
	BlocoNotas.show()

func _on_sair_bloco_notas_pressed() -> void:
	BlocoNotas.hide()

func _on_sair_terminal_pressed() -> void:
	app_terminal_desktop.hide()

func _on_terminal_button_pressed() -> void:
	app_terminal_desktop.show()
	input_terminal.call_deferred("grab_focus")
	

# Quando o jogador aperta ENTER no terminal
func _on_input_terminal_text_submitted(new_text: String) -> void:
	var comando = new_text.strip_edges()
	
	# Exibe o que o usuário digitou no histórico
	historico_terminal.text += "[color=#FFFFFF]C:\\> " + comando + "[/color]\n"
	
	# Limpa o input imediatamente para a próxima digitação
	input_terminal.text = ""
	
	# Lógica dos comandos
	if comando == "help":
		historico_terminal.text += "[color=#FFFF00]Comandos disponiveis:\n - decode <chave_base64>\n - cls (limpa a tela)\n - exit (fecha o terminal)[/color]\n\n"
		
	elif comando == "cls":
		historico_terminal.text = ""
		
	elif comando == "exit":
		app_terminal_desktop.hide()
		return
		
	elif comando.begins_with("decode "):
		var chave = comando.substr(7).strip_edges()
		
		if chave == "VDBUVlNfU2F2ZXI=":
			historico_terminal.text += "[color=#00FF00]SUCESSO: Hash quebrado com sucesso.[/color]\n"
			historico_terminal.text += "[color=#00FF00]CHAVE DE DESCRIPTOGRAFIA (AES-256): 4F8A-9B22-C37D[/color]\n\n"
		else:
			historico_terminal.text += "[color=#FF0000]ERRO: Chave invalida ou corrompida.[/color]\n\n"
	else:
		historico_terminal.text += "[color=#FF0000]Comando desconhecido. Digite 'help'.[/color]\n\n"
	

# Ransomware - Etapa final
func _on_protheus_button_pressed():
	app_ransomware.show()
	input_chave_ransomware.grab_focus()
	
func _on_botao_sair_ransomware_pressed() -> void:
	app_ransomware.hide()
	
func _on_botao_desbloquear_pressed() -> void:
	# Pega o texto diretamente da propriedade .text do nó de input
	var chave_digitada = input_chave_ransomware.text.strip_edges().to_upper()
	
	if chave_digitada == "4F8A-9B22-C37D":
		# 1. Limpa a tela vermelha do ransomware
		app_ransomware.hide()
		
		vencer_jogo()
		
	else:
		
		BtnDecrypt.disabled = true
		
		# 1. Limpa o texto e avisa no próprio campo
		input_chave_ransomware.text = ""
		input_chave_ransomware.placeholder_text = "❌ CHAVE INVÁLIDA! TENTE NOVAMENTE..."
		
		# 2. Toca o som de erro (se o nó existir)
		if has_node("SomErroWindowsXP"):
			$SomErroWindowsXP.play()
		
		# 3. Pinta a caixa de texto de vermelho claro para destacar onde foi o erro
		input_chave_ransomware.modulate = Color(1, 0.4, 0.4) 
		
		# 4. TREMEDEIRA NA JANELA INTEIRA (AppRansomware)
		var pos_janela = app_ransomware.position
		var tween = create_tween()
		
		# Sacode a janela vermelha inteira para os lados com mais força (12 pixels)
		tween.tween_property(app_ransomware, "position:x", pos_janela.x + 12, 0.04)
		tween.tween_property(app_ransomware, "position:x", pos_janela.x - 12, 0.04)
		tween.tween_property(app_ransomware, "position:x", pos_janela.x + 8, 0.04)
		tween.tween_property(app_ransomware, "position:x", pos_janela.x - 8, 0.04)
		tween.tween_property(app_ransomware, "position:x", pos_janela.x, 0.04)
		
		# Devolve a cor branca normal para a caixa de texto no final
		tween.tween_property(input_chave_ransomware, "modulate", Color(1, 1, 1), 0.2)
		
		# 4. Espera a animação terminar completamente e destrava o botão!
		await tween.finished
		BtnDecrypt.disabled = false
		input_chave_ransomware.grab_focus() # Já devolve o cursor pra pessoa digitar de novo!
