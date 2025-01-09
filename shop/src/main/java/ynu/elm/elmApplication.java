package ynu.elm;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * @author 13
 */
@MapperScan("ynu.elm.dao")
@SpringBootApplication
public class elmApplication {
    public static void main(String[] args) {
        SpringApplication.run(elmApplication.class, args);
    }
}
