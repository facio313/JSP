package kr.or.ddit.crypto;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.util.Base64;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.KeyGenerator;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.spec.IvParameterSpec;

/**
 * encode/decode(복호화)
 * 	encoding(부호화) : 전송이나 저장을 위해 매체(media)가 이해할 수 있는 방식으로 데이터의 표현 방식을 바꾸는 작업 / 누군가가 이해할 수 있도록 하는 게 핵심
 * 					ex) Base64(2진 데이터 -> 문자열), URLEncoding(percent encoding)
 * encrypt/decrypt
 * 	encrypting(암호화) : 권한(key) 없는 사용자가 snipping하거나 spooping하는 걸 막기 위해 데이터 표현을 바꾸는 작업 / 아무도 알 수 없게 하겠다는 것이 핵심
 * 1) 단방향 암호화(hash 함수) : 암호화된 이후 평문 복원이 불가능한 방식(비밀번호 암호화에 활용) -> 아무리 DB에서 select를 날려도 모름,,, 그래서 차라리 바꾸라!
 * 							: 다양한 길이의 입력 데이터에 의해 만들어지는 결과 데이터의 길이가 동일한 경우(해시 결과의 충돌이 일어날 수 있음 - 중복 => 최대한 이 길이를 늘리는 것이 해결책 중 하나,,암만 그래도 언젠간 충돌일어날 수도? 그래서 비밀번호 길이가 제한..)
 * 		ex) SHA-512(64개의 바이트), 비밀번호!!
 * 		암호화된 것이 다시 복호화될 수 없으니 암호화된 것을 다시 암호화해서 비교해야 함
 * 2) 양방향 암호화 : 암호문에서 원래 평문으로 복호화가 가능한 방식
 * 		- 대칭키 방식 : 하나의 비밀키로 암호화와 복호화에 모두 사용(암호에 키도 포함시켜야 함 => 키 분배의 문제점...어떻게 키를 안전하게 보낼 것인가?) => ebook에서 많이 사용됨(ebook reader안에 내가 볼 수 있는 키가 포함되어 있어야 암호화된 걸 볼 수 있음)
 * 			ex) AES(128, 256 - 키의 길이), 일반 jdk에서는 256을 쓸 수 없음
 * 		- 비대칭키 방식 : 공개키와 개인키, 한 쌍의 키로 암호화와 복호화에 다른 키를 사용하는 방식 => https에서 사용되는 핵심! => 전자서명(키 분배 해결 후 느림..)
 * 			ex) RSA(2048)
 *
 * 암호화의 기본 데이터는 바이트!!!
 */
public class EncryptionDesc {
	public static void main(String[] args) throws Exception {
		String plain = "java";
//		encryptAESTest(plain);
		
		KeyPairGenerator pairGen = KeyPairGenerator.getInstance("RSA");
		pairGen.initialize(2048);
		KeyPair keyPair = pairGen.generateKeyPair();
		PrivateKey privateKey = keyPair.getPrivate(); // 키의 소유자인 본인만 갖는 것
		PublicKey publicKey = keyPair.getPublic(); // 사용자들한테 풀어버리는 공개 키
		
		Cipher cipher = Cipher.getInstance("RSA");
		cipher.init(Cipher.ENCRYPT_MODE, privateKey); // 전자서명, 나 본인이 맞다!!
		
		byte[] input = plain.getBytes();
		byte[] encrypted = cipher.doFinal(input);
		String encoded = Base64.getEncoder().encodeToString(encrypted);
		
		System.out.println(encoded);
		
		byte[] decoded = Base64.getDecoder().decode(encoded); // encrypted와 같음
		
		cipher.init(Cipher.DECRYPT_MODE, publicKey);
		byte[] decrypted = cipher.doFinal(decoded); // input과 같음
		System.out.println(new String(decrypted));
		
	}
	
	private static void encryptAESTest(String plain) throws Exception {
		String ivValueText = "초기화 벡터";
		
		// 꼭 이렇게 안 해도 되고 secureAPI를 사용해도 되는데 해쉬를 연습하기 위해..
		MessageDigest md = MessageDigest.getInstance("MD5"); // 얘가 128비트짜리 해시함수임
		byte[] iv = md.digest(ivValueText.getBytes()); // 128비트, 16바이트짜리
		IvParameterSpec ivSpec = new IvParameterSpec(iv);
		
		// Cipher을 암호화할 때 사용할 건지 복호화할 때 사용할 건지?!
		Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
		KeyGenerator keyGen = KeyGenerator.getInstance("AES");
		keyGen.init(256); // 128 -> 256 하려면
		SecretKey key = keyGen.generateKey();
		cipher.init(Cipher.ENCRYPT_MODE, key, ivSpec);
		
		byte[] input = plain.getBytes();
		byte[] encrypted = cipher.doFinal(input); // 암호화
		String encoded = Base64.getEncoder().encodeToString(encrypted); // 부호화
		
		System.out.println(encoded);
		
		byte[] decoded = Base64.getDecoder().decode(encoded); // encrypted와 같음
		
		cipher.init(Cipher.DECRYPT_MODE, key, ivSpec); // 대칭키 방식에서는 암호화, 복호화의 키가 같다
		byte[] decrypted = cipher.doFinal(decoded); // input과 같음
		System.out.println(new String(decrypted));
	}
	
	private static String encryptSha512(String plain) {
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-512");
			byte[] input = plain.getBytes();
			byte[] encrypted = md.digest(input);
//			System.out.println(encrypted.length);
			// 데이터베이스 저장을 위해 데이터베이스가 이해할 수 있는 방식으로 데이터를 바꿔야 함
			String encoded = Base64.getEncoder().encodeToString(encrypted);
//			System.out.println(encoded);
			return encoded;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	public static void encodeTest() throws UnsupportedEncodingException {
		String plain = "원문데이터";
		String base64Encoded = Base64.getEncoder().encodeToString(plain.getBytes());
		System.out.println(base64Encoded);
		System.out.println(new String(Base64.getDecoder().decode(base64Encoded)));
		String urlEncoded = URLEncoder.encode(plain, "UTF-8");
		System.out.println(urlEncoded);
		System.out.println(URLDecoder.decode(urlEncoded, "UTF-8"));
	}
}
