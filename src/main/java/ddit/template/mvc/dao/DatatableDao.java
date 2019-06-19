package ddit.template.mvc.dao;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository
public interface DatatableDao {
    @Select("select * from datatable_test")
    Map<String,String> selectTest();
}
