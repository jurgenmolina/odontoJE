package dao;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.ConexionPostgreSQL;
import modelo.Odontologo;
import modelo.Paciente;



public class PacienteDaoPostgreSQL implements PacienteDao {
	
	private ConexionPostgreSQL conexion;
	
	private static final String INSERT_PACIENTE_SQL = "INSERT INTO paciente (tipodocumento, documento, nombre, apellido, email, telefono, id_odontologo, foto, fechanacimiento, genero) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?,?);";
	private static final String DELETE_PACIENTE_SQL = "DELETE FROM paciente WHERE id = ?;";
	private static final String UPDATE_PACIENTE_SQL = "UPDATE paciente SET tipodocumento = ?, documento = ?, nombre = ?, apellido = ?, email = ?, telefono = ? , id_odontologo = ? , fechanacimiento = ? , genero = ?  WHERE id = ?;";
	private static final String UPDATE_PACIENTE_FOTO_SQL = "UPDATE paciente SET foto = ?  WHERE id = ?;";
	
	private static final String SELECT_PACIENTE_BY_ID = "SELECT * FROM paciente WHERE id = ?;";
	private static final String SELECT_PACIENTE_BY_ODONTOLOGO = "SELECT * FROM paciente WHERE id_odontologo = ?;";
	private static final String SELECT_ALL_PACIENTES = "SELECT * FROM paciente;";
	private static final String SELECT_ALL_PACIENTES_POR_ODONTOLOGO = "SELECT * FROM paciente WHERE id_odontologo = ?;";
	
	
	
	public PacienteDaoPostgreSQL() {
		this.conexion = ConexionPostgreSQL.getConexion();
	}

	public void insert(Paciente paciente) throws SQLException {
		try {
			PreparedStatement preparedStatement = (PreparedStatement) conexion.setPreparedStatement(INSERT_PACIENTE_SQL);
			preparedStatement.setString(1, paciente.getTipodocumento());
			preparedStatement.setString(2, paciente.getDocumento());
			preparedStatement.setString(3, paciente.getNombre());
			preparedStatement.setString(4, paciente.getApellido());
			preparedStatement.setString(5, paciente.getEmail());
			preparedStatement.setString(6, paciente.getTelefono());
			preparedStatement.setInt(7, paciente.getOdontologo().getId());
			preparedStatement.setString(8, paciente.getFoto());
			preparedStatement.setString(9, paciente.getFechanacimiento());
			preparedStatement.setString(10, paciente.getGenero());
			conexion.execute();
		} catch (SQLException e) {

			System.out.println ("erro");
		}
	}
	
	public void delete (int id)  throws SQLException {
		try {
			PreparedStatement preparedStatement = (PreparedStatement) conexion.setPreparedStatement(DELETE_PACIENTE_SQL);
			preparedStatement.setInt(1, id);

			conexion.execute();
		} catch (SQLException e) {
			
		}
	}
	
	public void update(Paciente paciente)  throws SQLException {
		try {
			PreparedStatement preparedStatement = (PreparedStatement) conexion.setPreparedStatement(UPDATE_PACIENTE_SQL);
			preparedStatement.setString(1, paciente.getTipodocumento());
			preparedStatement.setString(2, paciente.getDocumento());
			preparedStatement.setString(3, paciente.getNombre());
			preparedStatement.setString(4, paciente.getApellido());
			preparedStatement.setString(5, paciente.getEmail());
			preparedStatement.setString(6, paciente.getTelefono());
			preparedStatement.setInt(7, paciente.getOdontologo().getId());
			preparedStatement.setString(8, paciente.getFechanacimiento());
			preparedStatement.setString(9, paciente.getGenero());
			preparedStatement.setInt(10, paciente.getId());
			conexion.execute();
		} catch (SQLException e) {
			System.out.println("error");
		}
	}
	
