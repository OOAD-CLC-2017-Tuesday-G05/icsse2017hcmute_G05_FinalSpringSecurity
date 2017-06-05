package com.websystique.springmvc.controller;

import java.io.IOException;
import java.math.BigDecimal;

import net.htmlparser.jericho.*;
import java.util.*;
import java.io.*;
import java.net.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.websystique.springmvc.dao.RoleDao;
import com.websystique.springmvc.model.FileBucket;
import com.websystique.springmvc.model.Role;
import com.websystique.springmvc.model.User;
import com.websystique.springmvc.model.UserDocument;
import com.websystique.springmvc.service.SecurityService;
import com.websystique.springmvc.service.UserDocumentService;
import com.websystique.springmvc.service.UserService;
import com.websystique.springmvc.util.FileValidator;
import com.websystique.springmvc.validator.UserValidator;



@Controller
@RequestMapping("/")
public class AppController {

	@Autowired
	UserService userService;
	
	@Autowired
	UserDocumentService userDocumentService;
	
	@Autowired
	MessageSource messageSource;

	@Autowired
	FileValidator fileValidator;
	
	@Autowired
    private UserValidator userValidator;
	
	@Autowired
    private SecurityService securityService;
	
	@Autowired 
    private PasswordEncoder passwordEncoder;
	
	@Autowired
    private RoleDao roleRepository;
	
	@InitBinder("fileBucket")
	protected void initBinder(WebDataBinder binder) {
	   binder.setValidator(fileValidator);
	}
	/**
	 * This method will list all existing users.
	 * @throws IOException 
	 * @throws MalformedURLException 
	 */
	@RequestMapping(value = { "/" }, method = RequestMethod.GET)
	public String getPage(ModelMap model, HttpServletRequest request) throws MalformedURLException, IOException {
		//get username
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    String name = auth.getName(); //get logged in username

	    model.addAttribute("username", name);
		
		
		String category = request.getParameter("category");
		UserDocument document;
		UserDocument deadline;
		UserDocument session;
		UserDocument keylink;
		byte[] file;
		String jsp="";
		String deadlinepage="";
		String sessionpage="";
		String keylinkpage="";
		if(category==null)
			category="home";
		document = userDocumentService.findByCategory(category);
		if(document!=null){
			file = document.getContent();
			jsp=new String(file);
		}
		
		String lastnew = loadTop3News();
		
		deadline = userDocumentService.findByCategory("important_deadlines");
		file = deadline.getContent();
		deadlinepage = new String(file);
		
		session = userDocumentService.findByCategory("special_session");
		file = session.getContent();
		sessionpage = new String(file);
		
		keylink = userDocumentService.findByCategory("key_links");
		file = keylink.getContent();
		keylinkpage = new String(file);

		model.addAttribute("leftPage", jsp);
		model.addAttribute("listtb_phong", lastnew);
		model.addAttribute("important_deadlines", deadlinepage);
		model.addAttribute("special_session", sessionpage);
		model.addAttribute("key_links", keylinkpage);
		return "jsp/ckediter";
	}
	@RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, String error, String logout) {
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        return "jsp/login";
    }
