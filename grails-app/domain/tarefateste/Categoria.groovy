package tarefateste

class Categoria {
	String descricao
    static constraints = {
		descricao(unique: true)
    }
	String toString(){
		return descricao
	  }
}
