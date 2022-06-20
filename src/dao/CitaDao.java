package dao;

import java.sql.SQLException;
import java.util.List;

import modelo.Cita;
import modelo.Paciente;


public interface CitaDao {

	public void insert(Cita cita) throws SQLException;
	public Cita select(int id);
	public void delete(int id) throws SQLException;
	public List < Cita > selectAllOdontologo(int x);
	public void updateCita(Cita cita) throws SQLException;
	
}
