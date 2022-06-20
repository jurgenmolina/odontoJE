package modelo;

import java.io.Serializable;

import javax.websocket.Decoder.BinaryStream;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;



@Data
@NoArgsConstructor
@AllArgsConstructor

public class Paciente implements Serializable {
	
	
	private Integer id;
	
	private String tipodocumento;
	
	private String documento;
	
	private String nombre;
	
	private String apellido;
	
	private String email;
	
	private String telefono;
	
	private String foto;
	
	private Odontologo odontologo;
	
	private String fechanacimiento;
	
	private String genero;
	
	
	

	public Paciente(String tipodocumento, String documento, String nombre, String apellido, String email,
			String telefono, String foto, Odontologo odontologo, String fechanacimiento, String genero) {
		super();
		this.tipodocumento = tipodocumento;
		this.documento = documento;
		this.nombre = nombre;
		this.apellido = apellido;
		this.email = email;
		this.telefono = telefono;
		this.foto = foto;
		this.odontologo = odontologo;
		this.fechanacimiento = fechanacimiento;
		this.genero = genero;
	}
	
	
	
	

	public Paciente(String tipodocumento, String documento, String nombre, String apellido, String email,
			String telefono, Odontologo odontologo, String fechanacimiento, String genero) {
		super();
		this.tipodocumento = tipodocumento;
		this.documento = documento;
		this.nombre = nombre;
		this.apellido = apellido;
		this.email = email;
		this.telefono = telefono;
		this.odontologo = odontologo;
		this.fechanacimiento = fechanacimiento;
		this.genero = genero;
	}

	



	public Paciente(Integer id, String tipodocumento, String documento, String nombre, String apellido, String email,
			String telefono, Odontologo odontologo, String fechanacimiento, String genero) {
		super();
		this.id = id;
		this.tipodocumento = tipodocumento;
		this.documento = documento;
		this.nombre = nombre;
		this.apellido = apellido;
		this.email = email;
		this.telefono = telefono;
		this.odontologo = odontologo;
		this.fechanacimiento = fechanacimiento;
		this.genero = genero;
	}





	public Paciente(Integer id, String foto) {
		super();
		this.id = id;
		this.foto = foto;
	}
	
	

	
	
	
	
	
	
}
