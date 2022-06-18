package modelo;

import java.io.Serializable;

import javax.websocket.Decoder.BinaryStream;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;



@Data
@NoArgsConstructor
@AllArgsConstructor

public class Cita implements Serializable {
	
	
	private Integer id;
	
	private Paciente paciente;
	
	private Odontologo odontologo;
	
	private String fecha;
	
	private String consulta;
	
	private String estado;
	
	private String archivo;

	

	public Cita(Paciente paciente, Odontologo odontologo, String fecha, String consulta, String estado) {
		super();
		this.paciente = paciente;
		this.odontologo = odontologo;
		this.fecha = fecha;
		this.consulta = consulta;
		this.estado = estado;
	}
	
	

	public Cita(Paciente paciente, Odontologo odontologo, String fecha, String estado) {
		super();
		this.paciente = paciente;
		this.odontologo = odontologo;
		this.fecha = fecha;
		this.estado = estado;
	}

	public Cita(Integer id, Paciente paciente, Odontologo odontologo, String fecha) {
		super();
		this.id = id;
		this.paciente = paciente;
		this.odontologo = odontologo;
		this.fecha = fecha;
	}



	public Cita(Integer id, String consulta, String estado, String archivo) {
		super();
		this.id = id;
		this.consulta = consulta;
		this.estado = estado;
		this.archivo = archivo;
	}
	
	
	
	
	

	
	
	
	
	
	
	
	
}
