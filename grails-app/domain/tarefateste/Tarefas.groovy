package tarefateste

class Tarefas {
	
	String descricao
	Date dtFinal
	Categoria categoria
	Boolean status
	static belongsTo=[Categoria]
	
    static constraints = {
		 descricao(unique: true)
		 status(blank:true, default: Boolean.FALSE)
    }
}

