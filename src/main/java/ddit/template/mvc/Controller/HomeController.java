package ddit.template.mvc.Controller;

import ddit.template.mvc.dao.DatatableDao;
import lombok.Data;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * Handles requests for the application home page.
 */
@Controller
@Data
public class HomeController {

    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
    @Inject
    DatatableDao dao;

    @GetMapping("/customLogin")
    public String login(){
        return "loginform";
    }
    @PostMapping("/logout")
    public String logout(HttpSession session){
        logger.info(session.getId());
        return "redirect:home";
    }
    @GetMapping("/fileUpload")
    public String upload() {
        return "upload";
    }


    @GetMapping("/sample/admin")
    public void adminpage(){

    }
    @GetMapping("/sample/member")
    public void memberpage(){

    }
    @GetMapping("/successlogout")
    public void successlogout(){

    }
    @GetMapping("/tree")
    public String tree(){
        return "s3-tree";
    }
    @GetMapping("/dash")
    public String dash(){
        return "dash";
    }

    @GetMapping("/ajaxtest")
    public String ajaxtest(){
        return "ajaxtest";
    }

    @RequestMapping(value = "/", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public List<Map<String, String>> home2() {
        return dao.selectTest();
    }

    @GetMapping("/ajaxtest11")
    public String ajaxtest1(){
        return "dash";
    }
    @PostMapping(value = "/ajaxtest11",consumes = "text/plain")
    @ResponseBody
    public void home3(String str) {
    }

    @GetMapping("/")
    public String fileUploadForm(Model model) {
        return "fileUploadForm";
    }

    // Handling file upload request
    @PostMapping("/fileUpload")
    public ResponseEntity<Object> fileUpload(@RequestParam("file") MultipartFile file)
            throws IOException {

        // Save file on system
        if (!file.getOriginalFilename().isEmpty()) {
            BufferedOutputStream outputStream = new BufferedOutputStream(
                    new FileOutputStream(
                            new File("D:/Upload", file.getOriginalFilename())));
            outputStream.write(file.getBytes());
            outputStream.flush();
            outputStream.close();
        }else{
            return new ResponseEntity<>("Invalid file.", HttpStatus.BAD_REQUEST);
        }

        return new ResponseEntity<>("File Uploaded Successfully.",HttpStatus.OK);
    }
}
