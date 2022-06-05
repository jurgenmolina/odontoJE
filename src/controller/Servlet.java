package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.OdontologoDao;
import dao.OdontologoDaoFactory;
import modelo.Odontologo;


/**
 * Servlet implementation class UsuarioServlet
 */
@WebServlet("/")
public class Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private OdontologoDao odontologoDao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Servlet() {
        super();
    }
    
    public void init() throws ServletException {
		String type = getServletContext().getInitParameter("type");
		this.odontologoDao = OdontologoDaoFactory.getOdontologoDao(type);
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
			case "/dash":
				iniciarDashBoard(request, response);
				break;
			case "/insert":
				insertarUsuario(request, response);
				break;
			case "/delete":
				eliminarUsuario(request, response);
				break;
			case "/edit":
				showEditForm(request, response);
				break;
			case "/update":
				actualizarUsuario(request, response);
				break;
			
			
			default:
				iniciarSesion(request, response);
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
				response.sendRedirect("dash");
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
		
		request.setAttribute("odontologo", odontologo);
		RequestDispatcher dispatcher = request.getRequestDispatcher("dashboard.jsp");
		dispatcher.forward(request, response);
	}
	
	private void insertarUsuario(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, SQLException, IOException {
		
	}
	
	private void showEditForm(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
	}
	
	private void actualizarUsuario(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, SQLException, IOException {
		
	}
	
	private void eliminarUsuario(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, SQLException, IOException {
		
	}
	
	private void listUsuarios(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, SQLException, IOException {
		
	}
}