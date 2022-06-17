package dao;

import java.sql.SQLException;
import java.util.List;

import modelo.Cita;


public interface CitaDao {

	public void insert(Cita cita) throws SQLException;
	public Cita selectPaciente(int id_paciente);
	public Cita selectOdontologo(int id_odontologo);
	public void delete(int id) throws SQLException;
	public List < Cita > selectAll();
	public List < Cita > selectAllOdontologo(int x);
	
}
