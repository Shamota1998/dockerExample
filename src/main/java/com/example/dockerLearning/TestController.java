package com.example.dockerLearning;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {

    @GetMapping("/hello")
    public ResponseEntity<String> helloWorld() {
        return ResponseEntity.ok("Hello world!");
    }

    @RequestMapping("/volume")
    public ResponseEntity<String> volume() throws Exception {

        Path filePath = Paths.get("app/data/example" + LocalDateTime.now() + ".txt");
        Files.createDirectories(filePath.getParent());
        Files.createFile(filePath);

        Files.write(filePath, "Some text".getBytes());
        return ResponseEntity.ok("File saved!");
    }
}
