package ddit.template.mvc.dao;

import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface DatatableDao {
    List<Map<String,String>> selectTest();
}
