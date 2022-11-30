package com.example.seekhelp;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class SeekhelpApplication {

    public static void main(String[] args) {
        SpringApplication.run(SeekhelpApplication.class, args);
    }

//    @Bean
//    CommandLineRunner commandLineRunner(StudentRepository studentRepository) {
//        return args -> {
//            studentRepository.save(new Student(null, "Jam", new Date(), false, 1.2));
//            studentRepository.save(new Student(null, "Jen", new Date(), true, 3.2));
//            studentRepository.save(new Student(null, "Jok", new Date(), false, 1.0));
//            studentRepository.save(new Student(null, "Jos", new Date(), false, 4.2));
//            studentRepository.findAll().forEach(p -> {
//                System.out.println(p.getName());
//            });
//        };
//    }
}
