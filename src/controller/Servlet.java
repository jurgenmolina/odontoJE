package controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import dao.CitaDao;
import dao.CitaDaoFactory;
import dao.OdontologoDao;
import dao.OdontologoDaoFactory;
import dao.PacienteDao;
import dao.PacienteDaoFactory;
import modelo.Cita;
import modelo.Odontologo;
import modelo.Paciente;


/**
 * Servlet implementation class Servlet
 */
@WebServlet("/")
@MultipartConfig
public class Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private OdontologoDao odontologoDao;
	private PacienteDao  pacienteDao;
	private CitaDao citaDao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Servlet() {
        super();
    }
    
    public void init() throws ServletException {
		String type = getServletContext().getInitParameter("type");
		this.odontologoDao = OdontologoDaoFactory.getOdontologoDao(type);
		this.pacienteDao = PacienteDaoFactory.getPacienteDao(type);
		this.citaDao = CitaDaoFactory.getCitaDao(type);
	}


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getServletPath();
		System.out.println(action);
		try {
		switch(action) {
			case "/login":
				iniciarSesion(request, response);
				break;
			case "/inicio":
				iniciarDashBoard(request, response);
				break;
			case "/cerrarSesion":
				cerrarSesion(request, response);
				break;
			case "/editarPaciente":
				editarPaciente(request, response);
				break;
			case "/actualizarPaciente":
				actualizarPaciente(request, response);
				break;
			case "/eliminarPaciente":
				eliminarPaciente(request, response);
				break;
			case "/registrarPaciente":
				registrarPaciente(request, response);
				break;
			case "/insertarPaciente":
				insertarPaciente(request, response);
				break;				
			case "/registrarCita":
				registrarCita(request, response);
				break;
			case "/insertarCita":
				insertarCita(request, response);
				break;
			case "/calendario":
				iniciarCalendario(request, response);
				break;
			case "/editarCita":
				editarCita(request, response);
				break;
			case "/eliminarCita":
				eliminarCita(request, response);
				break;
			case "/updateCita":
				updateCita(request, response);
				break;
			case "/updateFotoPaciente":
				updateFoto(request, response);
				break;
			case "/mostrarInfo":
				mostrarInfo(request, response);
				break;
				
				
				
			default:
				showLogin(request, response);
				break;
		
		}
		}catch(SQLException e) {
			throw new ServletException(e);
		}
		
		
	}

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private void mostrarInfo(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, SQLException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		Cita cita = citaDao.select(id);
		
		int i = cita.getOdontologo().getId();
		Odontologo o = odontologoDao.select(i);
		cita.setOdontologo(o);
		
		int j = cita.getPaciente().getId();
		Paciente p = pacienteDao.select(j);
		cita.setPaciente(p);
		request.setAttribute("cita", cita);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("mostrar.jsp");
		dispatcher.forward(request, response);
		
		
	}
	
