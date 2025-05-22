package org.scoula.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class JDBCUtil {

  private static Connection conn = null;
  // 프로그램 실행 시 자동으로 실행되는 정적 초기화 블록
  static {
    try {

      Properties properties = new Properties();
      properties.load(JDBCUtil.class.getResourceAsStream("/application.properties"));
      String driver = properties.getProperty("driver");
      String url = properties.getProperty("url");
      String id = properties.getProperty("id");
      String password = properties.getProperty("password");

      Class.forName(driver);
      conn = DriverManager.getConnection(url, id, password);

    } catch (Exception e) {
      e.printStackTrace();
    }
  }

  public static Connection getConnection() {
    return conn;
  }

  public static void close() {
    try {
      if (conn != null) {
        conn.close();
        conn = null;
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }
}
