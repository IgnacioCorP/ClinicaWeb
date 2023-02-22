package Web;

import Datos.ClienteDao;
import Dominio.Cliente;
import Negocio.ClienteNegocioInterfaz;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ClienteServlet")
public class ClienteServlet extends HttpServlet {
    // Ahora hacemos la inyección del componente EJB local al servlet

    @Inject
    // Ahora definimos nuestra variable
    ClienteNegocioInterfaz clienteNegocioInterfaz; // Cremos una instancia de nuestra if local

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");
        HttpSession sesion = request.getSession();

        if (accion != null) {
            switch (accion) {
                case "insertar":
                    this.InsertarCliente(request, response);
                    break;
                case "editar":
                    this.editarCliente(request, response);
                    break;
                case "eliminar":
                    this.EliminarCliente(request, response);
                    break;
                case "Login":
                    String email = request.getParameter("Email");
                    String contrasena = request.getParameter("Clave");

                    System.out.println("Email " + email);
                    System.out.println("Clave " + contrasena);

                    List<Cliente> usuariosLogin = clienteNegocioInterfaz.listarClientes();
                    System.out.println(usuariosLogin);
                    for (int i = 0; i < usuariosLogin.size(); i++) {

                        String correoUsuario = usuariosLogin.get(i).getEmail();
                        String contraUsuario = usuariosLogin.get(i).getClave();
                        if (correoUsuario.equals(email) && contraUsuario.equals(contrasena)) {
                            System.out.println("conectado");
                            correoUsuario = usuariosLogin.get(i).getEmail();
                            sesion.setAttribute("Email", correoUsuario);
                            System.out.println(usuariosLogin.get(i));
                            request.getRequestDispatcher("empleado.jsp").forward(request, response);
                            return;
                        }
                    }

                    request.setAttribute("mensajeError", "Email o contraseña incorrectos");
                    request.getRequestDispatcher("IniciarSesion.jsp").forward(request, response);

                    break;

                case "listarClientes":
                    List<Cliente> clientes = clienteNegocioInterfaz.listarClientes();
                    System.out.println("clientes: " + clientes);
                    request.setAttribute("clientes", clientes);
                    /*request.getRequestDispatcher("/listadoClientes.jsp").forward(request,
                response);*/
                    break;
                default:
                    this.accionDefault(request, response);
            }
        } else {
            //this.accionDefault(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");
        HttpSession sesion = request.getSession();

        if (accion != null) {
            switch (accion) {
                case "insertar":
                    this.InsertarCliente(request, response);
                    break;
                case "editar":
                    //this.eliminarCliente(request, response);
                    break;
                case "eliminar":
                    this.EliminarCliente(request, response);
                    break;
                case "Login":
                    String email = request.getParameter("Email");
                    String contrasena = request.getParameter("Clave");

                    System.out.println("Email " + email);
                    System.out.println("Clave " + contrasena);

                    List<Cliente> usuariosLogin = clienteNegocioInterfaz.listarClientes();
                    System.out.println(usuariosLogin);

                    boolean encontrado = false;

                    for (int i = 0; i < usuariosLogin.size(); i++) {
                        String correoUsuario = usuariosLogin.get(i).getEmail();
                        String contraUsuario = usuariosLogin.get(i).getClave();

                        if (correoUsuario.equals(email) && contraUsuario.equals(contrasena)) {
                            System.out.println("conectado");
                            correoUsuario = usuariosLogin.get(i).getEmail();
                            sesion.setAttribute("Email", correoUsuario);
                            System.out.println(usuariosLogin.get(i));
                            response.sendRedirect("empleado.jsp");
                            encontrado = true;
                            break;
                        }
                    }

                    if (!encontrado) {
                        request.setAttribute("mensajeError", "Las credenciales de inicio de sesión no son correctas. Por favor, inténtelo de nuevo.");
                        RequestDispatcher dispatcher = request.getRequestDispatcher("IniciarSesion.jsp");
                        dispatcher.forward(request, response);
                    }

                    break;

                case "listarClientes":
                    List<Cliente> clientes = clienteNegocioInterfaz.listarClientes();
                    System.out.println("clientes: " + clientes);
                    // Ponemos usuarios en un alcance
                    request.setAttribute("clientes", clientes);

                    // 4. Redigir el flujo desde el controlador a un JSP
                    response.sendRedirect("listadoClientes.jsp");
                    break;
                case "miCuenta":
                    Cliente cliente = (Cliente) request.getSession().getAttribute("cliente");
                    clienteNegocioInterfaz.encontrarClientePorID(cliente);
                    System.out.println("cliente: " + cliente);
                    request.setAttribute("cliente", cliente);
                    response.sendRedirect("listarCliente.jsp");
                    break;
                default:
                    this.accionDefault(request, response);
            }
        } else {
            //this.accionDefault(request, response);
        }
    }

    private void accionDefault(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Obtenemos el listado de los cliente
        List<Cliente> clientes = clienteNegocioInterfaz.listarClientes();
        request.getRequestDispatcher("/cliente.jsp").forward(request,
                response);

        // 2. Definimos un objeto session para compartir nuestro atributos en un contexto más amplio
        HttpSession sesion = request.getSession();

        // 3. Compartir en el nuevo alcance los atributos
        sesion.setAttribute("clientes", clientes);
        sesion.setAttribute("totalClientes", clientes.size());
        //sesion.setAttribute("saldoTotal", calcularTotal(clientes));
    }

    protected void InsertarCliente(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nif = request.getParameter("Nif");
        String nombre = request.getParameter("Nombre");
        String apellido = request.getParameter("Apellido");
        String email = request.getParameter("Email");
        String clave = request.getParameter("Clave");

        Cliente cliente = new Cliente(nif, nombre, apellido, email, clave);
        clienteNegocioInterfaz.registrarCliente(cliente);
        System.out.println("registrosModificados = " + cliente);
        //4. Redirigimos a la acción por defecto
        request.getRequestDispatcher("/empleado.jsp").forward(request,
                response);
    }

    protected void EliminarCliente(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nif = request.getParameter("Nif");
        Cliente cliente = new Cliente(nif);
        clienteNegocioInterfaz.eliminarCliente(cliente);
        // 4. Redirigimos al flujo de default
        this.accionDefault(request, response);
    }

    private void editarCliente(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Recuperamos los parámetros
        int Nif = Integer.parseInt(request.getParameter("Nif"));

        // 2. Ahora invocamos el método buscar cliente de acceso a datos
        Cliente cliente = new Cliente();

        // 3. Ahora compartimos el cliente en el alcance de request
        request.setAttribute("cliente", cliente);

        String jspeditar = "/editarCliente.jsp";

        // 4. Redirigimos y propagamos
        request.getRequestDispatcher(jspeditar).forward(request, response);

    }

}
