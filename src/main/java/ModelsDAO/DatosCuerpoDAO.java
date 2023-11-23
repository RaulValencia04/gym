package ModelsDAO;

import Conexion.Conexion;
import Models.DatosCuerpo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DatosCuerpoDAO {
   
    // Método para insertar un nuevo registro
    public boolean insertarDatosCuerpo(DatosCuerpo datosCuerpo) {
        try {
            Conexion conexion = new Conexion();
            Connection con = conexion.obtenerConexion();
            String query = "INSERT INTO DatosCuerpo (sexo, edad, peso, altura, fecha, imc, id_usuario) VALUES (?, ?, ?, ?, ?, ?, ?)";
            try (PreparedStatement preparedStatement = con.prepareStatement(query)) {
                preparedStatement.setString(1, datosCuerpo.getSexo());
                preparedStatement.setInt(2, datosCuerpo.getEdad());
                preparedStatement.setDouble(3, datosCuerpo.getPeso());
                preparedStatement.setDouble(4, datosCuerpo.getAltura());
                preparedStatement.setDate(5, datosCuerpo.getFecha());
                preparedStatement.setDouble(6, datosCuerpo.getImc());
                preparedStatement.setInt(7, datosCuerpo.getIdUsuario());

                int filasAfectadas = preparedStatement.executeUpdate();
                return filasAfectadas > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Método para obtener datos por usuario
    public List<DatosCuerpo> obtenerDatosPorUsuario(int idUsuario) {
        List<DatosCuerpo> datosCuerpoList = new ArrayList<>();

        try {
            Conexion conexion = new Conexion();
            Connection con = conexion.obtenerConexion();
            String query = "SELECT id_datos, sexo, edad, peso, altura, fecha, imc,id_usuario FROM DatosCuerpo WHERE id_usuario = ? ";
            try (PreparedStatement preparedStatement = con.prepareStatement(query)) {
                preparedStatement.setInt(1, idUsuario);
                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    while (resultSet.next()) {
                        DatosCuerpo datosCuerpo = new DatosCuerpo();
                        datosCuerpo.setIdDatos(resultSet.getInt("id_datos"));
                        datosCuerpo.setSexo(resultSet.getString("sexo"));
                        datosCuerpo.setEdad(resultSet.getInt("edad"));
                        datosCuerpo.setPeso(resultSet.getDouble("peso"));
                        datosCuerpo.setAltura(resultSet.getDouble("altura"));
                        datosCuerpo.setFecha(resultSet.getDate("fecha"));
                        datosCuerpo.setImc(resultSet.getDouble("imc"));
                        datosCuerpo.setIdUsuario(resultSet.getInt("id_usuario"));
                        datosCuerpoList.add(datosCuerpo);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return datosCuerpoList;
    }
    
    
     //id_datos, sexo, edad, peso, altura, fecha, fecha, imc
}
