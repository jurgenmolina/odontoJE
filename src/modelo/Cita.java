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

	public Cita(Paciente paciente, Odontologo odontologo, String fecha, String consulta) {
		super();
		this.paciente = paciente;
		this.odontologo = odontologo;
		this.fecha = fecha;
		this.consulta = consulta;
	}
	
	
	

	
	
	
	
	
	
	
	
}
