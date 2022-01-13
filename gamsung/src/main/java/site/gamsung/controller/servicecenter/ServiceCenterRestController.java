package site.gamsung.controller.servicecenter;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import site.gamsung.service.domain.Report;
import site.gamsung.service.domain.User;
import site.gamsung.service.servicecenter.ReportService;
import site.gamsung.service.user.UserService;

@RestController
@RequestMapping("servicecenter/rest/*")
public class ServiceCenterRestController {

	// field
	@Autowired
	@Qualifier("reportServiceImpl")
	private ReportService reportService;
	
	// Constructor
	public ServiceCenterRestController() {
		System.out.println("@Controller :: " + this.getClass());
	}

	
	@PostMapping("addReport")
	public int addNotice(@ModelAttribute("report") Report report, @ModelAttribute("user") User user ,@RequestParam("files") MultipartFile[] files, HttpServletRequest req ) throws Exception {
		User receiver = reportService.findReceiverId(report);
		
		if(receiver == null) {
			return 0 ;
		}
		report.setSender(user);
		report.setReceiver(receiver);
		
		for (int i = 0; i < files.length; i++) {
			MultipartFile file = files[i];
			
			if(!file.getOriginalFilename().isEmpty()) {
				String root_path = req.getSession().getServletContext().getRealPath("/");  
				String attach_path = "uploadfiles/servicecenter/";
				String filename = file.getOriginalFilename();
				//System.out.println("==> root :: "+root_path + attach_path + filename);

				file.transferTo(new File(root_path + attach_path + filename));
				
				switch (i) {
					case 0:
						report.setReportImgFile1(filename);
						break;
					case 1:
						report.setReportImgFile2(filename);
						break;
					case 2:
						report.setReportImgFile3(filename);
						break;
					default:
						break;
				}
			}
		}
		reportService.addReport(report);
		return 1;
	}
}
