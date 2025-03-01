package `PROYECTO INDRA`

class ListadoEventos {private val eventos: MutableList<Evento> = mutableListOf()

    fun agregarEvento(nombre: String, fecha: String, descripcion: String = "") {
        if (nombre.isNotEmpty() && fecha.isNotEmpty()) {
            if (descripcion.isNotEmpty()) {
                eventos.add(EventoEspecial(nombre, fecha, descripcion))
            } else {
                eventos.add(Evento(nombre, fecha))
            }
        }
    }

    fun eliminarEvento(nombre: String) {
        eventos.removeIf { it.nombre.equals(nombre, ignoreCase = true) }
    }

    fun listarEventos() {
        eventos.forEach { println(it) }
    }

    fun buscarEvento(nombre: String): Evento? {
        return eventos.find { it.nombre.equals(nombre, ignoreCase = true) }
    }
}