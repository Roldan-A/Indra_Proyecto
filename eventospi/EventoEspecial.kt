package `PROYECTO INDRA`

class EventoEspecial(nombre: String, fecha: String, descripcion: String) : Evento(nombre, fecha) {
    val descripcion: String = descripcion

    override fun toString(): String {
        return "$nombre - $fecha - $descripcion"
    }
}