




package dao;

public class PacienteDaoFactory {

	public static PacienteDao getPacienteDao(String type) {
		switch(type) {
		case "mysql":
			return new PacienteDaoPostgreSQL();
		case "postgresql":
			return new PacienteDaoPostgreSQL();
		default:
			return new PacienteDaoPostgreSQL();
		}
	}
	
}
