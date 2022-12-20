package kr.or.ddit.enumpkg;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;

public enum Command {
	COPY("copy"),
	MOVE("move");
	
	private String name;

	private Command(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public Path copyOrMove(File sourceFile, Path destFilePath, String command) throws IOException {
		return Files.copy(sourceFile.toPath(), destFilePath, StandardCopyOption.REPLACE_EXISTING);
	}
	
}
