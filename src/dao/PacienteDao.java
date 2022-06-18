package dao;

import java.sql.SQLException;
import java.util.List;

import modelo.Odontologo;
import modelo.Paciente;

public interface PacienteDao {
	public void insert(Paciente user) throws SQLException;
	public Paciente select(int id);
	public Paciente selectOdontologo(int id_odontologo);
	public List < Paciente > selectAllOdontologo(int id);
	public List < Paciente > selectAll();
	public void delete(int id) throws SQLException;
	public void update(Paciente user) throws SQLException;
	public void updateFoto(Paciente user) throws SQLException;
}
