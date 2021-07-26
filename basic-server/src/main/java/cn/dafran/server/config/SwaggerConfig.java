package cn.dafran.server.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.*;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spi.service.contexts.SecurityContext;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;
import java.util.ArrayList;
import java.util.List;

/**
 * @Classname SwaggerConfig
 * @Author 6b92d6
 * @Description Swagger配置
 */
@Configuration
@EnableSwagger2
public class SwaggerConfig {

    @Bean
    public Docket createRestApi(){
        return new Docket(DocumentationType.SWAGGER_2)
                .apiInfo(apiInfo())
                //分组名称
                .select()
                //.apis(RequestHandlerSelectors.any())// 对所有api进行监控
                .apis(RequestHandlerSelectors.basePackage("cn.dafran.server.controller"))
                //选择路径
                .paths(PathSelectors.any())
                .build()
                .securityContexts(securityContexts())
                .securitySchemes(securitySchemes());
    }

    private ApiInfo apiInfo(){
        return new ApiInfoBuilder()
                .title("Swagger接口文档")
                .description("主要技术栈：Mybatis-Plus、Security、druid、Swagger2、FastDFS")
                .contact(new Contact("6b92d6","http:localhost:8089/doc.html","6b92d6g@gmail.com"))
                //许可证
                .license("Home")
                .version("1.0")
                .build();

    }

    private List<ApiKey> securitySchemes(){
        //设置请求头信息
        List<ApiKey> result = new ArrayList<>();
        //
        ApiKey apiKey = new ApiKey("Authorization", "Authorization", "Header");
        result.add(apiKey);
        return result;
    }

    private List<SecurityContext> securityContexts(){
        //设置需要认证的路径
        List<SecurityContext> result = new ArrayList<>();
        /*result.add(getContextByPath("/jiezhongdian/.*"));*/
        result.add(SecurityContext.builder()
                .securityReferences(defaultAuth())
                .forPaths(PathSelectors.regex("^(?!auth).*$"))
                .build());
        return result;
    }

    private SecurityContext getContextByPath(String pathRegex) {
        return SecurityContext.builder()
                .securityReferences(defaultAuth())
                .forPaths(PathSelectors.regex(pathRegex))
                .build();
    }

    private List<SecurityReference> defaultAuth() {
        List<SecurityReference> result = new ArrayList<>();
        AuthorizationScope authorizationScope = new AuthorizationScope("global","accessEverything");
        AuthorizationScope[] authorizationScopes = new AuthorizationScope[1];
        authorizationScopes[0] = authorizationScope;
        result.add(new SecurityReference("Authorization",authorizationScopes));
        return result;
    }
}