	public void updateFoto(Paciente paciente)  throws SQLException {
		try {
			PreparedStatement preparedStatement = (PreparedStatement) conexion.setPreparedStatement(UPDATE_PACIENTE_FOTO_SQL);
			preparedStatement.setString(1, paciente.getFoto());
			preparedStatement.setInt(2, paciente.getId());
			conexion.execute();
		} catch (SQLException e) {
			System.out.println("error");
		}
	}
	
	
	public List<Paciente> selectAll() {
		List <Paciente> pacientes = new ArrayList<>();
		
		try {
			PreparedStatement preparedStatement = (PreparedStatement) conexion.setPreparedStatement(SELECT_ALL_PACIENTES);
			
			ResultSet rs = conexion.query();
			
			while(rs.next()) {
				int id = rs.getInt("id");
				String tipodocumento = rs.getString("tipodocumento");
				String documento = rs.getString("documento");
				String nombre = rs.getString("nombre");
				String apellido = rs.getString("apellido");
				String email = rs.getString("email");
				String telefono = rs.getString("telefono");
				String foto = rs.getString("foto");
				String fechanacimiento = rs.getString("fechanacimiento");
				String genero = rs.getString("genero");
				int id_Odontologo = rs.getInt("id_odontologo");
				Odontologo odontologo = new Odontologo();
				odontologo.setId(id_Odontologo);
				pacientes.add(new Paciente(id, tipodocumento, documento, nombre, apellido, email,telefono,foto,odontologo, fechanacimiento, genero));
			}
			
		} catch (SQLException e) {
			
		}
		
		return pacientes;
		
	}
	
	
	public Paciente select(int id) {
		Paciente paciente = null;
		try {
			PreparedStatement preparedStatement = (PreparedStatement) conexion.setPreparedStatement(SELECT_PACIENTE_BY_ID);
			preparedStatement.setInt(1, id);
			
			ResultSet rs = conexion.query();
			
			while(rs.next()) {
				String tipodocumento = rs.getString("tipodocumento");
				String documento = rs.getString("documento");
				String nombre = rs.getString("nombre");
				String apellido = rs.getString("apellido");
				String email = rs.getString("email");
				String telefono = rs.getString("telefono");
				String foto = rs.getString("foto");
				String fechanacimiento = rs.getString("fechanacimiento");
				String genero = rs.getString("genero");
				String archivo = rs.getString("archivo");
				int id_Odontologo = rs.getInt("id_odontologo");
				Odontologo odontologo = new Odontologo();
				odontologo.setId(id_Odontologo);
				paciente = new Paciente(id, tipodocumento, documento, nombre, apellido, email,telefono,foto,odontologo, fechanacimiento, genero, archivo);
			}
			
		} catch (SQLException e) {
			
		}
		return paciente;
		
	}
	
	public Paciente selectOdontologo(int id_odontologo) {
		
		Paciente paciente = null;
		
		try {
			PreparedStatement preparedStatement = (PreparedStatement) conexion.setPreparedStatement(SELECT_PACIENTE_BY_ODONTOLOGO);
			preparedStatement.setInt(1, id_odontologo);
			
			ResultSet rs = conexion.query();
			
			while(rs.next()) {
				
				int id = rs.getInt("id");
				String tipodocumento = rs.getString("tipodocumento");
				String documento = rs.getString("documento");
				String nombre = rs.getString("nombre");
				String apellido = rs.getString("apellido");
				String email = rs.getString("email");
				String telefono = rs.getString("telefono");
				String foto = rs.getString("foto");
				String fechanacimiento = rs.getString("fechanacimiento");
				String genero = rs.getString("genero");
				Odontologo odontologo = new Odontologo();
				odontologo.setId(id_odontologo);
				paciente = new Paciente(id, tipodocumento, documento, nombre, apellido, email,telefono,foto,odontologo, fechanacimiento, genero);
			}
			
		} catch (SQLException e) {
			
		}
		
		return paciente;
		
	}
	
	public List <Paciente>  selectAllOdontologo(int id_odontologo) {
		
		List <Paciente> pacientes = new ArrayList<>();
		
		try {
			PreparedStatement preparedStatement = (PreparedStatement) conexion.setPreparedStatement(SELECT_ALL_PACIENTES_POR_ODONTOLOGO);
			preparedStatement.setInt(1, id_odontologo);
			
			ResultSet rs = conexion.query();
			
			while(rs.next()) {
				
				int id = rs.getInt("id");
				String tipodocumento = rs.getString("tipodocumento");
				String documento = rs.getString("documento");
				String nombre = rs.getString("nombre");
				String apellido = rs.getString("apellido");
				String email = rs.getString("email");
				String telefono = rs.getString("telefono");
				String foto = rs.getString("foto");
				String fechanacimiento = rs.getString("fechanacimiento");
				String genero = rs.getString("genero");
				Odontologo odontologo = new Odontologo();
				odontologo.setId(id_odontologo);
				pacientes.add(new Paciente(id, tipodocumento, documento, nombre, apellido, email,telefono,foto,odontologo, fechanacimiento, genero));
			}
			
		} catch (SQLException e) {
			
		}
		
		return pacientes;
		
	}
	
	
}