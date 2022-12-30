package kr.or.ddit.servlet07;

import java.nio.file.Path;

@FunctionalInterface
public interface RealOperator {
	public void operate(Path sourceFiletoPath, Path destFilePath);
}
