package org.scoula;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.scoula.common.JDBCUtil;

public class ConnectionTest {

  @Test
  @DisplayName("jdbc_ex 데이터 베이스에 접속한다.")
  public void testConnection() throws SQLException, ClassNotFoundException {

    // JDBC 드라이버를 메모리에 적재
    Class.forName("com.mysql.cj.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/jdbc_ex";
    String id = "scoula";
    String password = "1234";

    // DriverManager가 메모리에 적재되어 있는 JDBC 드라이버를 가져와서 연결을 한다.
    Connection conn = DriverManager.getConnection(url, id, password);
    System.out.println("DB 연결 성공");

    String query = "select * from users";
    Statement ps = conn.prepareStatement(query);
    ResultSet st = ps.executeQuery(query);
    while (st.next()) {
      System.out.println(st.getString(1) + " " + st.getString(2) + " " + st.getString(3));
    }

    // 연결을 안 끊으면 connection이 끊기지 않아서 메모리의 낭비가 계속 일어난다. -> 성능 저하
    conn.close();
  }

  @Test
  @DisplayName("jdbc_ex에 접솓한다.(자동 닫기)")
  public void testConnection2() throws SQLException, ClassNotFoundException {
    try(Connection connection = JDBCUtil.getConnection()){
      System.out.println("DB 연결 성공");
    }
  }

}
