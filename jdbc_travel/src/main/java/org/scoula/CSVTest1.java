package org.scoula;

import com.opencsv.CSVReader;
import com.opencsv.exceptions.CsvValidationException;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class CSVTest1 {

  public static void main(String[] args) throws IOException, CsvValidationException {
    CSVReader csvReader = new CSVReader(new FileReader("travel.csv"));
    String[] nextLine;
    while((nextLine = csvReader.readNext()) != null){
      System.out.println(String.join(",", nextLine));
    }
  }

}
