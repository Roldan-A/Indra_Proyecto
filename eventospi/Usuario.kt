package `PROYECTO INDRA`

// Clase para representar un usuario
class Usuario(nombre: String, email: String, contrasena: String) {
    val nombre: String = nombre
    val email: String = email
    private val contrasena: String = contrasena

    override fun toString(): String {
        return "$nombre - $email"
    }

    // validar la contraseña
    fun verificarContrasena(input: String): Boolean {
        return input == contrasena
    }
}