package org.scoula.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

// Lombok 어노테이션 사용
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UserVO {

  private String id;
  private String password;
  private String name;
  private String role;
}