package First.web.services;

import First.web.models.Survey;
import First.web.models.User;
import First.web.repositories.SurveyRepository;
import First.web.repositories.UserRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class SurveyService {
    private final SurveyRepository surveyRepository;
    private final UserRepository userRepository;

    @Transactional
    public void saveSurvey(String category, Long price, String phoneUser, String nameUser, Principal principal){
        Survey survey = new Survey();
        survey.setCategory(category);
        survey.setPrice(price);
        survey.setPhoneUser(phoneUser);
        survey.setNameUser(nameUser);

        if(principal!=null){
            User user = userRepository.findByEmail(principal.getName());
            if(user != null){
                survey.setUser(user);
            }
        }
        //  survey.setUser(getUserByPrincipal(principal));
        surveyRepository.save(survey);
    }

    public User getUserByPrincipal(Principal principal) {
        if(principal==null) return new User();
        return userRepository.findByEmail(principal.getName());
    }

    public List<Survey> findAll(){
        return surveyRepository.findAll();
    }
}