/*	@RequestMapping(value = { "/logout" }, method = RequestMethod.GET)
	public String logout(ModelMap model) throws MalformedURLException, IOException {
		
		return "redirect:/login?logout";
	}*/
	@RequestMapping(value = { "/403" }, method = RequestMethod.GET)
    public String accessDenied() {
        return "jsp/403";
    }
	
	@RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "jsp/registration";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model) {
        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "jsp/registration";
        }
        userForm.setPassword(passwordEncoder.encode(userForm.getPassword()));
        HashSet<Role> roles = new HashSet<>();
        roles.add(roleRepository.findByName("ROLE_MEMBER"));
        userForm.setRoles(roles);
        
        userService.saveUser(userForm);

        securityService.autologin(userForm.getEmail(), userForm.getPasswordConfirm());

        return "redirect:/";
    }
	@RequestMapping(value = { "/edit" }, method = RequestMethod.GET)
	public String getUploadPage(ModelMap model) throws MalformedURLException, IOException {
		return "jsp/uploadnews";
	}
	@RequestMapping(value = { "/admin/edit" }, method = RequestMethod.POST)
	public String postUploadPage(ModelMap model, @RequestParam("body") String editor, @RequestParam("description") String description) throws MalformedURLException, IOException {
		saveDocument("news" ,editor,description);
		
		return "redirect:/admin";
	}
	String category;
	@RequestMapping(value = { "/admin" }, method = RequestMethod.GET)
	public String getmanageNewsPage(ModelMap model, HttpServletRequest request) throws MalformedURLException, IOException {
		//category = request.getParameter("category");
		if( category == null)
			category="home";
		model.addAttribute("textArea", category);
		List<UserDocument> documents = userDocumentService.findAllByCategory(category);
		model.addAttribute("documents", documents);
		return "jsp/admin";
	}
	@RequestMapping(value = { "/admin" }, method = RequestMethod.POST)
	public String postmanageNewsPage(ModelMap model, HttpServletRequest request) throws MalformedURLException, IOException {
		category = request.getParameter("category");
		return "redirect:/admin";
	}
	@RequestMapping(value = { "/admin/user_list" }, method = RequestMethod.GET)
	public String getmanageUserPage(ModelMap model, HttpServletRequest request) throws MalformedURLException, IOException {

		List<User> users = userService.findAllUsers();
		model.addAttribute("users", users);
		return "jsp/manageUser";
	}
	@RequestMapping(value = { "/admin/user_list" }, method = RequestMethod.POST)
	public String postmanageUserPage(ModelMap model, HttpServletRequest request) throws MalformedURLException, IOException {
		category = request.getParameter("category");
		return "redirect:/admin";
	}
	
	int id;
	@RequestMapping(value = { "/admin/view-document-{docId}" }, method = RequestMethod.GET)
	public String viewDocuments(@PathVariable int docId, ModelMap model) {
		id = docId;
		UserDocument document = userDocumentService.findById(docId);
		byte[] file = document.getContent();
		model.addAttribute("contentValue", new String(file));
		model.addAttribute("description", document.getDescription());
		return "jsp/viewDocument";
	}
	@RequestMapping(value = { "/admin/delete-document-{docId}" }, method = RequestMethod.GET)
	public String deleteDocuments(@PathVariable int docId, ModelMap model) {
		id = docId;
		UserDocument document = userDocumentService.findById(id);
		category = document.getCategory();
		userDocumentService.deleteDocument(id);
		return "redirect:/admin";
	}
	@RequestMapping(value = { "/admin/user_list/setrole-{userid}" }, method = RequestMethod.GET)
	public String setAdmin(@PathVariable int userid, ModelMap model) {
		int uid = userid;
		User entity = userService.findById(uid);
		boolean admin=false;
		for (Iterator<Role> it = entity.getRoles().iterator(); it.hasNext(); ) {
			Role f = it.next();
			boolean b = f.getName().equals("ROLE_ADMIN");
			if(b){
				admin=true;
				break;
			}
		}
		if(!admin)
		{
			User user = new User();
			user.setId(userid);
			HashSet<Role> roles = new HashSet<>();
	        roles.add(roleRepository.findByName("ROLE_MEMBER"));
	        roles.add(roleRepository.findByName("ROLE_SUBADMIN"));
	        user.setRoles(roles);
	        userService.updateUser(user);
		}
		
		return "redirect:/admin/user_list";
	}
	@RequestMapping(value = { "/admin/user_list/deleterole-{userid}" }, method = RequestMethod.GET)
	public String deleteRole(@PathVariable int userid, ModelMap model) {
		int uid = userid;
		User entity = userService.findById(uid);
		boolean admin=false;
		for (Iterator<Role> it = entity.getRoles().iterator(); it.hasNext(); ) {
			Role f = it.next();
			boolean b = f.getName().equals("ROLE_ADMIN");
			if(b){
				admin=true;
				break;
			}
		}
		if(!admin)
		{
			User user = new User();
			user.setId(userid);
			HashSet<Role> roles = new HashSet<>();
	        roles.add(roleRepository.findByName("ROLE_MEMBER"));
	        user.setRoles(roles);
	        userService.updateUser(user);
		}
		
		return "redirect:/admin/user_list";
	}
	
	@RequestMapping(value = { "/admin/user_list/deleteuser-{userid}" }, method = RequestMethod.GET)
	public String deleteUser(@PathVariable int userid, ModelMap model) {
		int uid = userid;
		User entity = userService.findById(uid);
		boolean admin=false;
		for (Iterator<Role> it = entity.getRoles().iterator(); it.hasNext(); ) {
			Role f = it.next();
			boolean b = f.getName().equals("ROLE_ADMIN");
			if(b){
				admin=true;
				break;
			}
		}
		if(!admin)
		{
	        userService.deleteUserById(uid);
		}
		
		return "redirect:/admin/user_list";
	}
	@RequestMapping(value = { "/admin/save" }, method = RequestMethod.POST)
	public String updateDocuments(HttpServletRequest request, ModelMap model) throws IOException {
		UserDocument document = userDocumentService.findById(id);
		String content = request.getParameter("textArea");
		String description = request.getParameter("description");
		updateDocument(document.getCategory(), id,content,description);
		category = document.getCategory();
		return "redirect:/admin";
	}
	@RequestMapping(value = { "/admin/show-{docId}" }, method = RequestMethod.GET)
	public String showDocuments(@PathVariable int docId, ModelMap model) throws IOException {
		UserDocument document = userDocumentService.findById(docId);
		List<UserDocument> documents = userDocumentService.findAllByCategory(document.getCategory());
		for(int i=0;i<documents.size();i++){
			documents.get(i).setStatus("hide");
			userDocumentService.updateDocument(documents.get(i));
		}
		document.setStatus("show");
		userDocumentService.updateDocument(document);
		category = document.getCategory();
		return "redirect:/admin";
	}
	String addCategory;
	@RequestMapping(value = { "/admin/add-{category}" }, method = RequestMethod.GET)
	public String showDocuments(@PathVariable String category, ModelMap model) throws IOException {
		addCategory = category;
		return "jsp/addDocument";
	}
	@RequestMapping(value = { "/admin/add" }, method = RequestMethod.POST)
	public String addDocuments(HttpServletRequest request, ModelMap model) throws IOException {
		String content = request.getParameter("textArea");
		String description = request.getParameter("description");
		saveDocument(addCategory,content,description);
		category = addCategory;
		return "redirect:/admin";
	}
	private void saveDocument(String category, String text,String decription) throws IOException{
		UserDocument document = new UserDocument();
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	    Date date = new Date();
		document.setCategory(category);
		if(decription==null)
			document.setDescription("test");
		else
			document.setDescription(decription);
		document.setType("type/html");
		document.setContent(text.getBytes());
		document.setDatetime(dateFormat.format(date));
		document.setStatus("hide");
		userDocumentService.saveDocument(document);
	}
	private void updateDocument(String category, int id, String text,String decription) throws IOException{
		UserDocument document = new UserDocument();
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	    Date date = new Date();
	    document.setId(id);
		document.setCategory(category);
		if(decription==null)
			document.setDescription("test");
		else
			document.setDescription(decription);
		document.setType("type/html");
		document.setContent(text.getBytes());
		document.setDatetime(dateFormat.format(date));
		document.setStatus("hide");
		userDocumentService.updateDocument(document);
	}
	
	private String loadTop3News() throws IOException{
		String top3="<ul> <li>";
		List<UserDocument> documents = userDocumentService.loadTop3News();
		for(int i= 0 ; i<documents.size();i++){
			if(i>3)
				break;
			top3 += "<a href=\"?Id="+ documents.get(i).getId() + "\">"
					 +	"<p>Create " + documents.get(i).getDatetime() + "</p>"
					+	documents.get(i).getDescription().toUpperCase() + "</a></a>";
		}
		top3 += "</li></ul>";
		
		return top3;
	}
	
}
