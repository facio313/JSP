package kr.or.ddit.announcement.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.StringReader;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.tool.xml.XMLWorker;
import com.itextpdf.tool.xml.XMLWorkerFontProvider;
import com.itextpdf.tool.xml.XMLWorkerHelper;
import com.itextpdf.tool.xml.css.CssFile;
import com.itextpdf.tool.xml.css.StyleAttrCSSResolver;
import com.itextpdf.tool.xml.html.CssAppliers;
import com.itextpdf.tool.xml.html.CssAppliersImpl;
import com.itextpdf.tool.xml.html.Tags;
import com.itextpdf.tool.xml.parser.XMLParser;
import com.itextpdf.tool.xml.pipeline.css.CSSResolver;
import com.itextpdf.tool.xml.pipeline.css.CssResolverPipeline;
import com.itextpdf.tool.xml.pipeline.end.PdfWriterPipeline;
import com.itextpdf.tool.xml.pipeline.html.HtmlPipeline;
import com.itextpdf.tool.xml.pipeline.html.HtmlPipelineContext;

import kr.or.ddit.announcement.dao.AnnoDAO;
import kr.or.ddit.announcement.vo.AnnoVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class QSIT implements PdfService {
	private final AnnoDAO dao;

	@Override
	public String createPdf(String annoNo) {
		//이 메서드는 DB에 있는 값을 불러와서 테이블 형식으로 만들어주는 메서드이다.
		
		String result = ""; // 초기값이 null이 들어가면 오류가 발생될수 있기 때문에 공백을 지정
	
		try {
			Document document = new Document(); // pdf문서를 처리하는 객체

			PdfWriter.getInstance(document, new FileOutputStream("d:/sample.pdf"));
			// pdf파일의 저장경로를 d드라이브의 sample.pdf로 한다는 뜻

			document.open(); // 웹페이지에 접근하는 객체를 연다
			
			BaseFont baseFont = BaseFont.createFont("c:/windows/fonts/malgun.ttf", BaseFont.IDENTITY_H,	BaseFont.EMBEDDED);
			// pdf가 기본적으로 한글처리가 안되기 때문에 한글폰트 처리를 따로 해주어야 한다.
			// createFont메소드에 사용할 폰트의 경로 (malgun.ttf)파일의 경로를 지정해준다.
			// 만약에 이 경로에 없을 경우엔 java파일로 만들어서 집어넣어야 한다.

			Font font = new Font(baseFont, 12); // 폰트의 사이즈를 12픽셀로 한다.
			
			PdfPTable table = new PdfPTable(5); // 5개의 셀을 가진 테이블 객체를 생성 (pdf파일에 나타날 테이블)
			Chunk chunk = new Chunk("공고 목록", font); // 타이틀 객체를 생성 (타이틀의 이름을 장바구니로 하고 위에 있는 font를 사용)
			Paragraph ph = new Paragraph(chunk);
			ph.setAlignment(Element.ALIGN_CENTER);
			document.add(ph); // 문단을 만들어서 가운데 정렬 (타이틀의 이름을 가운데 정렬한다는 뜻)
			//Paragraph (단락, 문단, 절)
			document.add(new Paragraph("This is the first Itext example 한글입력도될까요?",font));
			document.add(new Paragraph("공고뽑고싶다",font));
			//Chunk (부분, 규모가 큰)
			document.add(Chunk.NEWLINE);
			document.add(Chunk.NEWLINE); // 줄바꿈 (왜냐하면 타이틀에서 두줄을 내린후에 셀(테이블)이 나오기 때문)

			PdfPCell cell1 = new PdfPCell(new Phrase("공고 번호", font)); // 셀의 이름과 폰트를 지정해서 셀을 생성한다.
			cell1.setHorizontalAlignment(Element.ALIGN_CENTER); // 셀의 정렬방식을 지정한다. (가운데정렬)

			PdfPCell cell2 = new PdfPCell(new Phrase("공고 제목", font));
			cell2.setHorizontalAlignment(Element.ALIGN_CENTER);

			PdfPCell cell3 = new PdfPCell(new Phrase("기업 이름", font));
			cell3.setHorizontalAlignment(Element.ALIGN_CENTER);

			table.addCell(cell1); // 그리고 테이블에 위에서 생성시킨 셀을 넣는다.
			table.addCell(cell2);
			table.addCell(cell3);
			
			log.info("createPdf QSIT -> {}", annoNo);
			// 공고 가져오기
			AnnoVO anno = dao.selectAnno(annoNo);
			log.info("=========annoNo : {}",annoNo);
			log.info("=========anno : {}",anno);
			PdfPCell cellProductName = new PdfPCell(new Phrase("" + anno.getAnnoNo(), font)); 
																								
			PdfPCell cellPrice = new PdfPCell(new Phrase(anno.getAnnoTitle(), font));
			// Phrase타입은 숫자형(int형 같은타입)으로 하면 에러가 발생되기 때문에 dto앞에 공백("")주어서 String타입으로 변경한다.

			PdfPCell cellAmount = new PdfPCell(new Phrase(anno.getCompany().getCmpName(), font));
			// Phrase타입은 숫자형(int형 같은타입)으로 하면 에러가 발생되기 때문에 dto앞에 공백("")주어서 String타입으로 변경한다.

			table.addCell(cellProductName); // 셀의 데이터를 테이블에 저장한다. (장바구니안에 들어있는 갯수만큼 테이블이 만들어진다)
			table.addCell(cellPrice);
			table.addCell(cellAmount);
			
			document.add(table); // 웹접근 객체에 table를 저장한다.
			document.close(); // 저장이 끝났으면 document객체를 닫는다.
			result = "pdf 파일이 생성되었습니다.";

		} catch (Exception e) {
			e.printStackTrace();
			result = "pdf 파일 생성 실패...";
		}
		return result;
	}

	@Override
	public MultipartFile createHtmlPdf(String filename, String htmlStr, HttpServletRequest request) {
		MultipartFile result = null;
		try {
			String storePathString = "d://";// 파일이 저장될 경로이며 따로 설정해주면 된다.

			// 서버 내 파일 주소 : css나 폰트를 가져올때 쓴다.
			String serverPath = request.getSession().getServletContext().getRealPath("/") + "resources/css/";
			//위 serverPath를 출력해보면 아래와 같이 나온다.
			//D:\A_TeachingMaterial\06_spring\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\springProj\resources/css/
			
			// 파일 저장할 주소이며 위에서 선언한 storePathString = "d://" 이다.
			File saveFolder = new File(storePathString);

			// 파일 저장 경로가 있는지 확인하고 없으면 생성하는 if문
			if (!saveFolder.exists() || saveFolder.isFile()) {
				saveFolder.mkdirs();
			}

			// 용지 설정이 가능하다.
			Document document = new Document();//new Document(PageSize.A4.rotate())는 용기를 가로로 눕힌 모양이다. 인터넷 용지 설정방법 참고

			// 보내준 파일 이름에 파일 확장자를 더한다.
			filename += ".pdf";
			
			//~경로에 파일이름을 결합하기 위한 용도
			// "d://'보내준 파일이름'.pdf"
			String realName = storePathString;
			realName += filename;
			
			File pdfFile = new File(realName);
			//파일이 있으면 삭제(같은 이름으로 만들 때마다 새로 쓰기 위해서)
			if (pdfFile.isFile()) {
				pdfFile.delete();
			}

			//pdf를 만들기 시작한다.
//			PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(realName));
			PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(pdfFile));

			document.open();
			
//			htmlStr = htmlStr.replaceAll("src=\"/", "src=\"http://127.0.0.1:8080/");
			htmlStr = "<html><body style='font-family: MalgunGothic;'>" + htmlStr + "</body></html>";

			//document open의 한 종류인듯
//			XMLWorkerHelper helper = XMLWorkerHelper.getInstance();

			// css파일 설정
			CSSResolver cssResolver = new StyleAttrCSSResolver();
			//css파일은 서버파일 경로 + css이름
			CssFile cssFile = XMLWorkerHelper.getCSS(new FileInputStream(serverPath + "bootstrap.min.css"));
			cssResolver.addCss(cssFile);

			XMLWorkerFontProvider fontProvider = new XMLWorkerFontProvider(XMLWorkerFontProvider.DONTLOOKFORFONTS);

			// 폰트를 설정한다. 폰트 설정 누락시 한글이 안보이는 경우 발생
			fontProvider.register(serverPath + "MALGUN.TTF", "MalgunGothic"); // MalgunGothic은 font-family용 alias
			CssAppliers cssAppliers = new CssAppliersImpl(fontProvider);

			HtmlPipelineContext htmlContext = new HtmlPipelineContext(cssAppliers);
			htmlContext.setTagFactory(Tags.getHtmlTagProcessorFactory());

			// html을 pdf로 변환시작
			PdfWriterPipeline pdf = new PdfWriterPipeline(document, writer);
			HtmlPipeline html = new HtmlPipeline(htmlContext, pdf);
			CssResolverPipeline css = new CssResolverPipeline(cssResolver, html);

			XMLWorker worker = new XMLWorker(css, true);
			// 캐릭터 셋 설정
			XMLParser xmlParser = new XMLParser(worker, Charset.forName("UTF-8"));

			StringReader strReader = new StringReader(htmlStr);
			xmlParser.parse(strReader);

			document.close();
			writer.close();

			
			// egov의 첨부파일 형태로 추가하기 위해서 MultipartFile을 만들어 준다.
			Path path = Paths.get(realName);
			String contentType = "application/pdf";
			byte[] content = null;
			content = Files.readAllBytes(path);
//			result = new MockMultipartFile(filename, filename, contentType, content);
			
		
		 
		} catch (DocumentException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}



}