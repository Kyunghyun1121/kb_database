package org.scoula.travel.domain;

import java.util.List;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class TravelVO {// 1 : N 관계를 나타내는 객체 모델
  private Long no;
  private String district;
  private String title;
  private String description;
  private String address;
  private String phone;

  private List<TravelImageVO> images;
}
