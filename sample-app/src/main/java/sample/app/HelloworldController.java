package sample.app;

import io.micronaut.http.annotation.Controller;
import io.micronaut.http.annotation.Get;
import io.micronaut.http.HttpStatus;

@Controller("/helloworld")
public class HelloworldController {

    private final String dummy_string = "";
    private final String password = "password";

    @Get("/")
    public String index() {
        return "Hello to you all!" + dummy_string;
    }

    @Get("/dummy")
    public HttpStatus indexDummy() {

        if(true) {
            Integer x = 1;
        }
        return HttpStatus.OK;
    }

    /**
     * Always return true
     */
    public boolean isAvailable() {
        return false;
    }
}