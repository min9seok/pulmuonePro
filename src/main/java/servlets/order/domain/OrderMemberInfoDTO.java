package servlets.order.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class OrderMemberInfoDTO {
	
	private int memberNo;
	private String name;
	private String tel;
	private String email;
	
}
