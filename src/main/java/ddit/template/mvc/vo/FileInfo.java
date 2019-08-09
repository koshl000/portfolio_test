package ddit.template.mvc.vo;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.springframework.web.multipart.MultipartFile;

@Data
@NoArgsConstructor
@ToString
public class FileInfo {
    private String txt;
    private MultipartFile uploadFile;
}
