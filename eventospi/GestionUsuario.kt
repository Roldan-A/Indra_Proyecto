package `PROYECTO INDRA`

class GestionUsuario {
    private val usuarios: MutableList<Usuario> = mutableListOf()

    fun agregarUsuario(nombre: String, email: String, contrasena: String) {
        if (nombre.isNotEmpty() && email.isNotEmpty() && contrasena.isNotEmpty()) {
            if (usuarios.any { it.email.equals(email, ignoreCase = true) }) {
                println("Error: Ya existe un usuario con este email.")
                return
            }
            usuarios.add(Usuario(nombre, email, contrasena))
            println("Usuario registrado correctamente")
        } else {
            println("Error: Todos los campos son obligatorios")
        }
    }

    fun eliminarUsuario(email: String) {
        val eliminado = usuarios.removeIf { it.email.equals(email, ignoreCase = true) }
        if (eliminado) {
            println("Usuario eliminado correctamente")
        } else {
            println("Error: Usuario no encontrado")
        }
    }

    fun listarUsuarios() {
        if (usuarios.isEmpty()) {
            println("No hay usuarios registrados.")
        } else {
            usuarios.forEach { println(it) }
        }
    }

    fun buscarUsuario(email: String): Usuario? {
        return usuarios.find { it.email.equals(email, ignoreCase = true) }
    }
}
