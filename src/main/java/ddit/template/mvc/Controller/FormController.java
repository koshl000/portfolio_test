package ddit.template.mvc.Controller;

import ddit.template.mvc.vo.FormVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class FormController {
    @PostMapping(value="/save")
    public String memberSave(FormVO member, BindingResult result, RedirectAttributes redirect) {

        System.out.println("이름: " + member.getName());
        System.out.println("아이디: " + member.getId());
        System.out.println("비밀번호: " + member.getPwd());
        System.out.println("이메일: " + member.getEmail());
        for(MultipartFile f:member.getFiles()){
            System.out.println("파일이름: "+ f.getOriginalFilename());
        }
        redirect.addFlashAttribute(member);
        return "redirect:/input";
    }
    @GetMapping(value="/save")
    public String memberSave(Model model) {
        FormVO form=new FormVO();
        model.addAttribute("formVO",form);
        return "upload";
    }
    @GetMapping("/input")
    public String memberInput(@ModelAttribute FormVO form) {
        // memberInput.jsp에 commandName이 'member'인 Member 객체를 넘겨줌
        return "tttt";
    }
}
