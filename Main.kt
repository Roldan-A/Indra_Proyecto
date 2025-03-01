package `PROYECTO INDRA`

// Menú interactivo en consola
fun main() {
    val gestorUsuarios = GestionUsuario()
    val gestorEventos = ListadoEventos()
    val gestorInscripciones = GestionInscripciones()

    while (true) {
        println("\n--- Menú Principal ---")
        println("1. Agregar Usuario")
        println("2. Eliminar Usuario")
        println("3. Listar Usuarios")
        println("4. Agregar Evento")
        println("5. Eliminar Evento")
        println("6. Listar Eventos")
        println("7. Inscribir Usuario en Evento")
        println("8. Cancelar Inscripción")
        println("9. Listar Inscripciones")
        println("0. Salir")
        print("Seleccione una opción: ")

        when (readln().toInt()) {
            1 -> {  // Agregar Usuario
                print("Ingrese nombre del usuario: ")
                val nombre = readln()
                print("Ingrese email del usuario: ")
                val email = readln()
                print("Ingrese contraseña: ")
                val contrasena = readln()
                gestorUsuarios.agregarUsuario(nombre, email, contrasena)
            }
            2 -> {  // Eliminar Usuario
                print("Ingrese email del usuario a eliminar: ")
                val email = readln()
                gestorUsuarios.eliminarUsuario(email)
            }
            3 -> gestorUsuarios.listarUsuarios()
            4 -> {  // Agregar Evento
                print("Ingrese nombre del evento: ")
                val nombre = readln()
                print("Ingrese fecha del evento (YYYY-MM-DD): ")
                val fecha = readln()
                print("Ingrese descripción del evento (opcional): ")
                val descripcion = readln()
                gestorEventos.agregarEvento(nombre, fecha, descripcion)
            }
            5 -> {  // Eliminar Evento
                print("Ingrese nombre del evento a eliminar: ")
                val nombre = readln()
                gestorEventos.eliminarEvento(nombre)
            }
            6 -> gestorEventos.listarEventos()
            7 -> {  // Inscribir Usuario en Evento
                print("Ingrese email del usuario: ")
                val emailUsuario = readln()
                print("Ingrese contraseña del usuario: ")
                val contrasenaIngresada = readln()
                print("Ingrese nombre del evento: ")
                val eventoNombre = readln()

                val usuario = gestorUsuarios.buscarUsuario(emailUsuario)
                val evento = gestorEventos.buscarEvento(eventoNombre)

                if (usuario != null && evento != null) {
                    if (usuario.verificarContrasena(contrasenaIngresada)) {
                        gestorInscripciones.inscribirUsuario(usuario, evento)
                        println("Usuario inscrito correctamente ")
                    } else {
                        println("Contraseña incorrecta ")
                    }
                } else {
                    println("Usuario o evento no encontrado ")
                }
            }
            8 -> {  // Cancelar Inscripción
                print("Ingrese email del usuario: ")
                val emailUsuario = readln()
                print("Ingrese nombre del evento: ")
                val eventoNombre = readln()

                val usuario = gestorUsuarios.buscarUsuario(emailUsuario)
                val evento = gestorEventos.buscarEvento(eventoNombre)

                if (usuario != null && evento != null) {
                    gestorInscripciones.cancelarInscripcion(usuario, evento)
                } else {
                    println("Usuario o evento no encontrado")
                }
            }
            9 -> gestorInscripciones.listarInscripciones()
            0 -> return
            else -> println("Opción no válida. Intente de nuevo")
        }
    }
}
