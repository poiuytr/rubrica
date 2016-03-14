/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.rubrica;

import com.mysql.jdbc.Connection;
import java.io.IOException;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author mattia
 */
public class DbConnection {

    Connection conn;

    public DbConnection() {
    }

    public Connection DbConnection() throws SQLException {
//        String host = "localhost";
//        String porta = "3306";
//        String username = "root";
//        String nomedb = "rubrica";
//        String password = "root";
        String host = "mysql://$OPENSHIFT_MYSQL_DB_HOST:$OPENSHIFT_MYSQL_DB_PORT/";
        String porta = "3306";
        String username = "adminMD6Hx2g";
        String nomedb = "mripanucci";
        String password = "K8gi5tprVCDI";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            return (Connection) DriverManager.getConnection("jdbc:" + host  + nomedb, username, password);
        } catch (ClassNotFoundException e) {
            return null;
        }
    }

    public ResultSet readDb() throws SQLException, IOException {
        conn = DbConnection();
        Statement pre = conn.createStatement();
        ResultSet rs = pre.executeQuery("select * from anagrafica order by nome asc;");
        return rs;
    }

    public boolean nuovoContatto(Persona p, String telefono) throws SQLException {
        conn = DbConnection();
        Statement pre = conn.createStatement();
        ResultSet rs = pre.executeQuery("SELECT * FROM anagrafica where telefono=" + telefono + ";");
        if (rs.next()) {
            if (conn != null) {
                conn.close();
                return false;
            }
        } else {
            String query = "INSERT INTO anagrafica (nome,cognome,indirizzo,telefono,eta) "
                    + "VALUES ('" + p.nome + "','" + p.cognome + "','" + p.indirizzo + "','" + p.telefono + "','" + p.eta + "');";
            Statement sta = conn.createStatement();
            sta.executeUpdate(query);
            if (conn != null) {
                conn.close();
                return true;
            }
        }
        return false;
    }

    public ResultSet modificaContatto(String tel) throws SQLException, IOException {
        conn = DbConnection();
        Statement pre = conn.createStatement();
        ResultSet rs = pre.executeQuery("SELECT * FROM anagrafica where telefono=" + tel + ";");
        return rs;
    }

    public void updateContatto(Persona p, String tel) throws SQLException, IOException {
        conn = DbConnection();
        String query = "UPDATE anagrafica SET nome='" + p.nome + "', cognome='" + p.cognome + "', "
                + "indirizzo='" + p.indirizzo + "', telefono='" + p.telefono + "', eta=" + p.eta + " where telefono='" + tel + "';";
        Statement sta = conn.createStatement();
        sta.executeUpdate(query);
        if (conn != null) {
            conn.close();
        }
    }

    public void elimina(String tel) throws SQLException {
        conn = DbConnection();
        String query = "DELETE FROM anagrafica where telefono=" + tel + ";";
        Statement sta = conn.createStatement();
        sta.executeUpdate(query);
        if (conn != null) {
            conn.close();
        }
    }
}
