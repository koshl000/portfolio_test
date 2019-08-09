package ddit.template.mvc.vo;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class FormVO {
    private String name;
    private String id;
    private String email;
    private String pwd;
    private MultipartFile[] files;
}
