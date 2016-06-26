
package negocio;

import accesodato.Conex;


public class Tarea1 {
    private int tarea_id;
    private String nombre;
    private String fecha;
 Conex con;
 
 
 public Tarea1(){
 
 con=new Conex();
 
 }
    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }
    private int responsable_id;
    private String estado;

    public int getTarea_id() {
        return tarea_id;
    }

    public void setTarea_id(int tarea_id) {
        this.tarea_id = tarea_id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getResponsable_id() {
        return responsable_id;
    }

    public void setResponsable_id(int responsable_id) {
        this.responsable_id = responsable_id;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
    
    public void save(){
    
    con.setInsertar("insert into Tarea (nombre,fecha,responsable_id,estado)values('"+this.getNombre()+"','"+this.getFecha()+"','"+this.getResponsable_id()+"','ACTIVO')");
    
    }
    
    
    public void delete() {

        con.setInsertar("update tarea set estado='PASIVO' where tarea_id='" + this.getTarea_id() + "'");

    }

    public void update() {

        con.setInsertar("update tarea set nombre='" + this.getNombre()+ "' ,fecha='"+this.getFecha()+"',responsable_id='"+this.getResponsable_id()+"' where tarea_id='" + this.getTarea_id() + "'");

}
    
}
