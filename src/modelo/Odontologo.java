package modelo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;



@Data
@NoArgsConstructor
@AllArgsConstructor

public class Odontologo implements Serializable {
	
	
	private Integer id;
	
	private String documento;
	
	private String nombre;
	
	private String email;
	
	private String telefono;
	
	private String usuario;
	
	private String password;
	
	private String foto;

	public Odontologo(String documento, String nombre, String email, String telefono, String usuario, String password,
			String foto) {
		super();
		this.documento = documento;
		this.nombre = nombre;
		this.email = email;
		this.telefono = telefono;
		this.usuario = usuario;
		this.password = password;
		this.foto = foto;
	}

	
	
	
	
	
}
