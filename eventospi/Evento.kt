package `PROYECTO INDRA`

open class Evento(nombre: String, fecha: String) {
    val nombre: String = nombre
    val fecha: String = fecha

    override fun toString(): String {
        return "$nombre - $fecha"
    }
}

