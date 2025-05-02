package java_files;

import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;


@WebServlet("/pdf")
public class PDFGeneration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public PDFGeneration() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("fullname");
		String address = request.getParameter("add");
		
		response.setContentType("application/pdf");
		 response.setHeader("Content-Disposition", "attachment; filename=\"bill.pdf\"");
		 try (OutputStream out = response.getOutputStream()) {
	            Document document = new Document();
	            PdfWriter.getInstance(document, out);
	            document.open();
	            document.add(new Paragraph("Name: " + name));
	            document.add(new Paragraph("Address: " + address));
	            document.close();
	        } catch (DocumentException e) {
	            e.printStackTrace();
	        }
	}
}
