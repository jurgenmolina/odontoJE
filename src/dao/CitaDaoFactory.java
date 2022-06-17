package dao;

public class CitaDaoFactory {
	public static CitaDao getCitaDao(String type) {
		switch(type) {
		case "mysql":
			return new CitaDaoPostgreSQL();
		case "postgresql":
			return new CitaDaoPostgreSQL();
		default:
			return new CitaDaoPostgreSQL();
		}
	}
}
