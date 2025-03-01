package `PROYECTO INDRA`

class GestionInscripciones { private val inscripciones: MutableList<Pair<Usuario, Evento>> = mutableListOf()

    fun inscribirUsuario(usuario: Usuario, evento: Evento) {
        if (!inscripciones.any { it.first == usuario && it.second == evento }) {
            inscripciones.add(Pair(usuario, evento))
        }
    }

    fun cancelarInscripcion(usuario: Usuario, evento: Evento) {
        inscripciones.removeIf { it.first == usuario && it.second == evento }
    }

    fun listarInscripciones() {
        inscripciones.forEach { println("${it.first.nombre} está inscrito en ${it.second.nombre}") }
    }
}