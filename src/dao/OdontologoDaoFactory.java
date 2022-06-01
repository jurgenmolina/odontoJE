




package dao;

public class OdontologoDaoFactory {

	public static OdontologoDao getOdontologoDao(String type) {
		switch(type) {
		case "mysql":
			return new OdontologoDaoPostgreSQL();
		case "postgresql":
			return new OdontologoDaoPostgreSQL();
		default:
			return new OdontologoDaoPostgreSQL();
		}
	}
	
}
