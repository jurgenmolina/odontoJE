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
	
	private static final String INSERT_CITA_SQL = "INSERT INTO cita (paciente, odontologo, fecha, consulta) VALUES (?, ?, ?, ?);";
	private static final String DELETE_CITA_SQL = "DELETE FROM cita WHERE id = ?;";
	private static final String SELECT_CITA_BY_ODONTOLOGO = "SELECT * FROM Cita WHERE odntologo = ?;";
	private static final String SELECT_CITA_BY_PACIENTE = "SELECT * FROM Cita WHERE paciente = ?;";
	private static final String SELECT_ALL_CITAS = "SELECT * FROM Cita;";
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
			preparedStatement.setString(4, cita.getConsulta());
			conexion.execute();
		} catch (SQLException e) {
			System.out.println("error");
		}
		
	}

	@Override
	public Cita selectPaciente(int id_paciente) {
		Cita cita = null;
		
		try {
			PreparedStatement preparedStatement = (PreparedStatement) conexion.setPreparedStatement(SELECT_CITA_BY_PACIENTE);
			preparedStatement.setInt(1, id_paciente);
			
			ResultSet rs = conexion.query();
			
			while(rs.next()) {
				
				int id = rs.getInt("id");
				Paciente paciente = new Paciente();
				paciente.setId(id_paciente);
				String fecha = rs.getString("fecha");
				String consulta = rs.getString("consulta");
				int id_Odontologo = rs.getInt("odntologo");
				Odontologo odontologo = new Odontologo();
				odontologo.setId(id_Odontologo);				
				cita = new Cita(id, paciente, odontologo, fecha, consulta);
			}
			
		} catch (SQLException e) {
			
		}
		
		return cita;
	}

	@Override
	public Cita selectOdontologo(int id_odontologo) {
		Cita cita = null;
		
		try {
			PreparedStatement preparedStatement = (PreparedStatement) conexion.setPreparedStatement(SELECT_CITA_BY_ODONTOLOGO);
			preparedStatement.setInt(1, id_odontologo);
			
			ResultSet rs = conexion.query();
			
			while(rs.next()) {
				
				int id = rs.getInt("id");
				int id_Paciente = rs.getInt("paciente");
				Paciente paciente = new Paciente();
				paciente.setId(id_Paciente);
				String fecha = rs.getString("fecha");
				String consulta = rs.getString("consulta");
				Odontologo odontologo = new Odontologo();
				odontologo.setId(id_odontologo);				
				cita = new Cita(id, paciente, odontologo, fecha, consulta);
			}
			
		} catch (SQLException e) {
			
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

	@Override
	public List<Cita> selectAll() {
		List <Cita> citas = new ArrayList<>();
		
		try {
			PreparedStatement preparedStatement = (PreparedStatement) conexion.setPreparedStatement(SELECT_ALL_CITAS);
			
			ResultSet rs = conexion.query();
			
			while(rs.next()) {
				int id = rs.getInt("id");
				int id_Paciente = rs.getInt("paciente");
				Paciente paciente = new Paciente();
				paciente.setId(id_Paciente);
				int id_Odontologo = rs.getInt("odntologo");
				Odontologo odontologo = new Odontologo();
				odontologo.setId(id_Odontologo);
				String fecha = rs.getString("fecha");
				String consulta = rs.getString("consulta");
				
				
				
				citas.add(new Cita(id, paciente, odontologo, fecha, consulta));
			}
			
		} catch (SQLException e) {
			
		}
		
		return citas;
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
				citas.add(new Cita(id, paciente, odontologo, fecha, consulta));
			}
			
		} catch (SQLException e) {
			
		}
		
		return citas;
		
	}

}
