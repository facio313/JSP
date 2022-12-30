package kr.or.ddit.enumpkg;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;

import kr.or.ddit.servlet07.RealOperator;

public enum Command{
	COPY((sfp, dfp) -> {try {
		Files.copy(sfp, dfp, StandardCopyOption.REPLACE_EXISTING);
	} catch (IOException e) {
		e.printStackTrace();
	}}),
	MOVE((sfp, dfp) -> {try {
		Files.move(sfp, dfp, StandardCopyOption.REPLACE_EXISTING);
	} catch (IOException e) {
		e.printStackTrace();
	}});
	
	private RealOperator ro;

	private Command(RealOperator ro) {
		this.ro = ro;
	}
	
	public void operate(Path sfp, Path dfp) {
		ro.operate(sfp, dfp);
	}
}
