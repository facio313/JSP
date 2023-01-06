package kr.or.ddit.security;

import org.junit.Test;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class PasswordEncodertest {
	
	PasswordEncoder encoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
	
	String password = "java-"; // 클라이언트가 입력한 평문
	String mem_pass = "{bcrypt}$2a$10$wUE7xI1F6nTfaYO3qgy2dOkVNklxFN94ecl5KqBbcciGNvrQUoram"; // DB에 저장된 암호문
	
	@Test
	public void encodetest() {
		String encoded = encoder.encode(password); // ecrypt와 encode 둘 다 된 것...이것만 db에 넣으면 됨
		log.info("mem_pass : {}", encoded);
	}
	
	@Test
	public void matchTest() {
//		String encoded = encoder.encode(password); // 한 번 더 암호화. 다른 암호문이 만들어짐
//		log.info("new encoded : {}", encoded);
//		log.info("match result : {}", encoded.equals(mem_pass));
		log.info("match result : {}", encoder.matches(password, mem_pass));
	}
}
