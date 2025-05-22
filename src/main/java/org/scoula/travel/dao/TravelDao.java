package org.scoula.travel.dao;

import java.util.List;
import java.util.Optional;
import org.scoula.travel.domain.TravelImageVO;
import org.scoula.travel.domain.TravelVO;

public interface TravelDao {
  void insert(TravelVO travel);
  void inserImage(TravelImageVO travelImage);
  int getTotalCount();
  List<String> getDistricts();
  List<TravelVO> getTravels();
  List<TravelVO> getTravels(int page);
  List<TravelVO> getTravels(String district);
  Optional<TravelVO> getTravel(Long no);
}
