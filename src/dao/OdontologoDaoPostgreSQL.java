package dao;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.ConexionPostgreSQL;
import modelo.Odontologo;



public class OdontologoDaoPostgreSQL implements OdontologoDao {
	
	private ConexionPostgreSQL conexion;
	
	private static final String INSERT_ODONTOLOGO_SQL = "INSERT INTO odontologo (documento, nombre, email, telefono, usuario, passoword) VALUES (?, ?, ?, ?, ?, ?);";
	private static final String DELETE_ODONTOLOGO_SQL = "DELETE FROM odontologo WHERE id = ?;";
	private static final String UPDATE_ODONTOLOGO_SQL = "UPDATE odontologo SET documento = ?, nombre = ?, email = ?, telefono = ? , usuario = ? , passoword = ?  WHERE id = ?;";
	private static final String SELECT_ODONTOLOGO_BY_ID = "SELECT * FROM odontologo WHERE id = ?;";
	private static final String SELECT_ODONTOLOGO_BY_USUARIO = "SELECT * FROM odontologo WHERE usuario = ?;";
	private static final String SELECT_ALL_ODONTOLOGOS = "SELECT * FROM odontologo;";
	
	
	
	public OdontologoDaoPostgreSQL() {
		this.conexion = ConexionPostgreSQL.getConexion();
	}

	public void insert(Odontologo odontologo) throws SQLException {
		try {
			PreparedStatement preparedStatement = (PreparedStatement) conexion.setPreparedStatement(INSERT_ODONTOLOGO_SQL);
			preparedStatement.setString(1, odontologo.getDocumento());
			preparedStatement.setString(2, odontologo.getNombre());
			preparedStatement.setString(3, odontologo.getEmail());
			preparedStatement.setString(4, odontologo.getTelefono());
			preparedStatement.setString(5, odontologo.getUsuario());
			preparedStatement.setString(6, odontologo.getPassword());
			conexion.execute();
		} catch (SQLException e) {
			
		}
	}
	
	public void delete (int id)  throws SQLException {
		try {
			PreparedStatement preparedStatement = (PreparedStatement) conexion.setPreparedStatement(DELETE_ODONTOLOGO_SQL);
			preparedStatement.setInt(1, id);

			conexion.execute();
		} catch (SQLException e) {
			
		}
	}
	
	public void update(Odontologo odontologo)  throws SQLException {
		try {
			PreparedStatement preparedStatement = (PreparedStatement) conexion.setPreparedStatement(UPDATE_ODONTOLOGO_SQL);
			preparedStatement.setString(1, odontologo.getDocumento());
			preparedStatement.setString(2, odontologo.getNombre());
			preparedStatement.setString(3, odontologo.getEmail());
			preparedStatement.setString(4, odontologo.getTelefono());
			preparedStatement.setString(5, odontologo.getUsuario());
			preparedStatement.setString(6, odontologo.getPassword());
			preparedStatement.setInt(7, odontologo.getId());
			conexion.execute();
		} catch (SQLException e) {
			
		}
	}
	
	public List<Odontologo> selectAll() {
		List <Odontologo> odontologos = new ArrayList<>();
		
		try {
			PreparedStatement preparedStatement = (PreparedStatement) conexion.setPreparedStatement(SELECT_ALL_ODONTOLOGOS);
			
			ResultSet rs = conexion.query();
			
			while(rs.next()) {
				int id = rs.getInt("id");
				String documento = rs.getString("documento");
				String nombre = rs.getString("nombre");
				String email = rs.getString("email");
				String telefono = rs.getString("telefono");
				String usuario = rs.getString("usuario");
				String password = rs.getString("password");
				odontologos.add(new Odontologo(id, documento, nombre, email,telefono,usuario,password));
			}
			
		} catch (SQLException e) {
			
		}
		
		return odontologos;
		
	}
	
	
	public Odontologo select(int id) {
		Odontologo odontologo = null;
		
		try {
			PreparedStatement preparedStatement = (PreparedStatement) conexion.setPreparedStatement(SELECT_ODONTOLOGO_BY_ID);
			preparedStatement.setInt(1, id);
			
			ResultSet rs = conexion.query();
			
			while(rs.next()) {
				String documento = rs.getString("documento");
				String nombre = rs.getString("nombre");
				String email = rs.getString("email");
				String telefono = rs.getString("telefono");
				String usuario = rs.getString("usuario");
				String password = rs.getString("password");
				odontologo = new Odontologo(id, documento, nombre, email,telefono,usuario,password);
			}
			
		} catch (SQLException e) {
			
		}
		
		return odontologo;
		
	}
	
	public Odontologo selectUsuario(String usuario) {
		Odontologo odontologo = null;
		
		try {
			PreparedStatement preparedStatement = (PreparedStatement) conexion.setPreparedStatement(SELECT_ODONTOLOGO_BY_USUARIO);
			preparedStatement.setString(1, usuario);
			ResultSet rs = conexion.query();
			
			while(rs.next()) {
				int id = rs.getInt("id");
				String documento = rs.getString("documento");
				String nombre = rs.getString("nombre");
				String email = rs.getString("email");
				String telefono = rs.getString("telefono");
				String password = rs.getString("password");
				odontologo = new Odontologo(id, documento, nombre, email,telefono,usuario,password);
			}
			
		} catch (SQLException e) {
			System.out.println("error");
		}
		
		return odontologo;
		
	}
}