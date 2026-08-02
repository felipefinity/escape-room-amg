extends Node

var nome_equipe = "Equipe Teste"
var tempo_restante_formatado = "00:00"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func salvar_log_partida(resultado_final: String, tempo_final: String):
	var caminho = "user://historico_escape_room.csv"
	var arquivo
	
	if not FileAccess.file_exists(caminho):
		arquivo = FileAccess.open(caminho, FileAccess.WRITE)
		# Só escreve o cabeçalho se conseguiu abrir o arquivo
		if arquivo != null: 
			arquivo.store_line("Equipe;Resultado;Tempo;Data") 
	else:
		arquivo = FileAccess.open(caminho, FileAccess.READ_WRITE)
		if arquivo != null:
			arquivo.seek_end()
			
	# --- BARREIRA DE PROTEÇÃO CONTRA CRASHES ---
	if arquivo == null:
		print("Bloqueio de permissão! O jogo continuará normalmente, mas não salvou o log.")
		return # Interrompe a função silenciosamente e o jogo segue rodando
		
	# Se passou pela barreira, é porque o arquivo abriu com sucesso!
	var data_atual = Time.get_datetime_string_from_system()
	var linha = "%s;%s;%s;%s" % [nome_equipe, resultado_final, tempo_final, data_atual]
	
	arquivo.store_line(linha)
	arquivo.close()
