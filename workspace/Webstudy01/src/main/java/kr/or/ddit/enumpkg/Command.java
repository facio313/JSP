package kr.or.ddit.enumpkg;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;

public enum Command {
	COPY((sourceFiletoPath, destFilePath) -> Files.copy(sourceFiletoPath, destFilePath, StandardCopyOption.REPLACE_EXISTING)),
	MOVE((sourceFiletoPath, destFilePath) -> Files.move(sourceFiletoPath, destFilePath, StandardCopyOption.REPLACE_EXISTING));
	
	private Command command;

	private Command(Command command) {
		this.command = command;
	}
	
}