//	Metodo para subir los archivos del paciente y despues actualiza en la base de datos el campo archivo
	
	private void editarCita(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, SQLException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		Cita cita = citaDao.select(id);
		
		int i = cita.getOdontologo().getId();
		Odontologo o = odontologoDao.select(i);
		cita.setOdontologo(o);
		
		int j = cita.getPaciente().getId();
		Paciente p = pacienteDao.select(j);
		cita.setPaciente(p);
		request.setAttribute("cita", cita);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("editar-Cita.jsp");
		dispatcher.forward(request, response);
		
		
	}
	
	private void updateCita(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, SQLException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		String consulta = request.getParameter("consulta");
		String estado = request.getParameter("v");
		PrintWriter out = response.getWriter();
		String nomb = request.getParameter("foto");
		String nomb2 = request.getParameter("foto2");
		Part arch = request.getPart("archivo");
		InputStream is = arch.getInputStream();
		File f = new File("C:/xampp/htdocs/Servidor/archivos/"+nomb);
		FileOutputStream ous = new FileOutputStream(f);
		int dato = is.read();
		while(dato != -1){
			ous.write(dato);
			dato = is.read();
		}
		
		ous.close();
		is.close();
		
		
		
		Part arch2 = request.getPart("archivo2");
		InputStream is2 = arch2.getInputStream();
		File f2 = new File("C:/xampp/htdocs/Servidor/firmas/"+nomb2);
		FileOutputStream ous2 = new FileOutputStream(f2);
		int dato2 = is2.read();
		while(dato2 != -1){
			ous2.write(dato2);
			dato2 = is2.read();
		}
		
		ous2.close();
		is2.close();
		
		
		
		Cita cita = new Cita(id, consulta, estado, nomb, nomb2);
		citaDao.updateCita(cita);
		
		response.sendRedirect("calendario");
		
	}
	
	private void updateFoto(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, SQLException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		PrintWriter out = response.getWriter();
		String nomb = request.getParameter("foto");
		Part arch = request.getPart("archivo");
		InputStream is = arch.getInputStream();
		File f = new File("C:/xampp/htdocs/Servidor/profiles/"+nomb);
		FileOutputStream ous = new FileOutputStream(f);
		int dato = is.read();
		while(dato != -1){
			ous.write(dato);
			dato = is.read();
		}
		
		ous.close();
		is.close();
		
		Paciente paciente = new Paciente(id, nomb);
		pacienteDao.updateFoto(paciente);
		
		Paciente pacienteActual = pacienteDao.select(id);
		
		request.setAttribute("paciente", pacienteActual);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("editar-Paciente.jsp");
		dispatcher.forward(request, response);
		
		
	}

	
	private void actualizarPaciente(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, SQLException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		String tipodocumento = request.getParameter("tipodocumento");
		String documento = request.getParameter("documento");
		String nombre = request.getParameter("nombre");
		String apellido = request.getParameter("apellido");
		String email = request.getParameter("email");
		String foto = request.getParameter("foto");
		String fechanacimiento = request.getParameter("fechanacimiento");
		String genero = request.getParameter("genero");
		String telefono = request.getParameter("telefono");
		int odonto = Integer.parseInt(request.getParameter("id_odontologo"));
		Odontologo odontologo = odontologoDao.select(odonto);
		
		Paciente paciente = new Paciente (id, tipodocumento, documento, nombre, apellido, email, telefono, odontologo, fechanacimiento, genero);
		
		pacienteDao.update(paciente);
		
		response.sendRedirect("inicio");
		
		
	}
	
	private void editarPaciente(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		Paciente pacienteActual = pacienteDao.select(id);
		
		request.setAttribute("paciente", pacienteActual);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("editar-Paciente.jsp");
		dispatcher.forward(request, response);
		
	}
	
	private void eliminarPaciente(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, SQLException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		pacienteDao.delete(id);
		
		response.sendRedirect("inicio");
		
		
		
	}
	
	private void eliminarCita(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, SQLException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		citaDao.delete(id);
		
		response.sendRedirect("calendario");
		
		
		
	}
	
	private void iniciarSesion(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		
		String usuario = request.getParameter("usuario");
		String password = request.getParameter("password");
		
		List <Odontologo> ods = odontologoDao.selectAll();
		
		for(Odontologo e: ods) {
			
			if(e.getUsuario().equalsIgnoreCase(usuario) && e.getPassword().equals(password)) {
				Odontologo odontologoActual = odontologoDao.selectUsuario(usuario);
				HttpSession misession= request.getSession(true);
				misession.setAttribute("odontologo",odontologoActual); 
				response.sendRedirect("inicio");
				return;
			}
		}
		
	        RequestDispatcher dispatcher=request.getRequestDispatcher( "login.jsp" );  
	        dispatcher.include(request, response);  
		
	}
	
	
	
	private void iniciarDashBoard(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		HttpSession misession= (HttpSession) request.getSession();
		 
		Odontologo odontologo= (Odontologo) misession.getAttribute("odontologo");
		
		List <Paciente> listPaciente = pacienteDao.selectAllOdontologo(odontologo.getId());
		
		request.setAttribute("listPaciente", listPaciente);
		RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
		dispatcher.forward(request, response);
	}
	
	private void cerrarSesion(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, SQLException, IOException {
		
		HttpSession misession= (HttpSession) request.getSession();
		
		misession.invalidate();
		RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
		dispatcher.forward(request, response);
		
	}
	
	private void showLogin(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
		dispatcher.forward(request, response);
		
	}
	
	private void insertarPaciente(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, SQLException, IOException {
		
		String tipodocumento = request.getParameter("tipodocumento");
		String documento = request.getParameter("documento");
		String nombre = request.getParameter("nombre");
		String apellido = request.getParameter("apellido");
		String email = request.getParameter("email");
		String telefono = request.getParameter("telefono");
		String fechanacimiento = request.getParameter("fechanacimiento");
		String genero = request.getParameter("genero");
		int odonto = Integer.parseInt(request.getParameter("id_odontologo"));
		Odontologo odontologo = odontologoDao.select(odonto);
		PrintWriter out = response.getWriter();
		String nomb = request.getParameter("foto");
		if(!nomb.isEmpty()) {
			Part arch = request.getPart("archivo");
			InputStream is = arch.getInputStream();
			File f = new File("C:/xampp/htdocs/Servidor/profiles/"+nomb);
			FileOutputStream ous = new FileOutputStream(f);
			int dato = is.read();
			while(dato != -1){
				ous.write(dato);
				dato = is.read();
			}
			
			ous.close();
			is.close();
			
			Paciente paciente = new Paciente (tipodocumento, documento, nombre, apellido, email, telefono, nomb ,odontologo, fechanacimiento, genero);
			pacienteDao.insert(paciente);
			response.sendRedirect("inicio");
			return;
		}
		
		
		Paciente paciente = new Paciente (tipodocumento, documento, nombre, apellido, email, telefono ,odontologo, fechanacimiento, genero);
		pacienteDao.insert(paciente);
		response.sendRedirect("inicio");
		
	}
	
	private void registrarPaciente(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, SQLException, IOException {
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("registro-Paciente.jsp");
		dispatcher.forward(request, response);
		
	}
	
	private void registrarCita(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, SQLException, IOException {
		
		
		HttpSession misession= (HttpSession) request.getSession();
		 
		Odontologo odontologo= (Odontologo) misession.getAttribute("odontologo");
		
		List <Paciente> listPaciente = pacienteDao.selectAllOdontologo(odontologo.getId());
		
		request.setAttribute("listPaciente", listPaciente);
		RequestDispatcher dispatcher = request.getRequestDispatcher("registro-Cita.jsp");
		dispatcher.forward(request, response);
		
	}
	
	private void insertarCita(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, SQLException, IOException {
		
		String fecha = request.getParameter("fecha");
		System.out.println(fecha);
		String estado = request.getParameter("estado");
		
		int pac = Integer.parseInt(request.getParameter("paciente"));
		Paciente paciente = pacienteDao.select(pac);
		
		int odonto = Integer.parseInt(request.getParameter("odontologo"));
		Odontologo odontologo = odontologoDao.select(odonto);
		
		Cita cita = new Cita (paciente, odontologo, fecha, estado);
		citaDao.insert(cita);
		response.sendRedirect("calendario");
		
	}
	
	private void iniciarCalendario(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		HttpSession misession= (HttpSession) request.getSession();
		 
		Odontologo odontologo= (Odontologo) misession.getAttribute("odontologo");
		
		List <Cita> listaCitas = citaDao.selectAllOdontologo(odontologo.getId());
		
		for(Cita cita : listaCitas) {
			int i = cita.getOdontologo().getId();
			Odontologo o = odontologoDao.select(i);
			cita.setOdontologo(o);
			
			int j = cita.getPaciente().getId();
			Paciente p = pacienteDao.select(j);
			cita.setPaciente(p);
			}
		
		
		request.setAttribute("listaCitas", listaCitas);
		RequestDispatcher dispatcher = request.getRequestDispatcher("calendario.jsp");
		dispatcher.forward(request, response);
	}
	
	
}