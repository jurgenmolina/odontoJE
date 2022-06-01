package dao;

import java.sql.SQLException;
import java.util.List;

import modelo.Odontologo;

public interface OdontologoDao {
	public void insert(Odontologo user) throws SQLException;
	public Odontologo select(int id);
	public Odontologo selectUsuario(String usuario);
	public List < Odontologo > selectAll();
	public void delete(int id) throws SQLException;
	public void update(Odontologo user) throws SQLException;
}
