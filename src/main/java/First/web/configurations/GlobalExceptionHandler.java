package First.web.configurations;

import First.web.models.User;
import lombok.extern.slf4j.Slf4j;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;



@ControllerAdvice
@Slf4j
public class GlobalExceptionHandler {

    @ExceptionHandler(Exception.class)


public String handlerGenericException(Exception e, Model model){
        log.error("Handler exception:",e);
        model.addAttribute("errorMessage",e.getMessage());
        model.addAttribute("user", new User());
        return "error";
}


}
