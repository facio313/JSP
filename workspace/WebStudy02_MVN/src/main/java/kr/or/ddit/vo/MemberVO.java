package kr.or.ddit.vo;

import java.io.Serializable;
import java.util.List;

import javax.validation.constraints.Email;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import javax.validation.groups.Default;

import com.fasterxml.jackson.annotation.JsonIgnore;

import kr.or.ddit.validate.DeleteGroup;
import kr.or.ddit.validate.InsertGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * VO(Value Object), DTO(Data Transfer Object), Java Bean, Model
 *
 * JavaBean 규약 
 * 1. 값을 담을 수 있는 property 정의 
 * 2. property 캡슐화 
 * 3. 캡슐화된 property에 접근할 수 있는 interface 제공 getter/setter get[set] + property 첫 문자를 대문자로 변경 -> camel case
 * 4. 객체의 상태 비교 방법 제공 : equals ==(기본형은 값 비교, 한 쪽이라도 객체면 참조 주소 비교), equals(값, 주소 뭘 비교할지 모름) 
 * 5. 객체의 상태 확인 방법 제공 : toString 
 * 6. 객체 직렬화 가능
 * 
 *
 * 변수, 속성, 메서드 이름 지을 때 쉽게 생각하면 안 되고 정해진 규칙에 맞게 해야 함 필드 : 첫 소문자, camel case, _XXX
 * 메서드 : 첫 소문자, camel case 클래스 : 첫 대문자, camel case
 * 
 * 회원관리를 위한 Domain Layer
 *  : 한사람의 회원 정보(구매기록 포함)를 담기 위한 객체.
 *    MEMBER(1) : PROD(N) -> HAS MANY
 *    1 : 1 -> HAS A
 *    
 *  ** 데이터매퍼나 ORM 을 이용한 테이블 조인 방법
 *    ex) 회원 정보 상세 조회시 구매 상품 기록을 함께 조회함.
 *  1. 대상 테이블 선택
 *     MEMBER, CART(CART_MEMBER, CART_PROD), PROD   
 *  2. 각테이블로부터 데이터를 바인딩할 vo 설계
 *     MemberVO, ProdVO
 *  3. 각테이블의 relation 을 VO 사이에 has 관계로 반영
 *  	1(main):N -> has many , MemberVO has many ProdVO(collection)
 *  	1(main):1 -> has a    , ProdVO has a BuyerVO
 *  4. resultType 대신 resultMap 으로 바인딩 설정.
 *     has many : collection
 *     has a    : association
 */
//@Getter
//@Setter
@ToString(exclude= {"memPass", "memRegno1", "memRegno2"})
@EqualsAndHashCode(of="memId")
@Data
@NoArgsConstructor
public class MemberVO implements Serializable{
	
	public MemberVO(@NotBlank(groups = { Default.class, DeleteGroup.class }) String memId,
			@NotBlank(groups = { Default.class, DeleteGroup.class }) @Size(min = 4, max = 8, groups = { Default.class,
					DeleteGroup.class }) String memPass) {
		super();
		this.memId = memId;
		this.memPass = memPass;
	}
	
	private int rnum;
	
	@NotBlank(groups= {Default.class, DeleteGroup.class})
	private String memId;
	@NotBlank(groups= {Default.class, DeleteGroup.class})
	@Size(min=4, max=8, groups= {Default.class, DeleteGroup.class})
	@JsonIgnore
	private transient String memPass;
	@NotBlank
	private String memName;
	@JsonIgnore
	private transient String memRegno1;
	@JsonIgnore
	private transient String memRegno2;
	@Pattern(regexp="\\d{4}-\\d{2}-\\d{2}", groups=InsertGroup.class)
	@NotBlank(groups=InsertGroup.class)
	private String memBir;
	@NotBlank
	private String memZip;
	@NotBlank
	private String memAdd1;
	@NotBlank
	private String memAdd2;
	private String memHometel;
	private String memComtel;
	private String memHp;
	@Email
	private String memMail;
	private String memJob;
	private String memLike;
	private String memMemorial;
	@Pattern(regexp="\\d{4}-\\d{2}-\\d{2}")
	private String memMemorialday;
	@Min(0)
	private Integer memMileage;
	private boolean memDelete;
	
	private int cartCount;

	private List<ProdVO> prodList; // has many 관계 (1:N)
}
