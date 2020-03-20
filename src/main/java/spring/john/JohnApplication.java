package spring.john;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("spring.john.system.mapper")
public class JohnApplication {

    public static void main(String[] args) {
        SpringApplication.run(JohnApplication.class, args);
    }
}
