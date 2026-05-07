package First.web.controllers;

import First.web.services.SurveyService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class SurveyController {
    private final SurveyService surveyService;

    @GetMapping("/survey")
    public String survey(Model model, Principal principal){
        model.addAttribute("user", surveyService.getUserByPrincipal(principal));
        return "survey";
    }

    @PostMapping("/survey")
    public  String createSurvey(@RequestParam("category") String category,
                                @RequestParam("price") Long price,
                                @RequestParam("nameUser") String nameUser,
                                @RequestParam("phoneUser") String phoneUser,
                                @RequestParam("emailUser") String emailUser,Principal principal){
        surveyService.saveSurvey(category, price, phoneUser, nameUser,emailUser, principal);
        return "redirect:/survey/thanks";
    }

    @GetMapping("/survey/thanks")
    public String thanks(Model model, Principal principal){
        model.addAttribute("user",surveyService.getUserByPrincipal(principal));
        return "survey-thanks";
    }
}
