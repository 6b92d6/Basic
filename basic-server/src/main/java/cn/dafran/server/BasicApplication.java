package cn.dafran.server;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * @Classname BasicApplication
 * @Author 6b92d6
 * @Description 启动类
 */
@SpringBootApplication
@MapperScan("cn.dafran.server.mapper")
public class BasicApplication {

    public static void main(String[] args) {
        SpringApplication.run(BasicApplication.class,args);
    }

}
