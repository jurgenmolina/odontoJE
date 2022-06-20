package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import modelo.Cita;
import modelo.Odontologo;
import modelo.Paciente;
import util.ConexionPostgreSQL;

public class CitaDaoPostgreSQL implements CitaDao{
	
	private ConexionPostgreSQL conexion;
	
	private static final String INSERT_CITA_SQL = "INSERT INTO cita (paciente, odontologo, fecha, estado) VALUES (?, ?, ?, ?);";
	private static final String DELETE_CITA_SQL = "DELETE FROM cita WHERE id = ?;";
	private static final String UPDATE_CITA_SQL = "UPDATE cita SET  consulta = ?, estado = ?, archivo = ? , firma = ?  WHERE id = ?;";
	private static final String SELECT_CITA_BY_ID = "SELECT * FROM Cita WHERE id = ?;";
	private static final String SELECT_ALL_CITAS_POR_ODONTOLOGO = "SELECT * FROM cita WHERE odontologo = ?;";
	
	public CitaDaoPostgreSQL() {
		this.conexion = ConexionPostgreSQL.getConexion();
	}
	
	@Override
	public void insert(Cita cita) throws SQLException {
		try {
			PreparedStatement preparedStatement = (PreparedStatement) conexion.setPreparedStatement(INSERT_CITA_SQL);
			preparedStatement.setInt(1, cita.getPaciente().getId());
			preparedStatement.setInt(2, cita.getOdontologo().getId());
			preparedStatement.setString(3, cita.getFecha());
			preparedStatement.setBoolean(4, false);
			
			
			conexion.execute();
		} catch (SQLException e) {
			System.out.println("error");
		}
		
	}


	
	public void updateCita(Cita cita) throws SQLException {
		try {
			PreparedStatement preparedStatement = (PreparedStatement) conexion.setPreparedStatement(UPDATE_CITA_SQL);
			preparedStatement.setString(1, cita.getConsulta());
			preparedStatement.setBoolean(2, true);
			preparedStatement.setString(3, cita.getArchivo());
			preparedStatement.setString(4, cita.getFirma());
			preparedStatement.setInt(5, cita.getId());
			conexion.execute();
		} catch (SQLException e) {
			System.out.println("error");
		}
	}
	
	public Cita select(int id) {
		Cita cita = null;
		
		try {
			PreparedStatement preparedStatement = (PreparedStatement) conexion.setPreparedStatement(SELECT_CITA_BY_ID);
			preparedStatement.setInt(1, id);
			
			ResultSet rs = conexion.query();
			
			while(rs.next()) {
				
				int id_Paciente = rs.getInt("paciente");
				Paciente paciente = new Paciente();
				paciente.setId(id_Paciente);
				String fecha = rs.getString("fecha");
				String consulta = rs.getString("consulta");
				String estado = rs.getString("estado");
				Odontologo odontologo = new Odontologo();
				int id_odontologo = rs.getInt("odontologo");
				odontologo.setId(id_odontologo);		
				String archivo = rs.getString("archivo");
				String firma = rs.getString("firma");
				
				cita = new Cita(id, paciente, odontologo, fecha, consulta, estado, archivo, firma);
			}
			
		} catch (SQLException e) {
			System.out.println("error");
		}
		
		return cita;
	}

	@Override
	public void delete(int id) throws SQLException {
		try {
			PreparedStatement preparedStatement = (PreparedStatement) conexion.setPreparedStatement(DELETE_CITA_SQL);
			preparedStatement.setInt(1, id);

			conexion.execute();
		} catch (SQLException e) {
			
		}
		
	}


	
	
public List <Cita>  selectAllOdontologo(int x) {
		
		List <Cita> citas = new ArrayList<>();
		
		try {
			PreparedStatement preparedStatement = (PreparedStatement) conexion.setPreparedStatement(SELECT_ALL_CITAS_POR_ODONTOLOGO);
			preparedStatement.setInt(1, x);
			
			ResultSet rs = conexion.query();
			
			while(rs.next()) {
				
				int id = rs.getInt("id");
				String fecha = rs.getString("fecha");
				String consulta = rs.getString("consulta");
				Odontologo odontologo = new Odontologo();
				odontologo.setId(x);
				int idpac = rs.getInt("paciente");
				Paciente paciente = new Paciente();
				paciente.setId(idpac);
				String estado = rs.getString("estado");
				String archivo = rs.getString("archivo");
				String firma = rs.getString("firma");
				citas.add(new Cita(id, paciente, odontologo, fecha, consulta, estado, archivo, firma));
			}
			
		} catch (SQLException e) {
			
		}
		
		return citas;
		
	}

}
