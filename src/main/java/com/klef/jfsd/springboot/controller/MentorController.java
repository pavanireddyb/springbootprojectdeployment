package com.klef.jfsd.springboot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Mentor;
import com.klef.jfsd.springboot.model.Project;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.service.MentorService;
import com.klef.jfsd.springboot.service.StudentService;

import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession; 
 
@Controller 
public class MentorController  
{ 
  @Autowired 
  private MentorService mentorService; 
 
  @Autowired
  private StudentService studentService;
  
     @GetMapping("mentorlogin") 
     public ModelAndView mentorlogin() 
     { 
       ModelAndView mv = new ModelAndView(); 
       mv.setViewName("mentorlogin"); 
       return mv; 
     } 
     
     @GetMapping("viewallstudents") 
     public ModelAndView viewallstudents() 
     { 
       ModelAndView mv = new ModelAndView(); 
       List<Student> studentlist = mentorService.ViewAllStudents(); 
       mv.setViewName("viewallstudents"); 
       mv.addObject("studentlist",studentlist); 
       System.out.println(studentlist.size());
       
       long count = mentorService.studentcount();
       mv.addObject("count",count);
       
       return mv; 
     } 
      
     @GetMapping("viewmystudents") 
     public ModelAndView viewmystudents() 
     { 
       ModelAndView mv = new ModelAndView(); 
       List<Student> studentlist = mentorService.ViewAllStudents(); 
       mv.setViewName("viewmystudents"); 
       mv.addObject("studentlist",studentlist); 
       System.out.println(studentlist.size());
       
       long count = mentorService.studentcount();
       mv.addObject("count",count);
       
       return mv; 
     } 
     @GetMapping("contactus")
     public ModelAndView studentcontactus()
     {
       ModelAndView mv=new ModelAndView();
       mv.setViewName("contactus");
       return mv; 
     }
   
     @GetMapping("deletestudent") 
     public ModelAndView deletestudent() 
     { 
       ModelAndView mv = new ModelAndView(); 
       List<Student> studentlist = mentorService.ViewAllStudents(); 
       mv.setViewName("deletestudent"); 
       mv.addObject("studentlist",studentlist); 
       return mv; 
     } 
      
     @GetMapping("deletestudentredirect") 
     public String deleteoperation(@RequestParam("id") int sid) 
     { 
      mentorService.deletestudent(sid); 
       
         return "redirect:/deletestudent"; //redirect to same path  
     } 
  
     @PostMapping("checkmentorlogin")
     public ModelAndView checkmentorlogin(HttpServletRequest request)
     {
       ModelAndView mv = new ModelAndView();
       
       String memail = request.getParameter("memail");
       String mpwd = request.getParameter("mpwd");
       
	Mentor mentor =  mentorService.checkmentorlogin(memail, mpwd);
       
       if(mentor!=null)
       {
       
         
         HttpSession session = request.getSession();
         session.setAttribute("mentor",mentor);
         mv.setViewName("mentorhome");
       }
       else
       {
         mv.setViewName("mentorlogin");
         mv.addObject("message", "Login Failed");
       } 
         return mv;
     }
      
     @GetMapping("mentorhome") 
     public ModelAndView mentorhome() 
     { 
       ModelAndView mv = new ModelAndView(); 
       mv.setViewName("mentorhome"); 
       
       long count = mentorService.studentcount();
       mv.addObject("count",count);
       
       return mv; 
     } 
      
     @GetMapping("mentorlogout") 
     public ModelAndView mentorlogout() 
     { 
       ModelAndView mv = new ModelAndView(); 
       mv.setViewName("mentorlogin"); 
       return mv; 
     } 
     
     @GetMapping("adminviewprojects")
     public ModelAndView viewProjects(HttpServletRequest request) {
         ModelAndView mv = new ModelAndView();
         HttpSession session = request.getSession(false);

         if (session == null) {
             mv.setViewName("mentorlogin");
             return mv;
         }

         Mentor mentor = (Mentor) session.getAttribute("mentor");

         if (mentor == null) {
             mv.setViewName("mentorlogin");
             return mv;
         }
         List<Project> projects = studentService.getProjectsByMentor(mentor);

         mv.addObject("projectslist", projects); 
         mv.setViewName("adminviewprojects");

         return mv;
     }

  
     
     
     @Autowired
     private JavaMailSender mailSender;
     @PostMapping("sendemail")
     public ModelAndView sendEmail(HttpServletRequest request) throws Exception
     {
     String name = request.getParameter("name");
     String toemail = request.getParameter("email");
     String subject = request.getParameter("subject");
     String msg = request.getParameter("message");
     MimeMessage mimeMessage = mailSender.createMimeMessage();
     MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true);

     int otp = (int)(Math.random() * 99999); // random number generation
     helper.setTo(toemail);
     helper.setSubject(subject);
     helper.setFrom("suryakiranmtechcse@gmail.com");
     String htmlContent =
     "<h3>Contact Form Details</h3>" +
     "<p><strong>Name:</strong> " + name + "</p>" +
     "<p><strong>Email:</strong> " + toemail + "</p>" +
     "<p><strong>Subject:</strong> " + subject + "</p>" +
     "<p><strong>Message:</strong> " + msg + "</p>" +
     "<p><strong>OTP:</strong> " + otp + "</p>";
     helper.setText(htmlContent, true);
     mailSender.send(mimeMessage);

     ModelAndView mv = new ModelAndView("mailsuccess");
     mv.addObject("message", "Email Sent Successfully");
     return mv;
     }
     
     
}