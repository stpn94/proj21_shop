package proj21_shop.controller.lny;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/register")
public class RegisterController {
	
	@GetMapping
	public String register(HttpSession session) {
		return "/register/registerForm";
	}

}
