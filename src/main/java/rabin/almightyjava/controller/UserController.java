package rabin.almightyjava.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import rabin.almightyjava.domain.LoginCommand;
import rabin.almightyjava.domain.User;
import rabin.almightyjava.service.UserService;

@Controller
public class UserController {
// //
	@Autowired
	private UserService userService;

	@GetMapping(value = { "/", "/index" })
	public String index(@RequestParam(value = "msg", required = false) String msg, Model model) {
		if (msg.equals("reg")) {
			model.addAttribute("msg", "User Added Successfully!!!");
		}
		model.addAttribute("command", new LoginCommand());
		return "index";
	}

	// handling the user login
	@RequestMapping(value = "/user/login", method = RequestMethod.POST)
	public String handleLogin(@ModelAttribute("command") LoginCommand command, Model model, HttpSession session) {
		User loggedInUser = userService.authenticate(command.getLoginName(), command.getLoginPassword());
		if (loggedInUser != null) {
			if (checkIfBlockedOrNot(loggedInUser)) {
				model.addAttribute("msg", "Your ID is blocked.Please Contact the Admin....");
				return "index";
			} else {
				// success
				model.addAttribute("title", loggedInUser.getName());
				if (loggedInUser.getRole().equals(UserService.ROLE_ADMIN)) {
					System.out.println("I am admin");
					addUserInSession(loggedInUser, session);
					return "dashboard_admin";
				} else {
					System.out.println("I am user....");
					addUserInSession(loggedInUser, session);
					return "dashboard_user";
				}
			}
		} else {
			model.addAttribute("msg", "Invalid username or password");
			return "index";
		}

	}

	private boolean checkIfBlockedOrNot(User user) {
		if (user.getRole().equals(UserService.LOGIN_STATUS_BLOCKED)) {
			return true;
		}
		return false;
	}

	@RequestMapping(value = "/user/dashboard")
	public String userDashboard() {
		return "dashboard_user";
	}

	@RequestMapping(value = "/admin/dashboard")
	public String adminDashboard() {
		return "dashboard_admin";
	}

	// registration form
	@RequestMapping(value = "/reg_form")
	public String registrationForm(Model model) {
		model.addAttribute("user", new User());
		return "reg_form";
	}

	@RequestMapping(value = "/user/register", method = RequestMethod.POST)
	public String registerUser(@ModelAttribute("user") User user, Model model) {
		User incomingUserData = user;
		System.out.println(incomingUserData.getEmail());
		user.setRole(UserService.ROLE_USER);
		user.setLoginStatus(UserService.LOGIN_STATUS_ACTIVE);
		userService.saveUser(user);
		return "redirect:/index?msg=reg";
	}

	// maintaining the session
	private void addUserInSession(User u, HttpSession session) {
		session.setAttribute("user", u);
		session.setAttribute("userId", u.getUserId());
		session.setAttribute("role", u.getRole());
	}

}
