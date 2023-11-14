package servlets.curation.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import servlets.curation.domain.KidsDTO;
import servlets.curation.service.KidService;

public class KidsPrev implements CommandHandler{
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
				
			System.out.println("> KidsPrev start..");
			KidService kid = KidService.getInstance();
			List<KidsDTO> list = kid.selectList();
			
			request.setAttribute("list", list);
		
			return "/WEB-INF/views/curation/result/kidsPrev.jsp";
	}
}
