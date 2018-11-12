package core;

import org.junit.Before;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class superTest {
    protected ApplicationContext applicationContext;
    @Before
    public void init() {
        /*applicationContext = new ClassPathXmlApplicationContext(
                "classpath:spring/applicationContext-dao.xml",
                "classpath:spring/applicationContext-service.xml",
                "classpath:spring/applicationContext-redis.xml");*/
        applicationContext = new ClassPathXmlApplicationContext(
                "classpath:spring/*.xml");
    }

}
