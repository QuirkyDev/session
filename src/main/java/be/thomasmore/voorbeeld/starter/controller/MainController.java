package be.thomasmore.voorbeeld.starter.controller;

import be.thomasmore.voorbeeld.starter.model.User;
import be.thomasmore.voorbeeld.starter.model.UserError;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

@Controller
public class MainController {

    @RequestMapping("/")
    public String navigateIndex() {
        return "index";
    }

    @RequestMapping("/add-user")
    public String navigateAddGebruiker(Model model) {
        User user = new User();
        UserError userError = new UserError();
        model.addAttribute(User.NAME, user);
        model.addAttribute(UserError.NAME, userError);
        return "add-user";
    }

    @RequestMapping("/overview")
    public String navigateOverview() {
        return "overview";
    }

    @RequestMapping("/process-user")
    public String processStudent(HttpServletRequest request, Model model) {
        User user = new User();
        UserError userError = new UserError();

        validateVoornaam(user, userError, request.getParameter(User.FIRST_NAME));
        validateFamilienaam(user, userError, request.getParameter(User.LAST_NAME));
        validateEmail(user, userError, request.getParameter(User.EMAIL));

        if (userError.hasErrors) {
            model.addAttribute(User.NAME, user);
            model.addAttribute(UserError.NAME, userError);
            return "add-user";
        } else {
            addGebruikerToSession(request, user);
            return "overview";
        }
    }

    private void validateVoornaam(User user, UserError userError, String voornaam) {
        user.setFirstName(voornaam);
        if (voornaam.isEmpty()) {
            userError.firstName = "Enter a first name please!";
            userError.hasErrors = true;
        }
    }

    private void validateFamilienaam(User user, UserError userError, String familienaam) {
        user.setLastName(familienaam);
        if (familienaam.isEmpty()) {
            userError.lastName = "Enter a last name please!";
            userError.hasErrors = true;
        }
    }

    private void validateEmail(User user, UserError userError, String email) {
        user.setEmail(email);
        if (email.isEmpty()) {
            userError.email = "Enter an email address please!";
            userError.hasErrors = true;
        } else{
            int posAt = email.indexOf("@");
            int posDot = (posAt != -1) ? email.substring(posAt).indexOf(".") : -1;
            if (posAt == -1 || posDot == -1) {
                userError.email = "This email is invalid!";
                userError.hasErrors = true;
            }
        }
    }

    private void addGebruikerToSession(HttpServletRequest request, User user) {
        HttpSession session = request.getSession();
        ArrayList<User> myUsers = (ArrayList<User>) session.getAttribute("myUsers");
        if (myUsers == null) {
            myUsers = new ArrayList<>();
        }

        myUsers.add(user);
        session.setAttribute("myUsers", myUsers);
    }

}
