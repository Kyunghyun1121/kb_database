package org.scoula.travel.dataimport;

import java.io.File;
import org.scoula.database.JDBCUtil;
import org.scoula.travel.dao.TravelDao;
import org.scoula.travel.dao.TravelDaoImpl;
import org.scoula.travel.domain.TravelImageVO;

public class ImportImageData {

  public static void main(String[] args) {
    TravelDao dao = new TravelDaoImpl();

    File dir = new File("travel-image");
    File[] files = dir.listFiles();
    for (File file : files) {
      String fileName = file.getName();
      long travelNo = Long.parseLong(fileName.split("-")[0]);

      TravelImageVO image = new TravelImageVO().builder()
          .filename(fileName)
          .travelNo(travelNo)
          .build();

      System.out.println(image);
      dao.inserImage(image);
    }

    JDBCUtil.close();
  }

}
